FROM docker:18-dind

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    ncurses \
    git \
    openssh-client \
    zip \
  && rm -rf /var/cache/apk/*

RUN pip install docker-compose

RUN pip install awscli

ENV DOCKER_DRIVER overlay

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/sh"]
