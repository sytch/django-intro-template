FROM python:3
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get -y install netcat && apt-get clean
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/