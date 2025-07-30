-- oz_test database 생성
create database oz_test;
-- 생성한 database 선택
use oz_test;
-- users, products 테이블 생성
create table users(
name varchar(20),
address varchar(100) primary key
);

create table product (
name varchar(100),
price decimal(10,2)
);

-- users 테이블 내 데이터 삽입
Insert into users(name, address) values
('Jhon Doe', '123main st');
-- product 테이블 내 데이터 삽입
Insert into product(name, price) values
('toycar', '19.99');

