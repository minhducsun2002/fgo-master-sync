FROM leafney/alpine-mongo-tools

RUN apk add --no-cache jq
WORKDIR /app
COPY dataset/NA mst/NA
COPY dataset/JP mst/JP

COPY exec.sh exec.sh

CMD ./exec.sh
