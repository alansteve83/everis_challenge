FROM python:alpine3.7
COPY . /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y -q build-essential python-pip python-dev 
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 5000
CMD python ./index.py