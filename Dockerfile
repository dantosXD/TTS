 FROM python:3.8
# Uncomment the line above if you want to use a Dockerfile instead of templateId


RUN apt-get update 

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install TTS
COPY ./ /usr/src/app

EXPOSE 80

CMD ["python", "runserver", "0.0.0.0:80"]
