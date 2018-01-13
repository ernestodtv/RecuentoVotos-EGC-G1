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

EXPOSE 52007

ENTRYPOINT [ "sh", "start.sh"]
