#!//bin/zsh
docker stop laravel.dv
docker container rm laravel.dv
docker image rm php-nginx:1.0
docker build -t php-nginx:1.0 .
docker create --name laravel.dv -p 80:8080 -v ~/laravel/myapp:/var/www/html php-nginx:1.0
docker start laravel.dv
docker exec -i -t laravel.dv ash
