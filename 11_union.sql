/* SET OPERATORS */

/* UNION */
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu 
 WHERE category_code = 10
 
 UNION -- 중복을 제거하고 쿼리를 합체 
 
SELECT
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu 
 WHERE menu_price < 9000;
 
/* UNION ALL */

SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu 
 WHERE category_code = 10
 
 UNION ALL -- 중복 되어도 무시하고 쿼리를 합체 
 
SELECT
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu 
 WHERE menu_price < 9000;
 
-- inner join 에 sub query 사용하기 
SELECT
	a.menu_code,
	a.menu_name,
	a.menu_price,
	a.category_code,
	a.orderable_status
  FROM tbl_menu a
  JOIN (SELECT -- 위와 별개의 쿼리임
  			menu_code,
  			menu_price,
  			category_code,
  			orderable_status
  		  FROM tbl_menu
  		 WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10;
 

SELECT 
	a.menu_code,
	a.menu_name,
	a.menu_price,
	a.category_code,
	a.orderable_status
  FROM tbl_menu a
  LEFT JOIN (
  		SELECT
  			menu_code,
  			menu_name,
  			menu_price,
  			category_code,
  			orderable_status
  		  FROM tbl_menu
  		 WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10
   AND b.menu_code IS NULL;