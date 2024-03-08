# Docker Compose 環境におけるMySQL操作ガイド

このガイドでは、Docker Composeを使用して立ち上げた環境において、UbuntuコンテナからMySQLコンテナに接続し、データベースの操作を行う手順を説明します。
いつも使用している `Ruby on Rails` などのフレームワークに付属しているORM `ActiveRecord` の裏側がふわっと理解してもらえると嬉しいです。

## 前提条件

- DockerおよびDocker Composeがインストールされていること。
- `docker-compose.yml` ファイルが設定されており、サービスが起動していること。

## 手順

### 1. Ubuntuコンテナへのアクセス

まず、実行しているUbuntuコンテナにアクセスします。

```bash
docker exec -it ubuntu_container /bin/bash
```

### 2. シェルスクリプトの作成と実行
   テーブル作成スクリプト (create_table.sh)
   テーブルを作成するスクリプトです。
```aidl
#!/bin/bash
mysql -h custom_mysql_container -u root -p'yourpassword' <<EOF
CREATE DATABASE IF NOT EXISTS exampledb;
USE exampledb;
CREATE TABLE IF NOT EXISTS users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL
);
EOF
```
実行権限を与えて実行します。
```aidl
chmod +x create_table.sh
./create_table.sh
```
データ挿入スクリプト (insert_data.sh)
データを挿入するスクリプトです。
```aidl
#!/bin/bash
mysql -h custom_mysql_container -u root -p'yourpassword' exampledb <<EOF
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@example.com');
EOF
```
実行権限を与えて実行します。
```aidl
chmod +x insert_data.sh
./insert_data.sh
```
データ選択（確認）スクリプト (select_data.sh)
挿入されたデータを確認するスクリプトです。
```aidl
#!/bin/bash
mysql -h custom_mysql_container -u root -p'yourpassword' exampledb <<EOF
SELECT * FROM users;
EOF
```
実行権限を与えて実行します。
```aidl
chmod +x select_data.sh
./select_data.sh
```
データ削除スクリプト (delete_data.sh)
特定のデータを削除するスクリプトです。
```aidl
#!/bin/bash
mysql -h custom_mysql_container -u root -p'yourpassword' exampledb <<EOF
DELETE FROM users WHERE name = 'Alice';
EOF
```
実行権限を与えて実行します。
```aidl
chmod +x delete_data.sh
./delete_data.sh
```
これで、テーブルの作成、データの挿入、データの選択（確認）、およびデータの削除までのシェルスクリプトを使用した自動化手順が完了です。

## ex. envを登録してファイル内のenv設定を削除しよう

1. 各 *_data.sh に記載している以下の記述を削除しても動く状態にします。
```
MYSQL_HOST="custom_mysql_container"
MYSQL_USER="root"
MYSQL_PASS="yourpassword"
MYSQL_DB_NAME="exampledb"
MYSQL_TABLE_NAME="users"
```

