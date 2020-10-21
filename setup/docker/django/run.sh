#!/bin/bash

echo "Wait for Database"
echo ${MYSQL_SERVICE_HOST}
until nc -v -w30 ${MYSQL_SERVICE_HOST} 3306
do
  echo "Waiting for database connection..."
  sleep 5
done

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python manage.py migrate

# Start server
echo "Starting server"
python manage.py runserver 0.0.0.0:8000 --insecure