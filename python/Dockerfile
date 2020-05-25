FROM python:alpine3.7
COPY . /app
WORKDIR /app
RUN sudo apt-get update
RUN sudo apt-get install -y -q build-essential python-pip python-dev python-simplejson
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
CMD python ./index.py