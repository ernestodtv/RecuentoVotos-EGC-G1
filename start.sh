#!/usr/bin/env bash
python manage.py makemigrations --noinput \
 && python manage.py migrate --noinput \
 && python manage.py runserver 0.0.0.0:52007