/* 서브 쿼리 */
-- query

SELECT 
	menu_code,
	menu_price,
	menu_name,
	category_code,
	orderable_status
  FROM tbl_menu 
 WHERE category_code = (
 	SELECT
 		category_code
 	  FROM tbl_menu
 	 WHERE menu_name = '민트미역국');
 	 
-- 가장 많은 메뉴가 포함된 카테고리
-- 서브쿼리
SELECT 
	category_code,
	COUNT(*)
  FROM tbl_menu 
 GROUP BY category_code;
 
SELECT 
	MAX(count) -- 밑에 있는 count
  FROM ( -- 대상을 우리가 뷰를 만들어서 실
  	SELECT
  		COUNT(*) AS 'count' -- column 별칭을 줘야함
  	  FROM tbl_menu
  	 GROUP BY category_code) AS countMenu;
  	 
-- 카테고리 평균 가격보다 높은 가격의 메뉴 조회 
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu a
 -- WHERE menu_price > 10880.9524
 WHERE menu_price > ( -- > = <> != 이건 단일값 비교이다
 		SELECT
 			avg(menu_price)
 		  FROM tbl_menu
 		 );
 		 
SELECT 
	menu_name,
	category_code
  FROM tbl_menu a
 WHERE TRUE -- FALSE도 가능
 	OR menu_name = '민트미역국'
 	OR menu_price > 1000;
 	
SELECT 
	category_code
  FROM tbl_category a
 WHERE EXISTS (
 	SELECT
 		1
 	  FROM tbl_menu b
 	 WHERE b.category_code = a.category_code
 	 );
 	 
-- common table
WITH menucate AS (
	SELECT
		a.menu_name,
		b.category_name AS cname
	  FROM tbl_menu a
	  JOIN tbl_category b ON (a.category_code = b.category_code)
)
SELECT
	cname
  FROM menucate
 GROUP BY cname;