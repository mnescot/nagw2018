FROM drupal:8
# Add common extensions
ENV DRUPALDB=somedb
ENV DRUPALDBPASS=mypass
ENV DRUPALDBUSER=myuser
ENV DRUPALDBHOST=mysql
ENV DRUPALSALT=3433fcccfff
ENV FILESURL=https://github.com/mnescot/nagw2018/blob/master/drupal-docker-helm/html/sites/default/myfiles.tgz

RUN apt-get update && apt-get install -y mysql-client git
RUN docker-php-ext-install pdo_mysql

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install Drush 8 (master) as phar.
RUN curl -O http://files.drush.org/drush.phar
RUN mv drush.phar /usr/local/bin/drush && chmod +x /usr/local/bin/drush

# Install Drupal Console.
RUN curl http://drupalconsole.com/installer -L -o drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal && chmod +x /usr/local/bin/drupal
# VOLUME /var/www/html/drupal
COPY ./settings.php /var/www/html/sites/default
COPY ./composer.json /var/www/html
COPY ./composer.lock /var/www/html
