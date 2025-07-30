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
	   ('은우', 'frontend', 80000),
       ('가을', 'backend', 92000),
       ('지수', 'frontend', 78000),
       ('민혁', 'frontend', 96000),
       ('하온', 'backend', 130000);
-- oz_data 데이터베이스를 생성합니다.
create database oz_data;
-- oz_data 데이터베이스에서 작업합니다.
use oz_data;

-- name과 salary를 employees 테이블에서 조회합니다.
select name, salary from employees;
-- frontend 직책을 가진 직원중에서 연봉이 90000이하인 직원의 이름과 연봉을 조회하세요
select * from employees where position = 'frontend' and salary < 90000;
-- Pm 직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.
UPDATE employees SET salary = salary * 1.10 WHERE position = 'PM';
SELECT * FROM employees WHERE position = 'Quality Assurance';
-- 모든 backend 직책을 가진 직원의 연봉을 5%로 인상하세요.
-- 민혁 사원의 데이터를 삭제하세요
-- 모든 직원을 position 별로 그룹화하여 각 직책의 평균 연봉을 계산하세요.
-- employees 테이블을 삭제하세요.
