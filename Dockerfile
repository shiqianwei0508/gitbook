FROM node:6-slim

MAINTAINER sqw <sqwei2012@gmail.com>

ARG VERSION=3.2.2

LABEL version=$VERSION

RUN npm install --global gitbook-cli &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear &&\
	rm -rf /tmp/*
COPY copyPluginAssets.js /root/.gitbook/versions/3.2.2/lib/output/website/
WORKDIR /srv/gitbook
#COPY book.json /srv/gitbook/
#RUN gitbook install
VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve
