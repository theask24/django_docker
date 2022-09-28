FROM python:3.10-alpine3.13

ENV PYTHONUNBUFFERED=1

RUN apk add --upgrade --no-cache build-base linux-headers
#RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev libmemcached-dev swig libssl-dev dpkg-dev 
RUN mkdir /code
WORKDIR /code
COPY . /code/

#RUN pip install -U pip
RUN pip install --no-cache-dir -r requirements.txt

#CMD [ "uwsgi", "--scoket", ":9000", "--workers", "4", "--master", "--enable-threads", "--module", "app.wsgi"]