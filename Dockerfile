FROM ubuntu:18.04

RUN apt update && apt install python3-pip -y

WORKDIR /app

COPY . .

CMD [ "python3", "./app.py" ]