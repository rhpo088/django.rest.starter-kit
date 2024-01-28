#
# Makefile of Django REST Starter Kit
#

o-project-name=django-rest-starterkit
o-environment=development
o-port=8000
o-user=ra-user

a-api-container=rest-api


.PHONY: help
help:
	@echo 'Makefile of ESP Portal'
	@echo '---'
	@echo '1. development-up'
	@echo ''
	@echo '   Runs the REST API application as a docker compose service in the development mode.'
	@echo ''
	@echo '   Usage:  make up-development [OPTIONS]'
	@echo ''
	@echo '   Options:'
	@echo ''
	@echo '      o-port          number  The port number on which run the web portal on the host'
	@echo '                              machine.'
	@echo '                              Optional. Default value: 8000'
	@echo '      o-user          string  The name of non-root user inside a docker container.'
	@echo '                              Optional. Default value: ra-user'
	@echo '      o-project-name  string  The name of a docker compose project.'
	@echo '                              Optional. Default value: django-rest-starterkit'
	@echo ''
	@echo '2. development-build'
	@echo ''
	@echo '   Builds the docker images of the REST API application ready to use in the development'
	@echo '   mode.'
	@echo ''
	@echo '   Usage:  make build-for-development [OPTIONS]'
	@echo ''
	@echo '   Options:'
	@echo ''
	@echo '      o-user   string    The name of non-root user inside a docker container.'
	@echo '                         Optional. Default value: ra-user'
	@echo ''
	@echo '3. prune'
	@echo ''
	@echo '   Removes the docker containers, volumes and networks.'
	@echo ''
	@echo '   Usage:  make prune'
	@echo ''
	@echo '9. pre-commit'
	@echo ''
	@echo '   Execute the pre-commit source code checks for API: isort, black, flake8 and pylint'
	@echo ''
	@echo '   Usage:  make pre-commit-api'
	@echo '---'

.PHONY: development-up
development-up:
	RA_PORT=$(o-port) RA_USER=$(o-user) \
	docker-compose --project-name $(o-project-name) --file .docker/DockerCompose.yml up --detach

.PHONY: development-build
development-build:
	docker build \
		--target development \
		--build-arg RA_ENVIRONMENT=development \
		--build-arg RA_USER=$(o-user) \
		--file .docker/Dockerfile \
		--tag django.rest.starter-kit/rest-api:development.latest .

.PHONY: prune
prune:
	@docker-compose --project-name $(o-project-name) --file .docker/DockerCompose.yml down -v

.PHONY: pre-commit
pre-commit:
	docker exec -it ${a-api-container} bash -ic \
	  'python3 -m isort --profile black $$(find restapi -name "*.py")'
	docker exec -it ${a-api-container} bash -ic \
	  'python3 -m black  --target-version=py311 --line-length=100 $$(find restapi -name "*.py")'
	docker exec -it ${a-api-container} bash -ic \
	  'python3 -m flake8 ./restapi'
	docker exec -it ${a-api-container} bash -ic \
	  'python3 -m pylint --load-plugins pylint_django --django-settings-module=restapi.settings ./restapi'

