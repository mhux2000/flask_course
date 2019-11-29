#pull officical base image
FROM python:3.7.4-alpine

#Set working directory
WORKDIR /usr/src/app

#Set environment variables
ENV PYTHONDONTWRITEBYCODE 1
ENV PYTHONBUFFERED 1

#Add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

#add app
COPY . .

#Run server
CMD python manage.py run -h 0.0.0.0