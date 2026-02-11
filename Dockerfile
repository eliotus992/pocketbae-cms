FROM alpine:latest

WORKDIR /pb

RUN apk add --no-cache ca-certificates unzip wget \
    && wget -O pocketbase.zip https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_linux_amd64.zip \
    && unzip pocketbase.zip \
    && rm pocketbase.zip \
    && chmod +x pocketbase

RUN mkdir -p /pb/pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]
