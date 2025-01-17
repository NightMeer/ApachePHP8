#!/bin/sh

if [ ! -d /config/apache2 ];
then
    echo "CONFIG NOT Found!"
    cp -ru /etc/apache2/ /config
else
    echo "CONFIG Found!"
    cp -ru /config/apache2/ /etc/
    cp -ru /etc/apache2/ /config    
fi

if [ ! -d /config/php ];
then
    echo "CONFIG NOT Found!"
    touch /usr/local/etc/php/php.ini
    cp -ru /usr/local/etc/php/ /config
else
    echo "CONFIG Found!"
    cp -ru /config/php/ /usr/local/etc/
    cp -ru /usr/local/etc/php/ /config
fi

chmod -R 777 /config/php/
chmod -R 777 /config/apache2/
chmod -R 777 /var/www/html/

apache2ctl -D FOREGROUND
