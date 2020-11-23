FROM leafney/alpine-mongo-tools

RUN apk add --no-cache jq parallel
WORKDIR /app
COPY dataset/NA/master mst/NA/master
COPY dataset/JP/master mst/JP/master

COPY exec.sh exec.sh
ENV SSL --ssl
CMD ./exec.sh
