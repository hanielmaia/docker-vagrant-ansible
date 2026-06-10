FROM nginx:latest

RUN apt-get update && \
    apt-get install -y iputils-ping curl && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'user nginx;\n\
worker_processes auto;\n\
error_log /var/log/nginx/error.log notice;\n\
pid /var/run/nginx.pid;\n\
\n\
events {\n\
    worker_connections 1024;\n\
}\n\
\n\
stream {\n\
    upstream webserver_backend {\n\
        server webserver:80;\n\
    }\n\
\n\
    server {\n\
        listen 8080;\n\
        proxy_pass webserver_backend;\n\
    }\n\
}' > /etc/nginx/nginx.conf

EXPOSE 8080
