FROM python:3.7-alpine as mmbot

WORKDIR /opt/mmbot/

RUN apk add --no-cache \
    python3-dev \
    gcc \
    g++ \
    linux-headers \
    libc-dev \
    git \
    gfortran \
    lapack-dev \
  && pip install --upgrade pip \
  && pip install numpy \
  && git clone https://github.com/egaus/MaliciousMacroBot /tmp/mmbot/ \
  && cd /tmp/mmbot/ \
  && pip install . \
  && rm -rf /tmp/mmbot/ \
  && apk del --purge \
    python3-dev \
    gcc \
    g++ \
    linux-headers \
    libc-dev \
    git \
    gfortran \
    lapack-dev

