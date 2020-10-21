build:
		docker-compose build

up:
		docker-compose up

load:
		docker-compose exec web python manage.py loaddata ./setup/docker/django/fixtures/data.json

shell:
		docker-compose exec web bash

migrations:
		docker-compose exec web python manage.py makemigrations

migrate:
		docker-compose exec web python manage.py migrate