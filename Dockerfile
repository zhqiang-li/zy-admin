FROM eclipse-temurin:17-jre-focal AS builder
# FROM amazoncorretto:17.0.7-alpine
EXPOSE 30001

VOLUME /tmp
ADD zy-admin.jar zy-admin.jar
# 使用 apline 作为基础镜像需要安装以下字体
# RUN apk add --no-cache fontconfig ttf-dejavu
RUN /bin/sh -c 'touch zy-admin.jar'
ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
ENTRYPOINT ["java","-jar","zy-admin.jar"]