# FROM python:3.8-slim-buster

# ENV PYTHONUNBUFFERED=1

# WORKDIR /app

# ADD . /app

# COPY ./requirements.txt /app/requirements.txt

# RUN pip3 install -r requirements.txt

# COPY . /app

# EXPOSE 8000

# CMD [ "python3","manage.py","runserver"]
# syntax=docker/dockerfile:1

FROM python:3.11.2-bullseye

#set the working directory to /app
WORKDIR /app

#Copy the requirements.txt file
COPY requirements.txt requirements.txt

#install the needed packages
RUN pip3 install -r requirements.txt

#copy all the code
COPY . /app

#set the working directory 
WORKDIR /app/To-Do-App/to_do_app

EXPOSE 8000

# CMD ["python3","manage.py","runserver","0.0.0.0:8000","celery" ,"-A", "to_do_app", "worker" ,"--beat"]
CMD bash -c "python3 manage.py runserver 0.0.0.0:8000 & celery -A to_do_app worker --beat"
# celery -A to_do_app worker --loglevel=info


