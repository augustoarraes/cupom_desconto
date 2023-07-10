FROM python:3.8-alpine
LABEL maintainer="Spotlar"

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -U -r /tmp/requirements.txt

COPY . /app
WORKDIR /app

EXPOSE 5000
#CMD ["python","app.py"]
CMD ["flask","run","-h","0.0.0.0","-p","5000"]


# Run Container:
# docker build -t spotlar.cupomdesconto:0.1 .
# docker run --name spotlar.cupomdesconto --add-host=host.docker.internal:172.17.0.1 -p 5000:5000 -d spotlar.cupomdesconto:0.1