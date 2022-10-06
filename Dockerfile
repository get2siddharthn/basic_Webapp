FROM ubuntu:18.04

RUN apt update && apt install python3-pip -y

WORKDIR /app

COPY requirements.txt /app

COPY templates /app/templates

COPY app.py /app

RUN pip3 install -r ./requirements.txt

CMD [ "python3", "./app.py" ]