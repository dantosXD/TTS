FROM python:3.8.3
# Uncomment the line above if you want to use a Dockerfile instead of templateId


RUN apt-get update && apt-get upgrade -y 

COPY ./requirements.txt /
RUN pip install -r requirements.txt
COPY ./ /
RUN pip install git+https://github.com/coqui-ai/TTS

EXPOSE 80
CMD tail -f /dev/null
