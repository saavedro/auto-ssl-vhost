## Goal

This project aims to be proof of concept solution for combining multi-node 
apache with vhost managing script that also takes care of SSL generation via certbot

### How to try it out?
```
# Build and run the setup
docker-compose build
docker-compose run --scale backend=2

# simulate change in configuration
docker-compose exec backend /bin/bash

root@82510f857ee1:/var/www/html# touch /etc/apache2/sites-available/000-default.conf 
```

In the logs there will be:
```
backend_1  | Config change detected. Reloading
(...)
backend_2  | Config change detected. Reloading
```

### How it works
The setup consists of backend service running official apache2 backed php image behind an nginx in a role of a load balancer.

The most interesting is the `backend/configuration_monitor.sh` script which every two seconds checks apache2 configuration dirs for any modifications. If detected it reloads the apache2.

