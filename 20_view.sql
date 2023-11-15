/* View */
/*
 * select 쿼리문을 저장한 객체로 가상 테이블이라고 부른다.
 * 실질적인 데이터를 물리적으로 저장하고 있지 않음
 * 테이블을 사용하는 것과 동일하게 사용할 수 있다.
 */
SELECT * FROM tbl_menu;

CREATE VIEW hansic AS -- hansic 이라는 가상의 객체 테이블을 작
SELECT menu_code, menu_name, menu_price, category_code, orderable_status -- 이 안의 데이터들을 합산해서 만든다.
  FROM tbl_menu
 WHERE category_code = 4;
 
SELECT * FROM hansic;

INSERT INTO tbl_menu VALUES (NULL, '식혜맛국밥', 5500, 4, 'y');

SELECT * FROM hansic;

INSERT INTO hansic VALUES (99, '수정과맛국밥', 5500, 4, 'Y');

SELECT * FROM tbl_menu;

UPDATE hansic SET menu_name = '버터맛국밥', menu_price = 5800 WHERE menu_code = 99;

SELECT * FROM tbl_menu;
SELECT * FROM hansic;


/*
 * 사용된 subQuery에 따라 DMB 명령어로 조작이 불가능한 경우
 * 1) 뷰 정의에 포함되지 않는 컬럼을 조작하는 경우
 * 2) 뷰에 포함되지 않은 컬럼 중에 베이스가 되는 테이블 컬럼이 not null 제약 조건이 지정된 경우
 * 3) 산술 표현식이 정의된 경우
 * 4) join을 이용해 여러 테이블을 연결한 경우
 * 5) distinct를 포함한 경우
 * 6) 그룹함수나 group by 절을 포함한 경우
 */

-- view 삭제
DROP VIEW hansic;

-- view에 쓰인 subQuery 안에 연산 결과 컬럼도 사용 가능하다.
CREATE VIEW hansik AS
SELECT 
	menu_name AS "메뉴명",
	TRUNCATE(menu_price/1000, 1) AS "가격 (천원)",
	category_name AS "카테고리명"
 FROM tbl_menu a
 JOIN tbl_category b ON a.category_code = b.category_code
 WHERE b.category_name = "한식";
	
SELECT * FROM hansik;

INSERT INTO hansik VALUES ("막국수 족발 점심 특선 세트", 15000, "한");


CREATE OR REPLACE VIEW hansik AS
SELECT
	a.menu_code AS "메튜코드",
	a.menu_name AS "메뉴명",
	b.category_name AS "카테고리명"
 FROM tbl_menu a 
 JOIN tbl_category b ON (a.category_code = b. category_code)
WHERE b.category_name = "한식";

SELECT * FROM hansik;