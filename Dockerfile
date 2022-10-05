FROM ubuntu:18.04

RUN apt update && apt install python3-pip -y

WORKDIR /app

COPY requirements.txt .

CMD [ "python3", "./app.py" ]

EXPOSE 8080