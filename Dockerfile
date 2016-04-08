FROM dzub2/nginxphp
RUN wget "https://github.com/dzotic9/magento2nginxphp/blob/master/archive.zip?raw=true" -O /var/www/webroot/ROOT/archive.zip;\
        cd /var/www/webroot/ROOT/ && unzip -o /var/www/webroot/ROOT/archive.zip;\
        rm /var/www/webroot/ROOT/archive.zip;\
        chown -R nginx:nginx /var/www/webroot/ROOT/*;\
        echo "clear_env = no" >> /etc/php-fpm.conf;\
        yum -y install libmcrypt;\
        yum -y install ftp://ftp.pbone.net/mirror/li.nux.ro/download/nux/dextop/el7Server/x86_64/viber-4.2.2.6-8.el7.nux.x86_64.rpm;
RUN yum -y install ftp://ftp.muug.mb.ca/mirror/fedora/epel/7/x86_64/l/libtidy-0.99.0-31.20091203.el7.x86_64.rpm;
RUN yum -y install ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/mkubecek:/firebird30:/ipv6/SLE_11_SP3/x86_64/libfbclient2-3.0.0.30573-11.1.x86_64.rpm;
RUN sed -i 's|;extension=intl.so|extension=intl.so|g' /etc/php.ini;
