FROM alpine:latest
LABEL maintainer="Koen Rouwhorst <koenrh@framer.com>"

LABEL "com.github.actions.name"="Merge Approved Pull Request"
LABEL "com.github.actions.description"="Merged pull requests that have been approved."
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="green"

RUN	apk add --no-cache \
	bash \
	ca-certificates \
	curl \
	jq

COPY merge-pull-request /usr/bin/merge-pull-request

ENTRYPOINT ["merge-pull-request"]
