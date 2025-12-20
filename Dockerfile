FROM node:alpine

# 安装必要工具
RUN apk update && apk add --no-cache bash curl coreutils wget

# 设置工作目录
WORKDIR /app

# 复制所有文件
COPY . .

# 授权
RUN chmod +x *.sh

# 暴露端口
EXPOSE 8080

# 这里的逻辑：先执行 env 将变量打印出来（方便排查），再运行脚本
CMD ["/bin/bash", "-c", "export $(strings /proc/1/environ | grep '='); bash argosbx.sh"]
