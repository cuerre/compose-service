FROM achetronic/laravel-php



#### LARAVEL PRE-STEPS
# Getting arguments
ARG GIT_APPLICATION=https://github.com/laravel/framework.git

#### LARAVEL OPERATIONS
# Installing system temporary packages
RUN apt-get install -y -qq --force-yes composer git zip unzip php7.3-zip --no-install-recommends > /dev/null

# Creating a temporary folder for our app
RUN mkdir -p /tmp/laravel

# Download the entire project
RUN git clone $GIT_APPLICATION /tmp/laravel

# Create needed folders for composer autoloader optimization
RUN mkdir -p /var/www/database
RUN mkdir -p /var/www/database/seeds
RUN mkdir -p /var/www/database/factories

# Defining which packages Composer will install
# RUN cp /tmp/laravel/composer.lock /var/www/composer.lock
RUN cp /tmp/laravel/composer.json /var/www/composer.json

# Please, Composer, install them
# RUN composer install -d /var/www --no-dev --no-scripts
RUN composer install -d /var/www --no-scripts

# Moving Laravel to the right place
RUN cp -r /tmp/laravel/* /var/www
RUN rm -rf /tmp/laravel
RUN touch /var/www/.env

# Setting the configurations values for Laravel
RUN cd /var/www && composer dump-autoload

# Applying configurations
RUN php /var/www/artisan key:generate
RUN php /var/www/artisan config:cache
# RUN php /var/www/artisan storage:link --quiet
# RUN php /var/www/artisan migrate --force --quiet --no-interaction
# RUN php /var/www/artisan db:seed --force --quiet --no-interaction

# Deleting system temporary packages
RUN apt-get purge -y -qq --force-yes composer git zip unzip php7.3-zip > /dev/null

# Cleaning the system
RUN apt-get -y -qq --force-yes autoremove > /dev/null

# Changing permissions of the entire Laravel
RUN chown www-data:www-data -R /var/www/
RUN find /var/www -type f -exec chmod 644 {} \;
RUN find /var/www -type d -exec chmod 755 {} \;



#### FINAL OPERATIONS
RUN rm -rf /init.sh && touch /init.sh
RUN echo "#!/bin/bash" >> /init.sh
RUN echo "service php7.3-fpm start" >> /init.sh
RUN echo "php /var/www/artisan config:cache" >> /init.sh
RUN echo "/bin/bash" >> /init.sh
RUN chown root:root /init.sh
RUN chmod +x /init.sh
EXPOSE 9000
CMD /init.sh
