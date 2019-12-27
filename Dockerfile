#pull officical base image
FROM python:3.7.4-alpine

#install environment variables
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev && \
    apk add netcat-openbsd

#Set environment variables
ENV PYTHONDONTWRITEBYCODE 1
ENV PYTHONBUFFERED 1

#Set working directory
WORKDIR /usr/src/app

#Add and install requirements
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

#add entrypoint.sh
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

#Add app
COPY . /usr/src/app