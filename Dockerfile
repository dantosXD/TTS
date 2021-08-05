FROM python:3.8-slim-buster

RUN python3 -m venv /opt/venv

RUN apt-get update && apt-get upgrade -y 
# Install dependencies:
COPY requirements.txt .
RUN . /opt/venv/bin/activate && pip install -r requirements.txt

EXPOSE 80
CMD tail -f /dev/null
