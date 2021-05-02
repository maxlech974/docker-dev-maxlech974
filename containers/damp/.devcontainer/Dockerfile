# Possibilité de choisir ses version :  7, 7.4, 7.3
ARG VARIANT=7.4
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# Install MariaDB client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y mariadb-client \ 
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# etablit les droits pour le vscode user
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid $USER_GID vscode && usermod --uid $USER_UID --gid $USER_GID vscode; fi

# Installation de  php-mysql driver
RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY ./conf/apache2.conf /etc/apache2/apache2.conf
COPY ./conf/000-default.conf /etc/apache2/sites-enabled/000-default.conf


# Node est installé si la variable install node est à true et va récupérer une version LTS
ARG INSTALL_NODE="true"
ARG NODE_VERSION="lts/*"
RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi
#permet de réécrire les url dans le htaccess
RUN a2enmod rewrite


