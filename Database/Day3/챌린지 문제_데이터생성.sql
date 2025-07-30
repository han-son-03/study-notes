-- oz_data 데이터베이스를 생성합니다.
create database oz_data;
-- oz_data 데이터베이스에서 작업합니다.
use oz_data;
-- 새로운 테이블 employees를 생성합니다
create table employees(
	id int auto_increment primary key,
    name varchar(100),
    position varchar(100),
    salary decimal(10, 2)
    );
-- 직원데이터 employees 테이블에 추가하기
insert into employees (name, position, salary)
values ('혜린', 'PM', 90000),
	   ('은우', 'frontent', 80000),
       ('가을', 'backend', 92000),
       ('지수', 'frontend', 78000),
       ('민혁', 'frontend', 96000),
       ('하온', 'backend', 130000);

