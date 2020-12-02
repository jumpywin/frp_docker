#version: 0.0.1
FROM ubuntu:18.04
MAINTAINER jumpwin "jumpy@outlook.com"
ENV LANG C.UTF-8
ENV time  2020.12.2.10
RUN mkdir /frp
ADD frpc /frp/frpc
ADD frps /frp/frps
ADD frpc.ini /frp/frpc.ini
ADD frpc.ini /frp/frps.ini
RUN chmod +x /frp/frpc
RUN chmod +x /frp/frps
WORKDIR /frp
CMD nohup ./frps -c frps.ini > frps.out && ./frpc -c frpc.ini
EXPOSE 50066/tcp
