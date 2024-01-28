#!/bin/bash

echo -e "\033[32m> Start REST API Server:\033[m"
echo -e "\033[32m>> 1. Wait for database service:\033[m"
while ! nc -z ${RA_POSTGRES_HOST} ${RA_POSTGRES_PORT}; do sleep 1; done;

echo -e "\033[32m>> 2. Run migrations:\033[m"
python3 ${HOME}/manage.py migrate

echo -e "\033[32m>> 3. Run dev server:\033[m"
python3 ${HOME}/manage.py runserver 0.0.0.0:80
