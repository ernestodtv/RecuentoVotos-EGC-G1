FROM python:2.7-alpine

RUN mkdir /home/RecuentoVotos-EGC-G1

ADD requirements.txt /home/RecuentoVotos-EGC-G1/requirements.txt
RUN cd /home/RecuentoVotos-EGC-G1 && pip install --no-cache-dir -r requirements.txt

ADD . /home/RecuentoVotos-EGC-G1

WORKDIR /home/RecuentoVotos-EGC-G1

ENV DATABASE_URL: g1_mariadb
ENV DATABASE_PORT: 3306
ENV DATABASE_VOTE_USER: votaciones-user
ENV DATABASE_VOTE_PASS: votaciones-user-1928

RUN python manage.py makemigrations --noinput \
 && python manage.py migrate --noinput \
 && python manage.py test --noinput

EXPOSE 52007

ENTRYPOINT [ "python", "manage.py", "runserver",  "0.0.0.0:52007"]
