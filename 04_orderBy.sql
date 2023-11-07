-- 정렬 기능 알아보기
-- ORDER BY;

SELECT 
	*
  FROM tbl_menu
 ORDER BY /*뒤에 오는 것 기준으로 내림차순 정렬 정렬*/ menu_code /*ASC 오름차순인데 기본이라 생략*/;


-- 내림차순
SELECT
 	*
  FROM tbl_menu
 ORDER BY menu_code DESC;/*DESC 역순*/
 
 -- ORDER BY 절을 사용하여 결과 집합을 여러 열로 정렬
SELECT 
 	menu_code,
 	menu_name,
 	menu_price
  FROM tbl_menu
 ORDER BY
  	menu_price DESC,
  	menu_code ASC;
  	
  -- 연산 결과로 결과 집합 정렬
  -- 아래의 결과는 두 번 연산이 진행되는 것으로 판단됨
  -- 데이터의 값이 증가할 수록 성능이 저하된다.
SELECT 
  	menu_code,
  	menu_price,
  	menu_code * menu_price
  FROM tbl_menu
 ORDER BY
 	menu_code * menu_price;
 	
-- 위의 연산의 경우 다음과 같이 사용하는 것이 좋다. 
SELECT 
  	menu_code,
  	menu_price,
  	(menu_code * menu_price) AS '메뉴코드와 가격을 곱함'
  FROM tbl_menu
 ORDER BY
 	'메뉴코드와 가격을 곱함';
 	
SELECT FIELD('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');

SELECT 
	menu_code,
	menu_name,
	orderable_status,
	FIELD(orderable_status, 'N'/*1*/, 'Y'/*2*/)
  FROM tbl_menu
  
SELECT * FROM tbl_menu

SELECT
	menu_name,
	orderable_status,
	FIELD(orderable_status, 'N', 'Y')
  FROM tbl_menu
 ORDER BY FIELD(orderable_status, 'N', 'Y') DESC;
 

-- null
-- 오름차순 시 null 처음으로 (default)
SELECT 
	category_code,
	category_name,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code;
 	
-- 역순으로 정렬 시 
-- DESC
 SELECT 
	category_code,
	category_name,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code DESC;
 	
-- 오름차순 시 마지막으로 정렬
SELECT 
	category_code,
	category_name,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code IS NULL;
 	
-- 내림차순 시 처음으로 정렬
SELECT 
	category_code,
	category_name,
	ref_category_code
  FROM tbl_category
 ORDER BY
 	ref_category_code IS NULL DESC;