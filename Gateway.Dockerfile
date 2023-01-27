#immagine di base
FROM nginx

#copio i file di configurazione
COPY nginx_conf/nginx.conf /etc/nginx/nginx.conf
COPY nginx_conf/api_gateway.conf /etc/nginx/api_gateway.conf
COPY nginx_conf/api_backends.conf /etc/nginx/api_backends.conf
COPY nginx_conf/api_json_errors.conf /etc/nginx/api_json_errors.conf
COPY nginx_conf/api_conf /etc/nginx/api_conf
