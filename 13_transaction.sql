/* Transaction */

/*
 * commit
 * Transaction 처리에 사용되는 sql 명령문 중 하나로,
 * Transaction 데이터베이스 작업의 논리적인 단위를 나타내며
 * 여러 sql 문을 하나의 Transaction으로 그룹화할 수 있으며 데이터베이스의 일관성을 유지하고
 * 데이터 무결성을 보장하기 위해서 중요한 내용이다
 * 
 * 
 * RollBack
 * mysql에서 트랜잭션 처리에 사용되는 sql 명령문 중 하나로 트랜잭션은
 * 데이터베이스의 작업의 논리적인 단위를 나타내며, 여러 sql 문을 하나의 트랜잭션으로
 * 그룹화할 수 있다. Rollback을 사용하면 트랜잭션 내에서 수행한 변경 사항을 취소하고
 * 이전 상태로 되돌릴 수 있다.
 * */

-- autoCommit을 활성화 시킴
SET autocommit = 1;

-- autoCommit을 활성화 시
SET autocommit = ON;

-- autoCommit을 비활성화 시킴
SET autocommit = 0;

-- autoCommit을 비활성화 시킴
SET autocommit = OFF;


-- @Transaction;
-- 데이터 베이스의 상태의 변화를 시킬 수 있는 일련의 행위의 묶음을 Transaction이라고 한다.
START TRANSACTION;
SELECT * FROM tbl_menu;
INSERT INTO tbl_menu VALUES(NULL, '바나나해장국', 8500, 4, 'Y');
UPDATE tbl_menu SET menu_name = '수정된 메뉴' WHERE menu_code = 5;
DELETE FROM tbl_menu WHERE menu_code = 7;
SELECT * FROM tbl_menu;
ROLLBACK;
SELECT * FROM tbl_menu;


