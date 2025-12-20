FROM node:alpine
RUN apk update && apk add --no-cache bash curl coreutils wget
WORKDIR /app
COPY . .
RUN chmod +x *.sh
CMD ["bash", "argosbx.sh"]
