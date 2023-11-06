show databases;

CREATE USER 'menu'@'%' IDENTIFIED BY 'menu';

show databases;

USE mysql;

show tables;

select * from user;

CREATE DATABASE menudb;

GRANT ALL PRIVILEGES ON menudb.* TO 'menu'@'%'; 

show grants for 'menu'@'%';

use menudb;

show tables;