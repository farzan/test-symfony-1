# It is important to use stretch instead of buster. In buster, freetype does not work
FROM php:7.1-fpm-stretch

ARG WEB_USER
ARG WEB_GROUP
ARG PHP_ROOT_DIR

RUN apt-get update -y \
 && apt-get install -y \
  zip \
  unzip \
  sendmail \
  zlib1g-dev \
  libxpm-dev \
  libfreetype6-dev \
  libwebp-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  iputils-ping \
  wget \
  git \
  vim

COPY www.conf ${PHP_ROOT_DIR}/php-fpm.d/www.conf

RUN usermod -u 1000 ${WEB_USER} \
 && groupmod -g 1000 ${WEB_GROUP} \
 && chgrp -R staff ${PHP_ROOT_DIR}/php-fpm.d/www.conf

RUN docker-php-ext-configure gd \
  --with-gd \
  --with-freetype-dir=/usr/include/ \
  --with-webp-dir=/usr/include/ \
  --with-png-dir \
  --with-xpm-dir \
  --with-jpeg-dir=/usr/include/ && \
 docker-php-ext-install \
  mysqli \
  pdo_mysql \
  gd \
  zip \
  mbstring

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
 && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
 # Make sure we're installing what we think we're installing!
 && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
 && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
 && rm -f /tmp/composer-setup.*

RUN wget https://get.symfony.com/cli/installer -O - | bash \
  && mv /root/.symfony/bin/symfony /usr/local/bin/symfony
