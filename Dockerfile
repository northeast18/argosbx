FROM node:alpine
RUN apk update && apk add --no-cache bash curl coreutils wget
WORKDIR /app
COPY . .
RUN chmod +x *.sh
# 这里的关键是确保脚本能接收到环境变量
ENTRYPOINT ["/bin/bash", "./argosbx.sh"]
