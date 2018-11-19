FROM node:latest

ENV HOME /data
WORKDIR /data

EXPOSE 3000
ENV http_proxy http://107.117.239.50:3128
ENV https_proxy http://107.117.239.50:3128
ENV HTTP_PROXY http://107.117.239.50:3128
ENV HTTPS_PROXY http://107.117.239.50:3128
ENV no_proxy 107.117.239.74
ENV NO_PROXY 107.117.239.74

RUN set -ex;                                \
    chmod a+w /data;                        \   
    npm install -g json-server;
RUN set -xe;                                \
    groupadd -g 1001 jsonserver;            \
    useradd -u 1001 -g 1001 -m jsonserver;  \
    chown -R jsonserver:jsonserver /data

RUN set -ex;                                \
    chmod a+w /data;                        \   
    npm intall json-concat --save;	
	
## ADD run.sh /run.sh
RUN chmod +x /run.sh
USER 1001
ENTRYPOINT ["bash", "/run.sh"]