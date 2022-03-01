echo "Start to install dependencies, current time is:"  `date`
sudo yum -y update
cd /home/ec2-user/

# Python dependencies
# sudo yum -y install epel-release
sudo yum install -y python3
sudo yum install -y python3-pip
# sudo pip3 install --upgrade pip
# sudo yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel
# sudo wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
# sudo tar xzf Python-3.9.6.tgz 
# cd Python-3.9.6 
# sudo ./configure --enable-optimizations
# sudo make altinstall
# python3.9 -V
# cd /home/ec2-user/


# sudo yum install epel-release
# sudo yum install python3-pip
# pip --version


# sudo yum install libmysqlclient-dev
# sudo pip3 install mysqlclient


# echo "11111111111111111111111111111111111111111111111"
# # Mysql dependencies
# sudo yum install -y mariadb-server mariadb
# echo "2222222222222222222222222222222222222"
# sudo systemctl enable mariadb.service
# sudo systemctl start mariadb.service
# echo "3333333333333333333333333333333333333"
# sudo mysqladmin -u root password Huawei12#$
# echo "54444444444444444444444444444444444"


sudo wget https://repo.mysql.com//mysql80-community-release-el7-3.noarch.rpm

# 安装rpm
sudo rpm -Uvh mysql80-community-release-el7-3.noarch.rpm
# sudo sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
# sudo yum --enablerepo=mysql80-community install mysql-community-server


# yum 安装mysql服务
sudo yum install -y mysql-community-server
sudo systemctl enable mysqld.service
# 启动mysql服务
sudo systemctl start mysqld.service

# 查看mysql服务状态
sudo systemctl status mysqld.service

# 查看安装的mysql密码
sudo grep 'temporary password' /var/log/mysqld.log

TEMP_PWD=$(sudo grep 'temporary password' /var/log/mysqld.log)
PWD=${TEMP_PWD##* }
# echo "${PWD}"

# # 登录
# sudo mysql -uroot -p${PWD}

# # 进入到mysql命令行时，修改密码
# # 修改密码
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'Huawei12#$';

# # 使用新密码登陆
# exit

# sudo mysql -uroot -pHuawei12#$



sudo mysqladmin -uroot -p${PWD} password Huawei12#$

sudo mysql -uroot -pHuawei12#$ <<EOF
create database login_signup character set utf8;
EOF



sudo yum install -y unzip
unzip webservice.zip
cd /home/ec2-user/webservice
ls -a


sudo pip3 install -r requirements.txt
sudo pip3 install pymysql
# sudo yum install python3-devel
# sudo pip3 install mysqlclient
# sudo pip3 install MySQL-python
cd /home/ec2-user/
# sudo mysql -uroot -p123456 <<EOF
# DROP DATABASE IF EXISTS webservice;
# CREATE DATABASE webservice;
# USE webservice;
# DROP TABLE IF EXISTS user;
# CREATE TABLE user (
#   id char(50) NOT NULL, Constraint pk_User_id PRIMARY KEY (id),  # 待优化, 不应该拿非线性数据如字符串做索引
#   first_name char(30) NOT NULL,
#   last_name char(30) NOT NULL,
#   username char(50) NOT NULL unique,
#   password char(100) NOT NULL,
#   account_created timestamp NOT NULL,
#   account_updated timestamp NOT NULL
# ) ENGINE=InnoDB default charset=utf8;
# EOF



# ls -a
cd /home/ec2-user/webservice/DjangoAPI
# ls -a
sudo python3 manage.py makemigrations
sudo python3 manage.py migrate
# echo "1111111111111Start to install dependencies, current time is:"  `date`
# sudo python3 manage.py runserver 0.0.0.0:8000
# echo "2222222"
cd /home/ec2-user/


ls -a
# webservice
sudo cp webservice.service /usr/lib/systemd/system
echo "5555555555555555555"
sudo systemctl daemon-reload
echo "666666666666666666665"
sudo systemctl enable webservice.service
echo "7777777777777777777775"
sudo systemctl start webservice.service
# sudo systemctl stop webservice.service

