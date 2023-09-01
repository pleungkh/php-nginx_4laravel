#!//bin/zsh
docker stop laravel.dv
docker container rm laravel.dv
docker image rm pleungkh/php-nginx

cd php-nginx_4laravel
docker build -t pleungkh/php-nginx .
docker create --name laravel.dv -p 80:8080 -v ~/laravel/myapp:/var/www/html pleungkh/php-nginx
docker start laravel.dv
# log into container
docker exec -i -t laravel.dv ash 