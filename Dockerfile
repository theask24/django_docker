FROM python:3.10-alpine3.13

ENV PYTHONUNBUFFERED=1

RUN apk add --upgrade --no-cache build-base linux-headers
RUN apt-get update && apt-get install -y docker-ce
RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN usermod -a -G docker django
USER django

RUN pip install -U pip
RUN pip install -r requirements.txt

CMD [ "uwsgi", "--scoket", ":9000", "--workers", "4", "--master", "--enable-threads", "--module", "app.wsgi"]