FROM alpine:3.9.3@sha256:28ef97b8686a0b5399129e9b763d5b7e5ff03576aa5580d6f4182a49c5fe1913
LABEL maintainer="Koen Rouwhorst <koenrh@framer.com>"

LABEL "com.github.actions.name"="Merge approved pull request"
LABEL "com.github.actions.description"="Automatically merge approved pull requests."
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="green"

RUN	apk add --no-cache \
      bash \
      ca-certificates \
      curl \
      jq

COPY merge-pull-request /usr/bin/merge-pull-request

ENTRYPOINT ["merge-pull-request"]
