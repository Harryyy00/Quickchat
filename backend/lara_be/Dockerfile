# Use PHP 8.3 FPM with Nginx for Laravel
FROM php:8.3-fpm

# Install system dependencies and PHP extensions for Laravel
RUN apt-get update && apt-get install -y \
    nginx \
    zip \
    unzip \
    git \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    curl

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Set working directory
# WORKDIR /var/www/html
WORKDIR /app
COPY . /app

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy Laravel project files
COPY . .

# Install Laravel dependencies
RUN composer install

# Expose port 80
EXPOSE 80

# Start the PHP-FPM service
CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000
