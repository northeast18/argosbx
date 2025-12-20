FROM node:alpine

# 安装必要工具
RUN apk update && apk add --no-cache bash curl coreutils wget

# 设置工作目录
WORKDIR /app

# 复制仓库所有文件
COPY . .

# 授权脚本
RUN chmod +x *.sh

# 告诉 Koyeb 我们使用 8080 端口
EXPOSE 8080

# 启动脚本
CMD ["bash", "argosbx.sh"]
