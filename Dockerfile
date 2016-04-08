FROM dzub2/nginxphp
RUN wget "https://github.com/dzotic9/magento2nginxphp/blob/master/archive.zip?raw=true" -O /var/www/webroot/ROOT/archive.zip;\
        cd /var/www/webroot/ROOT/ && unzip -o /var/www/webroot/ROOT/archive.zip;\
        rm /var/www/webroot/ROOT/archive.zip;\
        chown -R nginx:nginx /var/www/webroot/ROOT/*;\
        echo "clear_env = no" >> /etc/php-fpm.conf;\
        yum -y install libmcrypt;\
        yum -y install ftp://ftp.pbone.net/mirror/li.nux.ro/download/nux/dextop/el7Server/x86_64/viber-4.2.2.6-8.el7.nux.x86_64.rpm;
