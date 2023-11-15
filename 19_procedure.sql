/* procedure */
/*
 * 프로시저는 데이터베이스에서 미리 컴파일된 sql코드로, 이름을 가지고 있으며
 * 일련의 sql 문이나 비즈니스 로직을 포함하는 데이터베이스 객체이다.
 * 주로 반복적으로 사용되는 쿼리나 로직을 하나로 묶어서 재사용할 수 있도록 하는데 사용된다.
 * 
 * 특징
 * 1. 이름 : 프로시저는 고유한 이름을 가져야 하며, 이름을 통해 프로시저를 호출하거나 참조할 수 있다.
 * 2. 매개변수 : 프로시저는 매개변수를 받을 수 있으며 이를 통해 외부에서 값을 전달 받아 프로시저 내에서 구현이 가능하다.
 * 3. sql 문 및 로직 : 프로시저 내에서 sql 문 뿐만 아니라 조건문, 반복문, 변수 등을 사용하여 복잡한 로직을 구현할 수 있다.
 * 4. 재사용성 : 프로시저는 일련의 작업을 묶어서 재사용할 수 있도록 도와주며, 동일한 코드를 여러 번 작성하지 않고 프로시저를 호출하여 사용할 수 있다.
 * 5. 보안 : 프로시저는 데이터베이스 내에 실행되기 때문에 특정 권한을 가진 사용자만 프로시저를 실행할 수 있다.
 */

-- delimiter $$
-- CREATE PROCEDURE GetMenu()
-- BEGIN
-- 	SELECT count(*) FROM tbl_menu;
-- END $$
-- delimiter ;
-- 
-- SHOW PROCEDURE status;
-- 
-- CALL GetMenu(); -- 아래가 실행된 
-- SELECT count(*) FROM tbl_menu;
-- 
-- DROP PROCEDURE IF EXISTS GetMenu;

-- 매개 변수가 있는 프로시저 사용하
-- delimiter $$
-- CREATE PROCEDURE GetMenu(IN categoryCode int)
-- BEGIN
-- 	SELECT
-- 		count(*)
-- 	  FROM tbl_menu
-- 	 WHERE category_code = categoryCode;
-- END $$
-- delimiter ;
-- 
-- SHOW PROCEDURE status;
-- 
-- SELECT * FROM tbl_menu WHERE category_code = 10;
-- CALL GetMenu(10);
-- 
-- DROP PROCEDURE IF EXISTS GetMenu;


-- 매개변수와 리턴 값이 존재하는 프로시저 사용하기 (프로시저는 함수와 다르게 리턴값이 있어도 되고 없어도 된다.)
delimiter $$
CREATE PROCEDURE GetMenu(
					IN categoryCode int,
					OUT total int
					)
BEGIN
	SELECT
		count(*)
	  INTO total
	  FROM tbl_menu
	 WHERE category_code = categoryCode;
END $$
delimiter ;

CALL GetMenu(10, @total);
SELECT @total;

SHOW PROCEDURE status;
