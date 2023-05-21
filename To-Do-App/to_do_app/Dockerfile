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

FROM python:3.8-slim-buster

WORKDIR /app

COPY ./To-Do-App/to_do_app/requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
