#import unittest

from flask import json, Flask
from flask_testing import LiveServerTestCase
from app import app

class TestDesconto(LiveServerTestCase):

    def create_app(self):
        app = Flask(__name__)
        app.config['TESTING'] = True
        # Default port is 5000
        app.config['LIVESERVER_PORT'] = 8943
        # Default timeout is 5 seconds
        app.config['LIVESERVER_TIMEOUT'] = 10
        return app


    def test_cadastroDesconto(self):
        resp = self.app.post('/v1/cupomdesconto', json={
                                                        "codigo": "spot15",
                                                        "data_expiracao": "07-07-2024 23:59:00",
                                                        "max_utilizacao": 50,
                                                        "min_compra": 200,
                                                        "tp_desconto": "percentual",
                                                        "qtd_desconto": 15,
                                                        "is_publico": False,
                                                        "is_primeira_compra": False
                                                    })
        assert resp.status_code == 200
    

    def test_consumoDesconto(self):
        resp = self.app.put('/v1/cupomdesconto', json={
                                                        "id_compra": 5,
                                                        "valor_compra": 1000,
                                                        "codigo_cupom": "spot15",
                                                        "primeira_commpra": False
                                                    })
        assert resp.status_code == 200