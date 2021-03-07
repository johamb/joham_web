FROM django:latest

RUN mkdir /app
WORKDIR /app
ADD . /app/

EXPOSE 8000

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]