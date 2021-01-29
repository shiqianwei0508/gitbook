FROM node:6-slim

MAINTAINER sqw <sqwei2012@gmail.com>

ARG VERSION=3.2.2

LABEL version=$VERSION

RUN npm install --global gitbook-cli &&\
	npm install --global gitbook-plugin-back-to-top-button &&\
	npm install --global gitbook-plugin-chapter-fold &&\
	npm install --global gitbook-plugin-code &&\
	npm install --global gitbook-plugin-splitter &&\
	npm install --global gitbook-plugin-search-pro &&\
	npm install --global gitbook-plugin-insert-logo &&\
	npm install --global gitbook-plugin-custom-favicon &&\
	npm install --global gitbook-plugin-pageview-count &&\
	npm install --global gitbook-plugin-tbfed-pagefooter &&\
	npm install --global gitbook-plugin-popup &&\
	npm install --global gitbook-plugin-sharing-plus &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear &&\
	rm -rf /tmp/*

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve
