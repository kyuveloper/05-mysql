/* LIMIT */

SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu 
 ORDER BY menu_price DESC;
 
SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu 
 ORDER BY menu_code 
 LIMIT 1,4; /* 시작지점(index), 출력 개수 */
 
SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu 
 ORDER BY 
 	menu_price DESC,
 	menu_name ASC
 LIMIT 5; /* 최상위 5개만 */