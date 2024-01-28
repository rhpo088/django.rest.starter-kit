FROM python:3.11-bookworm as base

RUN apt update -y && apt upgrade -y
RUN apt install python3-dev libpq-dev netcat-traditional -y
RUN python3 -m pip install --upgrade pip

ARG RA_ENVIRONMENT="development"
ENV RA_ENVIRONMENT=${RA_ENVIRONMENT}

ARG RA_USER="ra-user"
ENV USER=${RA_USER}

# Add none root user
RUN adduser --shell /bin/bash --disabled-password --gecos "" ${RA_USER}
USER ${RA_USER}

ENV HOME /home/${RA_USER}
WORKDIR ${HOME}

COPY --chown=${RA_USER} ./src/requirements/ ./requirements
RUN python3 -m pip install -r requirements/${RA_ENVIRONMENT}.txt

# Copy all necessary files
COPY --chown=${RA_USER} ./src/manage.py .
COPY --chown=${RA_USER} ./src/restapi/ ./restapi
ENV PYTHONPATH ${PYTHONPATH}:${HOME}/restapi


FROM base as development

COPY --chown=${RA_USER} ./src/.flake8 .
COPY --chown=${RA_USER} ./src/.pylintrc .

COPY --chown=${RA_USER} ./.docker/entrypoints/${RA_ENVIRONMENT}.sh /usr/bin/restapi.sh
RUN chmod +x /usr/bin/restapi.sh

ENTRYPOINT ["restapi.sh"]
