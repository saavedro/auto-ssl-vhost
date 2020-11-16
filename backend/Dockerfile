FROM php:7.4-apache

VOLUME /etc/apache2

COPY index.php /var/www/html/
COPY run_monitor_apache.sh configuration_monitor.sh ./

CMD ["./run_monitor_apache.sh"]
