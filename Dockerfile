FROM dzub2/phpnginx
RUN echo 1;
RUN wget -q "https://github.com/dzotic9/magento2nginxphp/blob/master/archive.zip?raw=true" -O /var/www/webroot/ROOT/archive.zip;\
        cd /var/www/webroot/ROOT/ && unzip -o /var/www/webroot/ROOT/archive.zip;\
        rm /var/www/webroot/ROOT/archive.zip;\
        chown -R nginx:nginx /var/www/webroot/ROOT/*;\
        echo "clear_env = no" >> /etc/php-fpm.conf;\
	curl -fsSL "https://github.com/dzotic9/magento2nginxphp/blob/master/libmcrypt-2.5.8-13.el7.x86_64.rpm?raw=true" -o /tmp/libmcrypt-2.5.8-13.el7.x86_64.rpm;\
        yum -y install /tmp/libmcrypt-2.5.8-13.el7.x86_64.rpm;\
	curl -fsSL "https://github.com/dzotic9/magento2nginxphp/blob/master/viber-4.2.2.6-8.el7.nux.x86_64.rpm?raw=true" -o /tmp/viber-4.2.2.6-8.el7.nux.x86_64.rpm;\
        yum -y install /tmp/viber-4.2.2.6-8.el7.nux.x86_64.rpm;\
	curl -fsSL "https://github.com/dzotic9/magento2nginxphp/blob/master/libtidy-0.99.0-31.20091203.el7.x86_64.rpm?raw=true" -o /tmp/libtidy-0.99.0-31.20091203.el7.x86_64.rpm;\
        yum -y install /tmp/libtidy-0.99.0-31.20091203.el7.x86_64.rpm;\
	curl -fsSL "https://github.com/dzotic9/magento2nginxphp/blob/master/libfbclient2-3.0.0.30573-11.1.x86_64.rpm?raw=true" -o /tmp/libfbclient2-3.0.0.30573-11.1.x86_64.rpm;\
        yum -y install /tmp/libfbclient2-3.0.0.30573-11.1.x86_64.rpm;
RUN sed -i 's|;extension=intl.so|extension=intl.so|g' /etc/php.ini;
RUN sed -i 's|;extension=memcache.so|extension=memcache.so|g' /etc/php.ini;
RUN sed -i 's|;extension=redis.so|extension=redis.so|g' /etc/php.ini;
RUN sed -i 's|.*extension=mysql.so|;extension=mysql.so|g' /etc/php.ini;
RUN sed -i 's|.*extension=mysqlnd_ms.so|extension=mysqlnd_ms.so\nmysqlnd_ms.multi_master = 1|g' /etc/php.ini;
