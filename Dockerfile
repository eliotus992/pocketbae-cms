FROM alpine:latest

WORKDIR /pb

# 下载 PocketBase（修正文件名格式）
RUN apk add --no-cache ca-certificates unzip wget \
    && wget -O pocketbase.zip "https://github.com/pocketbase/pocketbase/releases/download/v0.36.2/pocketbase_0.36.2_linux_amd64.zip" \
    && unzip pocketbase.zip \
    && rm pocketbase.zip \
    && chmod +x pocketbase

RUN mkdir -p /pb/pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/pb_data"]    
