FROM levkov/base:latest
MAINTAINER levkov

RUN apt-get update

RUN apt-get install -y nginx build-essential python python-dev python-pip && \
    pip install requests==2.5.3 Flask gunicorn && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

COPY conf/nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY conf/app.conf /etc/supervisor/conf.d/app.conf
COPY conf/default /etc/nginx/sites-enabled/default

ADD app /opt/app/

EXPOSE 80 9001
