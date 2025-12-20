FROM node:alpine

# 安装必要的依赖
RUN apk update && apk add --no-cache bash curl coreutils

# 设置工作目录
WORKDIR /app

# 将仓库所有文件复制到镜像中
COPY . .

# 给所有脚本授权
RUN chmod +x *.sh

# 告诉 Koyeb 或 Docker 运行哪个脚本
# 这个脚本会读取你设置的环境变量（UUID, ARGO_AUTH 等）
CMD ["bash", "argosbx.sh"]
