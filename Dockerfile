FROM python:3.8.3
# Uncomment the line above if you want to use a Dockerfile instead of templateId


RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential g++ bash git curl -y

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
COPY ./ /usr/src/app

EXPOSE 80

CMD ["python", "0.0.0.0:80"]
