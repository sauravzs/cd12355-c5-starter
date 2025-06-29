FROM python:3.10-slim-buster

# DB_USERNAME, DB_PASSWORD value needs to be passed during run
# ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase

WORKDIR /src

RUN apt update -y
RUN apt install -y build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel

COPY ./analytics/requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY ./analytics .

RUN echo "Now starting application"

ENTRYPOINT ["python3", "app.py"]