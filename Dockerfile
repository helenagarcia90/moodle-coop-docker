FROM php:5.6-apache

# Install dependencies
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y vim \
    && apt-get install -y git \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo_mysql mbstring zip exif pcntl

# Main directory
WORKDIR /var/www/

# Moodle repo
RUN git clone https://github.com/helenagarcia90/moodle-unilurio.git moodle

# Permissions
RUN chown -R www-data:www-data /var/www/
