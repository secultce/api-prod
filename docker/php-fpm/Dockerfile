# Use uma imagem base oficial do PHP com FPM
FROM php:8.2-fpm

# Instale dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Instale extensões do PHP necessárias para o Laravel e php-amqplib
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath sockets

# Instale o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Defina o diretório de trabalho
WORKDIR /var/www

# Copie TODOS os arquivos do projeto para a imagem
COPY . /var/www

# Instale as dependências do Composer
RUN composer install --no-dev --optimize-autoloader

# Ajuste permissões (opcional, mas recomendado para Laravel)
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage

# Exponha a porta do PHP-FPM (opcional, já que é usado internamente)
EXPOSE 9000

# Comando padrão para rodar o PHP-FPM
CMD ["php-fpm"]