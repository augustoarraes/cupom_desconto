
import requests, json, os, datetime
from sqlalchemy.ext.declarative import declarative_base
from model import db, CupomDescontoModel, LogCupomDescontoModel
from flask import Response



"""
    Regras de Negócio da Aplicação: Cupons de Desconto
"""

def cadastroCupomDesconto(data):
    cupom = CupomDescontoModel.query.filter( CupomDescontoModel.codigo == data['codigo'] ).first()
    if cupom is None:
        cupom = CupomDescontoModel(
            codigo = data['codigo'],
            data_expiracao = data['data_expiracao'],
            max_utilizacao = data['max_utilizacao'],
            min_compra = data['min_compra'],
            tp_desconto = data['tp_desconto'],
            qtd_desconto = data['qtd_desconto'],
            is_publico = data['is_publico'],
            is_primeira_compra = data['is_primeira_compra']
        )
        db.session.add(cupom)
        db.session.commit()
        return {'msg': f'Cupom de Desconto {cupom.codigo} cadastrado com sucesso!'}
    return {'msg': f'Cupom de Desconto já existe. Cadastre novo Cupom.'}


def consumoCupomDesconto(data):
    cupom = CupomDescontoModel.query.filter( CupomDescontoModel.codigo == data['codigo_cupom'] ).first()
    data['data_uso'] = datetime.datetime.now() # hoje
    is_valido, msg = validacaoDesconto(data, cupom)
    if not is_valido:
        return {'msg': msg}
    else:
        status_cupom, valor_desconto = calculaDesconto(data, cupom)
        registraUsoDesconto(data)
        res = {"status_cupom": status_cupom, "valor_desconto": valor_desconto, "cupom": str(cupom)}
        return res

def validacaoDesconto(data, cupom):
    msg = ""
    is_valido = True
    utilizacoes_cupom = LogCupomDescontoModel.query.filter( LogCupomDescontoModel.codigo_cupom == data['codigo_cupom'] ).count()
    if not (data['data_uso'] < cupom.data_expiracao):
        is_valido = False
        msg = f'Cupom expirado. Expirou em {cupom.data_expiracao}.'
    elif utilizacoes_cupom >= int(cupom.max_utilizacao):
        is_valido = False
        msg = f'Cupom já atingiu o limite de uso.'
    elif float(data['valor_compra'] < cupom.min_compra):
        is_valido = False
        msg = f'Valor da compra é inferior para utilizar o Cupom de Desconto. Adicione mais itens no seu carrino de compra!'
    return is_valido, msg

def calculaDesconto(data, cupom):
    desconto = 0
    status_cupom = 'válido'
    if cupom.tp_desconto == 'percentual':
        desconto = data['valor_compra'] - data['valor_compra']*(cupom.qtd_desconto/100)
    elif cupom.tp_desconto == 'fixo' and cupom.is_publico:
        desconto = data['valor_compra']-cupom.qtd_desconto
    elif cupom.tp_desconto == 'fixo' and cupom.is_primeira_compra:
        desconto = data['valor_compra']-cupom.qtd_desconto
    elif cupom.tp_desconto == 'fixo' and not cupom.is_primeira_compra:
        status_cupom = 'inválido'
    return status_cupom, desconto

def registraUsoDesconto(data):
    logCupom = LogCupomDescontoModel(
        id_compra = data['id_compra'],
        codigo_cupom = data['codigo_cupom'],
        data_uso = data['data_uso']
    )
    db.session.add(logCupom)
    db.session.commit()