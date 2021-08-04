 FROM python:3.8
# Uncomment the line above if you want to use a Dockerfile instead of templateId


RUN apt-get update 
COPY ./requirements.txt /
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80
