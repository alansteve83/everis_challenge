FROM ubuntu:latest

RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv

RUN mkdir app
COPY . /app
RUN virtualenv /app/env/
RUN /app/env/bin/pip install flask
WORKDIR /app
CMD env/bin/python index.py