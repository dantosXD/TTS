FROM python:3.8-slim-buster
RUN apt-get update && apt-get upgrade -y 
COPY requirements.txt .
RUN python3 -m venv /opt/venv
RUN . /opt/venv/bin/activate && pip install -r requirements.txt
CMD tail -f /dev/null
EXPOSE 80
