FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    apache2 apache2-threaded-dev \
    libapache2-mod-php5

# Configure localhost in Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
# RUN   sed -i "s|DocumentRoot /var/www/html|DocumentRoot /var/www/web|g" /etc/apache2/sites-available/000-default.conf
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
# RUN   sed -i "s|APACHE_RUN_USER=www-data|APACHE_RUN_USER=1000|g" /etc/apache2/envvars
# RUN   sed -i "s|APACHE_RUN_GROUP=www-data|APACHE_RUN_GROUP=1000|g" /etc/apache2/envvars




# ENV APACHE_RUN_USER 1000
# ENV APACHE_RUN_GROUP 1000


# Define default command
CMD ["apachectl", "-D", "FOREGROUND"]

# Expose ports 80/443... : to be override for needs
EXPOSE 80

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
