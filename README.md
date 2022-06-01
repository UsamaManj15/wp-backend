# Word Predictor Backend
- Python 3.10
- Django 4.0.4

## Getting started
- Install Docker.
- Run `bash deploy-dev.sh` and wait for setup to complete.
- Django will run at `http://127.0.0.1:8002` once setup the previous step is complete.
- To stop all running containers press `Ctrl+C` once and wait for graceful shutdown.
- After making any changes in `requirements.txt` run `bash deploy-dev.sh build` to install new dependencies.

## Running Django commands
- SSH into container: `docker exec -it wp-django /bin/bash`.
- Create super user: `python manage.py createsuperuser`.
- Create cache table: `python manage.py createcachetable`.

## Code quality checks
- Install [pre-commit](https://pre-commit.com/) in your system.
- Run `pre-commit install` in root directory of the project to install pre-commit hooks.
