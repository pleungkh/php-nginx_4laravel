# For Linux :

\#\#\# Login as root<br>
yum install git<br>
git clone https://github.com/pleungkh/php-nginx_4laravel.git<br>
cd php-nginx_4laravel/<br>
grep build README.md <br>
docker build -t pleungkh/php-nginx .<br>
docker image ls<br>
docker build -t pleungkh/php-nginx .<br>
docker create --name laravel.dv -p 80:8080 -v ~/laravel/myapp:/var/www/html pleungkh/php-nginx<br>
mkdir -p ~/laravel/myapp/public<br>
echo "<?php phpinfo(); ?>" > ~/laravel/myapp/public/index.php<

docker start laravel.dv<br>
\# log into container to check if public/index.php exists<br>
docker exec -i -t laravel.dv ash <br>
ls

\# try to browse :  http://[your_pc_ip] 

# For Mac : 

\# install Install Docker Desktop on Mac via https://docs.docker.com/desktop/install/mac-install/<br>
\# start  Docker Desktop on Mac <br>
\# enable a share directory ,  says ~/laravel/myapp/<br>
\# 		\# mkdir -p ~/laravel/myapp/public<br>
\#		\# echo "<?php phpinfo(); ?>" > ~/laravel/myapp/public/index.php<br>

\#  		Docker Desktop menu : Settings ... >  Resources > File sharing > (+)  ~/laravel/myapp/ > click [Apply & Restart]<br>

yum install git<br>
git clone https://github.com/pleungkh/php-nginx_4laravel.git<br>
cd php-nginx_4laravel/<br>
grep build README.md <br>
docker build -t pleungkh/php-nginx .<br>
docker image ls<br>
docker build -t pleungkh/php-nginx .<br>
docker create --name laravel.dv -p 80:8080 -v ~/laravel/myapp:/var/www/html pleungkh/php-nginx<br>

docker start laravel.dv<br>
\# log into container to check if public/index.php exists<br>
docker exec -i -t laravel.dv ash <br>
ls

\# try to browse :  http://[your_pc_ip]
