#!/bin/bash
echo 'hello world'
cd /root/
git clone https://github.com/pecorasmarrita/JavaServerCodeAnywhere.git
cd /root/JavaServerCodeAnywhere
mvn clean compile assembly:single
service mysql start && mysql -u root -proot < /root/JavaServerCodeAnywhere/webserver_db.sql && java -jar /root/JavaServerCodeAnywhere/target/MyApplication-jar-with-dependencies.jar
