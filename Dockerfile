FROM drvelasquezq/php-8-apache2-bookworm:1.0.0

RUN apt-get update && \
    apt install -y zip && \
    apt-get clean
    
# php

# extensiones que se evidenciaron necesarias en el proyecto yii2 con comando:
# composer create-project --prefer-dist yiisoft/yii2-app-basic basic

RUN apt install php8.2-zip -y && \
    apt install php8.2-curl -y && \
    apt install php8.2-dom -y && \
    apt install php8.2-mbstring -y && \
    apt install php8.2-gd -y && \
    apt install php8.2-imagick -y && \
    apt install php8.2-intl -y && \
    apt-get clean
