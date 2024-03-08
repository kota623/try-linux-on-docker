# MySQL用のカスタムUbuntuイメージを作成するDockerfile
FROM ubuntu:latest

# 環境変数を設定する
ENV MYSQL_ROOT_PASSWORD=rootpassword \
    MYSQL_DATABASE=sample_database \
    MYSQL_USER=user \
    MYSQL_PASSWORD=password

# MySQLのインストール
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/* && \
    service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" && \
    mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
    mysql -e "GRANT ALL ON *.* TO '$MYSQL_USER'@'%';" && \
    mysql -e "FLUSH PRIVILEGES;"

# MySQLサーバーの設定
RUN sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0\.0\.0\.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# ポート3306を公開する
EXPOSE 3306

# MySQLサーバーを起動する
CMD ["mysqld_safe"]