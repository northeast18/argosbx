FROM node:alpine

# 安装必要工具
RUN apk update && apk add --no-cache bash curl coreutils wget

# 设置工作目录
WORKDIR /app

# 复制所有文件
COPY . .

# 授权
RUN chmod +x *.sh

# 暴露端口（虽然 Koyeb 有设置，但这里声明一下更稳）
EXPOSE 8080

# 修改启动命令：运行脚本，并在后面加一个“永不退出”的进程
CMD bash argosbx.sh && tail -f /dev/null
