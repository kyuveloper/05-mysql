/* DML (Data Manipulation Language) */

-- insert, update, delete, select (dql)
-- 데이터 조작언어, 테이블에 값을 삽입하거나, 수정하거나 삭제하는거나, 조회하는 언어

-- 컬럼을 기술하지 않는 경우
-- 대상 TABLE에 컬럼 순서를 따라간다.
-- 값을 등록하는 경우에 아래의 내용을 주의해야한다.
-- 1. 데이터 타입 ex) varchar(8)
--				case 1 : column(varchar(8)) = 10 <- 숫자를 넣는 경우
--				case 2 : column(varchar(8)) = "8자리 이상의 문자열을 넣는 경우"
-- 2. 제약조건
-- 	제약조건에 위배되는 값을 넣을 수 없다.(제약조건 종류 이후 확인)
INSERT INTO tbl_menu VALUES (
	NULL,
	'바나나해장국',
	8500,
	4,
	'Y'
);

-- 아래와 같이 서브 쿼리를 추가해서 값을 넣는 것도 가능하다.
INSERT INTO tbl_menu  VALUES(
   NULL, -- menu_code
   '순대국밥', -- menu_name
   8500, -- menu_price
   (SELECT category_code FROM tbl_category WHERE category_name = '한식'), -- status
   'Y'
);


-- 컬럼을 기술하는 경우 ..

-- 컬럼의 순서를 변경하는 경우
-- 순서에 맞게 값을 넣어주면 된다.
INSERT INTO tbl_menu 
	(
		menu_code, -- 작성 안해도됨 
		menu_name,
		menu_price,
		category_code,
		orderable_status
	)
VALUES ( -- 위와 순서, 개수를 맞게
	NULL, -- menu_code 작성안해도됨 
	'바나나해장국', -- menu_name
	8500, -- menu_price
	4, -- category_code
	'Y' -- status
);

SELECT * FROM tbl_menu;

-- 값을 한번에 여러개 등록하는 경우
-- value 뒤에 (), 를 추가로 기술하면 된다.
INSERT INTO tbl_menu 
VALUES 
(NULL, '참치맛아이스크림', 1700, 12, 'Y'),
(NULL, '멸치맛아이스크림', 1500, 11, 'Y'),
(NULL, '소시지맛커피', 2500, 8, 'Y');


-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
-- 테이블의 전체 행 개수는 변화가 없다.
SELECT
	menu_code,
	category_code
  FROM tbl_menu 
 WHERE menu_name = '바나나해장국';
 

-- update 구문
UPDATE tbl_menu 
	SET menu_name = '델몬트바나나'
 WHERE menu_name = '바나나해장국'; -- 모든 데이터 이름이 바뀌니까 꼭 WHERE 문을 작성해야함..
 
SELECT * FROM tbl_menu WHERE menu_name = '델몬트바나나';



-- update 조건에서 sub query 사용하기
-- 아래의 서브쿼리는 오류가 발생한다.
-- 아래의 경우 오라클 및 포스트그래스 sql에서는 오류가 발생하지 않으나, mysql은 변경하고자 하는 대상 테이블을 참조하는 서브쿼리를 만드는 경우 오류가 발생한다.
UPDATE tbl_menu 
	SET category_code = 6
  WHERE menu_price (
  					SELECT menu_price
  		  			  FROM tbl_menu
  		 			 WHERE menu_name = '델몬트바나나'
  		 		   );
  		 		   
-- 위의 오류를 해결하기 위해서는 아래와 같이 가상의 테이블을 형성해서 작업을 진행한다.
-- update의 경우 컬럼의 타입과 제약조건을 신경써서 값을 수정해야 한다.
-- 1. 데이터 타입 ex) varchar(8)
--				case 1 : column(varchar(8)) = 10 <- 숫자를 넣는 경우
--				case 2 : column(varchar(8)) = "8자리 이상의 문자열을 넣는 경우"
-- 2. 제약조건
-- 	제약조건에 위배되는 값을 넣을 수 없다.(제약조건 종류 이후 확인)	  		 		  
UPDATE tbl_menu 
	SET category_code = 6
  WHERE menu_price IN (
  					SELECT menu_price
  		  			  FROM (SELECT * FROM tbl_menu) AS a
  		 			 WHERE menu_name = '델몬트바나나'
  		 			);

SELECT * FROM tbl_category;


-- delete
-- delete의 경우 제약조건을 따지지 않으나 유일하게 따지는 것은 fk 제약 조건이다.
-- 우리의 실습 데이터에서 예시를 들면.. 
-- tbl_category 라는 테이블은 tbl_menu 에서 참고하고 있는 상태이다.
-- 이러한 경우 tbl_category를 삭제하고자 할 때 fk 제약조건에 옵션을 지정해야 삭제가 가능하며
-- 옵션에 따라 삭제가 가능하거나 불가능하게 된다.
-- 만약 삭제가 가능한 옵션을 지정하는 경우 NULL로 변경된다.
DELETE FROM tbl_menu
WHERE menu_name = '델몬트바나나';

-- delete limit
DELETE FROM tbl_menu
	ORDER BY menu_code DESC
	LIMIT 2;

-- 테이블의 값을 전체 삭제하는 경우
-- DELETE FROM tbl_menu (전체삭제됨)

SELECT 
	* 
  FROM tbl_menu
 WHERE orderable_status = 'Y';
 
-- 현업에서는 데이터를 중요하게 관리해야 하기 때문에 delete query를 잘 사용하지 않으며
-- 삭제를 해야하는 경우 아래와 같이 상태를 업데이트 하는 방식으로 진행한다.
UPDATE tbl_menu 
   SET orderable_status = 'N'
 WHERE menu_code = 26; -- 보통 delete 대신 이렇게 상태를 변경하면서 사용한다. (예: 판매중지) 
 
 
-- insert 시 primary key 또는 unique key가 충돌이 발생할 수 있다면
-- replace를 통해 중복 된 데이터를 덮어 쓸 수 있다.
-- INSERT INTO tbl_menu VALUES (17, '참기름 라뗴', 5000, 10, 'Y');
REPLACE INTO tbl_menu VALUES (17, '참기름 라떼', 5000, 10, 'Y'); -- 그 칸에 없으면 추가, 있으면 수
REPLACE INTO tbl_menu VALUES (27, '더벤티 참기름 라떼', 5000, 10, 'Y');
SELECT * FROM tbl_menu;