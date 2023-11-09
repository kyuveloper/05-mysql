/* group by */

SELECT 
	category_code,
	COUNT(*)
  FROM tbl_menu
 GROUP BY category_code;
 
-- sum()
SELECT 
	category_code,
	menu_price
  FROM tbl_menu
 ORDER BY category_code;
  
-- 그룹으로 묶어서 그룹마다 sum 계산
SELECT 
	category_code,
	SUM(menu_price)
  FROM tbl_menu 
 GROUP BY category_code;
 
-- avg() 함수
SELECT 
	category_code,
	avg(menu_price)
  FROM tbl_menu
 GROUP BY category_code;
 
-- 다중열 묶음
SELECT 
	category_code,
	menu_price,
	COUNT(*)
  FROM tbl_menu 
 GROUP BY category_code, menu_price; -- AND 연산자처럼 동시에 cc와 mp가 같은 것들을 그룹으로 묶음
 
-- 그룹에 대한 조건을 걸 때 having을 사용한다.
SELECT 
	category_code,
	count(*)
  FROM tbl_menu 
 WHERE menu_name = '과메기커틀릿'
 GROUP BY category_code 
HAVING category_code BETWEEN 5 AND 8;

-- Rollup
SELECT 
	category_code,
	orderable_status,
	sum(menu_price)
  FROM tbl_menu 
 GROUP BY category_code, orderable_status
 WITH ROLLUP;