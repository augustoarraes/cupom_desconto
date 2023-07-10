SPOTLAR :: Cumpo de Desconto

Executando rápido o projeto: 
```bash
docker-compose up -d
```

Importe a coleção de chamadas `spotlar.postman_collection.json` REST no seu Postman.
- 1: Primeiramente, cadastre (chamadas `POST`) os Cupons de Desconto
- 2: Em seguida, está pronto para consumir (chamadas `PUT`) os Cupons de Desconto. Num PGAdmin, é possível acompanhar a evolução do consumo do cupons no banco de dados.
- 3: Testes Unitários: testando com Docker `docker exec -it spotlar_spotlar_1 py.test --cov=app`. Ou sem docker, num virtualenv `py.test --cov=app`.

** Para executar o projeto sem Docker é necessário configurar um ambiente virtual para a aplicação e em `init.py` apontar o banco para `localhost`.