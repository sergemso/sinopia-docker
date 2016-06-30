FROM mhart/alpine-node

MAINTAINER Sergey Strebulaev <strebulaev@gmail.com>

RUN mkdir -p /sinopia/storage/cache \
  && apk add --no-cache make gcc g++ python \
  && npm i -g js-yaml sinopia2 \
  && npm cache clean \
  && apk del make gcc g++ python \
  && chmod -R g+rw /sinopia \
  && chgrp -R daemon /sinopia

WORKDIR /sinopia
USER daemon

ADD config.yaml /sinopia/config.yaml

EXPOSE 4873
VOLUME /sinopia/storage

CMD ["sinopia"]
