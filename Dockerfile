FROM python:3.10-alpine3.13

ENV PYTHONUNBUFFERED=1

RUN apk add --upgrade --no-cache build-base linux-headers

RUN mkdir /code
WORKDIR /code
COPY . /code/


RUN adduser --disabled-password --no-create-home django
USER django

RUN pip install -U pip
RUN pip install -r requirements.txt

CMD [ "uwgi", "--scoket", ":9000", "--workers", "4", "--master", "--enable-threads", "--module", "app.wsgi"]