FROM python:3.9.7-slim-buster
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends git curl python3-pip ffmpeg \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && npm i -g npm \
    && pip3 install --no-cache-dir -U pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app
WORKDIR /app
RUN pip3 install --no-cache-dir -U -r requirements.txt
CMD python3 main.py