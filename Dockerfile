FROM python:3.8.3
# Uncomment the line above if you want to use a Dockerfile instead of templateId


RUN apt-get update \
&& apt-get upgrade -y \

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install -r requirements.txt
COPY ./ /usr/src/app


EXPOSE 80
