-- DISTINCT

-- 중복되는 것을 제거한다.
SELECT 
	category_code
  FROM tbl_menu
 ORDER BY category_code;
 
SELECT 
	DISTINCT category_code
  FROM tbl_menu
 ORDER BY category_code;
 
-- null 값을 포함한 열의 DISTINCT
SELECT 
	ref_category_code
  FROM	tbl_category;
  
 SELECT 
	DISTINCT ref_category_code
  FROM	tbl_category;
  
-- 열이 여러개인 값의 중복을 제거
SELECT DISTINCT 
	category_code, /* 개별로만 distinct는 불가능함 */
	orderable_status
  FROM tbl_menu 
 ORDER BY category_code;
 
SELECT  
	category_code,
	orderable_status
  FROM tbl_menu 
 ORDER BY category_code;