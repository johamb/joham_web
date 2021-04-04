FROM python:3.9-slim

RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY src/ /app/

COPY .env /.env
# RUN ( set -a; . /.env; set +a; python manage.py collectstatic --noinput)
# RUN rm /.env

COPY gunicorn_settings.py /gunicorn_settings.py

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["gunicorn", "-c", "/gunicorn_settings.py", "-e", "DJANGO_SETTINGS_MODULE=config.settings", "wsgi:application"]