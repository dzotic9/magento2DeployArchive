FROM dzotic/nginxphp
RUN echo 1;\
        wget -q "https://github.com/dzotic9/magento2nginxphp/blob/master/archive.zip?raw=true" -O /var/www/webroot/ROOT/archive.zip;\
        cd /var/www/webroot/ROOT/ && unzip -o /var/www/webroot/ROOT/archive.zip;\
        rm /var/www/webroot/ROOT/archive.zip;\
        yum -y install openssh-server;\
        chown -R nginx:nginx /var/www/webroot/ROOT/*;\
        echo "clear_env = no" >> /etc/php-fpm.conf;
RUN curl -fsSL "https://github.com/dzotic9/magento2nginxphp/blob/master/libmcrypt-2.5.8-13.el7.x86_64.rpm?raw=true" -o /tmp/libmcrypt-2.5.8-13.el7.x86_64.rpm;\
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
RUN sed -i 's|.*mysqlnd_ms.enable = 1|mysqlnd_ms.enable = 1|g' /etc/php.ini;
RUN sed -i 's|.*mysqlnd_ms.config_file.*|mysqlnd_ms.config_file=/var/lib/jelastic/mysqlnd_ms.json|g' /etc/php.ini;
RUN curl -fsSL "https://download.jelastic.com/public.php?service=files&t=75aac0f89e53f018fc0aedd5687ec868&download" -o /var/lib/jelastic/mysqlnd_ms.json;
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf2;\
        curl -fsSL "https://download.jelastic.com/public.php?service=files&t=26dba40e5d349cc93aa831fec342a3eb&download" -o /etc/nginx/nginx.conf;
RUN sed -i 's|.*extension=xsl.so|;extension=xsl.so|g' /etc/php.ini;
RUN sed -i 's|.*extension=gd.so|;extension=gd.so|g' /etc/php.ini;
