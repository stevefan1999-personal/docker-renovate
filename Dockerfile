FROM renovate/renovate

ENV RENOVATE_CONFIG "{}"
ENV RENOVATE_CONFIG_FILE "/tmp/renovate.json"

USER root
RUN apk add bash

WORKDIR /tmp
COPY run.sh /tmp

USER node
ENTRYPOINT "/tmp/run.sh"
