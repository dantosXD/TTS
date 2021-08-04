FROM python:3.7-alpine
# Uncomment the line above if you want to use a Dockerfile instead of templateId

RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev make
RUN apk update && apk upgrade && \
    apk add --no-cache make g++ bash git openssh postgresql-dev curl

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY ./ /usr/src/app

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
