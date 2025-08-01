FROM alpine:3.21 AS namespace
RUN apk update && apk add --no-cache tini iproute2

COPY ./start.sh .
RUN chmod +x ./start.sh

ENTRYPOINT ["tini", "--", "./start.sh"] 
