/* DDL (Data Definition Language) - 데이터베이스의 구조 변경 */

/* Create */
-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정
-- column_name data_type(length) [not null] [default value] [auto_increment] column_constraint;
-- 데이터의 이름 | 어떤 데이터타입(길이)| 제약 조건  |   등록시 초기값   |                | 

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY, -- 제약조건
	fk INT,
	col1 varchar(255),
	check(col1 IN ('Y', 'N')) -- CHECK 제약조건
) ENGINE = INNODB;

DESCRIBE tb1;

-- INSERT INTO tb1 VALUES(1, 10, 'f'); f 대신 Y or N 만 가능 
INSERT INTO tb1 VALUES(3, 10,'N');
SELECT * FROM tb1;

DROP TABLE tb2;

/* Auto_Increment */
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.
CREATE TABLE IF NOT EXISTS tb2 (
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	col1 varchar(225),
	CHECK (col1 IN ('y','n'))
) ENGINE = INNODB;

DESCRIBE tb2;

INSERT INTO tb2 VALUES (NULL, 10 ,'Y'); -- y는 대소문자 안가리지만 상태를 표시할 때는 대문자를 넣자
SELECT * FROM tb2;
INSERT INTO tb2 VALUES (NULL, 10,'n');
SELECT * FROM tb2;
-- y,n이 아니라 에러남 (check 제약조건에 위배됨)
-- INSERT INTO tb2 VALUES (30, 'f');

-- alter
-- 테이블에 추가/변경/수정/삭제하는 모든 것을 alter 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하므로 대표적인 것만 살펴본다.
ALTER TABLE tb2
ADD col2 int NOT NULL;
DESCRIBE tb2;

-- DROP = 테이블에 컬럼을 삭제하는 명령
ALTER TABLE tb2
DROP COLUMN col2;
DESCRIBE tb2;

-- 열의 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_fk int NOT NULL; 
-- CHANGE COLUMN change_fk fk; -- 대상 컬럼의 값을 덮어씌운다는 느낌, 이름만 수정은 불가능하고 나머지 형식도 모두 명시해줘야 한다.
DESCRIBE tb2;

-- 열의 제약 조건 추가 및 삭제
-- 실행시 auto increment로 인해 오류가 발생된다.
-- ALTER TABLE tb2
-- DROP PRIMARY KEY;

-- auto increment 가 걸려 있는 컬럼은 primary key 제거가 안되므로, auto increment를 modify 명령으로 제거한다.
ALTER TABLE tb2
MODIFY pk int;

-- auto increment 옵션을 제거하여 primary key 제약 조건을 제거할 수 있다.
ALTER TABLE tb2
DROP PRIMARY KEY;

-- primary key 제약조건 추가
ALTER TABLE tb2
ADD PRIMARY KEY(pk);

DESCRIBE tb2;

-- 컬럼 여러개 추가
ALTER TABLE tb2
ADD col3 date NOT NULL,
ADD col4 TINYINT NOT NULL;
DELETE FROM tb2;

DESCRIBE tb2;

-- DATE 형이 0으로 추가가 안되는 것은 mysql 5.7 버전 이후 select @@Global.sql_mode 했을 때
-- 나온 결과 ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,
-- NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
-- 에서 no_zero_date 때문이며 0으로 채워진 Date 컬럼이 존재하면 안되기 때문이다.

SELECT @@GLOBAL.SQL_MODE;
SET GLOBAL sql_mode = ''; 

SELECT * FROM tb2;


/* Drop */
-- 테이블을 삭제하기 위한 구문
-- IF EXISTS를 적용하면 존재하지 않는 테이블 삭제 구문이라도 에러가 발생하지 않는다.

-- drop [TEMPORARY] table [IF EXISTS] table_name [, table_name]...

-- tb3 테이블 생성
CREATE TABLE IF NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y','N'))
)ENGINE = INNODB;

DROP TABLE IF EXISTS tb3; -- 존재하면 삭제, 아님 말고 (에러 안남)
-- 삭제하고자 하는 테이블이 없는 경우 아래의 코드는 에러를 발생시킨다.
-- 보통 테이블 생성 구문은 여러개의 테이블을 한번에 생성하기 때문에 아래와 같은 오류가 발생하면 열받는다.
-- DROP TABLE tb3; 에러 발생

SHOW tables;

-- 다중 삭제를 해서 여러개의 테이블을 생성한다.
CREATE TABLE IF NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y','N'))
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS tb4(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y','N'))
)ENGINE = INNODB;

SHOW tables;

-- 여러 개의 테이블을 삭제하는 경우 아래와 같이 ,로 나열한다.
-- DROP TABLE tb3, tb4;
DROP TABLE IF EXISTS tb3, tb4;
SHOW tables;

-- 테이블을 초기화 하는 구문
CREATE TABLE IF NOT EXISTS tb5(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y','N'))
)ENGINE = INNODB;
SHOW tables;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
SELECT * FROM tb5;

DELETE 
  FROM tb5
 WHERE pk = 4;

SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');

TRUNCATE tb5;

SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');