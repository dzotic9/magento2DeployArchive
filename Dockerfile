FROM dzub2/nginxphp
COPY deploy/ /var/www/webroot/ROOT/
RUN chown -R nginx:nginx /var/www/webroot/ROOT/*\
        yum install libmcrypt;\
        yum -y install ftp://ftp.pbone.net/mirror/li.nux.ro/download/nux/dextop/el7Server/x86_64/viber-4.2.2.6-8.el7.nux.x86_64.rpm;\
        yum -y install ftp://ftp.pbone.net/mirror/li.nux.ro/download/nux/dextop/el7Workstation/x86_64/viber-4.2.2.6-8.el7.nux.x86_64.rpm
