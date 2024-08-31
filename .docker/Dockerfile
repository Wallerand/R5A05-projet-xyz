FROM php:8.3-apache

# Install packages
RUN apt-get update \
    && apt-get install -y gnupg gosu curl ca-certificates zip unzip git \
        libxml2-dev libzip-dev libicu-dev libcap2-bin libpng-dev librsvg2-bin

# Install XDebug
RUN pecl install xdebug

# Install and configure extensions
RUN docker-php-ext-configure gd \
    && docker-php-ext-install pdo_mysql zip opcache gd intl \
    && docker-php-ext-enable xdebug intl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /app

# Change Apache web root and enable modules
ENV APACHE_DOCUMENT_ROOT /app/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN a2enmod rewrite

# Expose port and start Apache
EXPOSE 80
CMD ["apache2-foreground"]