FROM ghcr.io/pocketbase/pocketbase:latest

WORKDIR /pb

RUN mkdir -p /pb/pb_data

EXPOSE 8090
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]
