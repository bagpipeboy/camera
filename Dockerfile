FROM resin/%%RESIN_MACHINE_NAME%%-python

# switch on systemd init system in container
ENV INITSYSTEM on

# workaround to deactivate picamera custom build,
# as it keeps us from building the docker image on a non-pi machine
ENV READTHEDOCS True

# pip install python deps from requirements.txt
# For caching until requirements.txt changes
COPY ./requirements.txt /requirements.txt

RUN pip install --upgrade pip && pip install -r /requirements.txt

COPY . /usr/src/app
WORKDIR /usr/src/app

CMD ["bash","start.sh"]

