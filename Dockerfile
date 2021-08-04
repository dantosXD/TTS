FROM python:3.7-alpine
# Uncomment the line above if you want to use a Dockerfile instead of templateId

RUN apk update && apk upgrade

RUN apk add --no-cache tesseract-ocr python3 py3-numpy && \
    pip3 install --upgrade pip setuptools wheel && \
    apk add --no-cache --virtual .build-deps gcc g++ zlib-dev make python3-dev py-numpy-dev jpeg-dev && \
    pip3 install matplotlib && \
    apk del .build-deps
        
RUN apk update && apk upgrade && \
    apk add --no-cache make g++ bash git openssh postgresql-dev curl

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY ./ /usr/src/app

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
