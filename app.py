from flask import request, jsonify
from init import app
import os
from util import HTTP_METHODS
from business import cadastroCupomDesconto, consumoCupomDesconto


"""
    Endpoints da Aplicação: Cupons de Desconto
"""
@app.route('/v1/cupomdesconto', methods=['POST'])
#@token_required
def cadastro_cupomdesconto():
    return jsonify( cadastroCupomDesconto(request.get_json()) ), 200

@app.route('/v1/cupomdesconto', methods=['PUT'])
#@token_required
def consumo_cupomdesconto():
    return jsonify( consumoCupomDesconto(request.get_json()) ), 200




"""
    Endpoints de tratamentos HTTP
"""
@app.route('/', methods=HTTP_METHODS)
def index():
    return "Resource not found", 400

@app.route('/v1/cliente/check', methods=['GET'])
#@swag_from('get_check.yml')
def getStatus():
    return jsonify( {"status": "Chamado bem sucedido!"} ), 200

@app.errorhandler(500)
def internal_error(error):
    return "500 error", 500

@app.errorhandler(404)
def not_found(error):
    return "404 error", 404


"""
    Start App
"""
app.run(host=os.environ.get("APP_HOST"), port=5000, debug=True)