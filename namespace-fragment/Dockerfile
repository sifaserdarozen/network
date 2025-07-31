FROM alpine:3.21 AS namespace-fragment 
RUN apk update && apk add --no-cache tini iproute2 tcpdump

COPY ./start.sh .
RUN chmod +x ./start.sh

ENTRYPOINT ["tini", "--", "./start.sh"] 
