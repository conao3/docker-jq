FROM ubuntu:bionic AS build

MAINTAINER Naoya Yamashita (@conao3)

ARG JQ_VER=1.6

# jq 1.5, 1.6
ARG SOURCE=https://github.com/stedolan/jq/releases/download/jq-$JQ_VER/jq-linux64
# jq 1.3, 1.4
# ARG SOURCE=https://github.com/stedolan/jq/releases/download/jq-$JQ_VER/jq-linux-x86_64

WORKDIR /usr/local/bin/
RUN apt update
RUN apt -y install curl
RUN curl -o /usr/local/bin/jq$JQ_VER -L $SOURCE
RUN chmod +x /usr/local/bin/jq$JQ_VER

##############################
FROM alpine:3.8

ARG JQ_VER=1.6

COPY --from=build /usr/local/bin/jq$JQ_VER /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/jq$JQ_VER", "-C"]
CMD [""]