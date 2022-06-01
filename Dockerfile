FROM python:3.10-slim-buster

ENV PYTHONUNBUFFERED 1
ENV DOCKER_CONTAINER 1
ENV PYTHONFAULTHANDLER 1
ENV LIBRARY_PATH /lib:/usr/lib

# Add Django user as id 1000.
RUN addgroup --gid 1000 django \
  && useradd --uid 1000 -g django django

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install build-essential libpq-dev \
  && pip install psycopg2-binary --no-binary psycopg2-binary \
  && pip install --disable-pip-version-check --no-cache-dir django_managepy_anywhere

WORKDIR /app

COPY README.md .
COPY requirements.txt .
COPY --chown=django:django . /app/

RUN mkdir -p ./media && chown -R django:django ./media
RUN mkdir -p ./collect_static && chown -R django:django ./collect_static
RUN pip install --disable-pip-version-check --no-cache-dir -r requirements.txt

# Act as Django user from now on.
USER django

# ENTRYPOINT ["tini", "--"]
CMD python manage.py migrate --noinput && python manage.py runserver_plus --keep-meta-shutdown 0.0.0.0:8000
