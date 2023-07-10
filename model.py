from init import db
import datetime


class CupomDescontoModel(db.Model):
    __tablename__ = 'SPOTLAR_CUPOM_DESCONTO'

    id = db.Column(db.Integer(), primary_key=True)
    codigo = db.Column(db.String()) # uuid
    data_expiracao = db.Column(db.DateTime)
    data_criacao = db.Column(db.DateTime) # vigencia do cupom
    max_utilizacao = db.Column(db.Integer())
    min_compra = db.Column(db.Double())
    tp_desconto = db.Column(db.String())
    qtd_desconto = db.Column(db.Integer()) # de acordo com o tp_desconto
    is_publico = db.Column(db.Boolean())
    is_primeira_compra = db.Column(db.Boolean())

    def __init__(self, codigo, data_expiracao, max_utilizacao, min_compra, 
                tp_desconto, qtd_desconto, is_publico, is_primeira_compra):
        self.codigo = codigo
        self.data_expiracao = datetime.datetime.strptime(data_expiracao, '%m-%d-%Y %H:%M:%S')
        self.data_criacao = datetime.datetime.now().strftime("%m-%d-%Y %H:%M:%S.%f")
        self.max_utilizacao = max_utilizacao
        self.min_compra = min_compra
        self.tp_desconto = tp_desconto
        self.qtd_desconto = qtd_desconto
        self.is_publico = is_publico
        self.is_primeira_compra = is_primeira_compra

    def __repr__(self):
        return f"Cupom de Desconto {self.codigo} validade {self.data_expiracao}"
    

class LogCupomDescontoModel(db.Model):
    __tablename__ = 'SPOTLAR_CUPOM_DESCONTO_LOG'

    id = db.Column(db.Integer(), primary_key=True)
    id_compra = db.Column(db.Integer()) # propondo a mais na modelagem
    codigo_cupom = db.Column(db.String())
    data_uso = db.Column(db.DateTime)

    def __init__(self, id_compra, codigo_cupom, data_uso):
        self.id_compra = id_compra
        self.data_uso = data_uso
        self.codigo_cupom = codigo_cupom