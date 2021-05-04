FROM alpine:latest
MAINTAINER Qiang Guo aduse001@163.com

# 设置阿里源
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/alpine/g' /etc/apk/repositories

# 安装 git 和 ssh
RUN apk update && apk add git && apk add openssh

# 初始化 ssh
RUN mkdir ~/.ssh \
    && touch ~/.ssh/id_rsa \
    && chmod 600 ~/.ssh/id_rsa \
    && touch ~/.ssh/id_rsa.pub \
    && chmod 644 ~/.ssh/id_rsa.pub

# 设置东八区时区
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone \
    && apk del tzdata