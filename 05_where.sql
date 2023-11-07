/* Where */

-- 값이 같은 경우를 조회하는 방법
SELECT 
	menu_code,
	menu_name,
	menu_price,
	orderable_status -- 활성화/비활성화를 통해 데이터를 삭제하지 않고 추후에 사용한다. (단, 개인정보는 사용자가 정한 기간 이후에는 무조건 삭제) 
  FROM tbl_menu
 WHERE orderable_status = 'Y';
 
SELECT 
	menu_name,
	menu_price,
	orderable_status
  FROM tbl_menu
 WHERE menu_price = 13000;
 
-- 같지 않은 상태를 조회하는 방법
SELECT 
	menu_code,
	menu_name,
	orderable_status
  FROM tbl_menu
--  WHERE orderable_status != 'Y'; 아래와 같은 기능
  WHERE orderable_status <> 'Y';
  
 -- 가격이 20000원 이상인 메뉴를 조회
 -- 코드, 이름, 가격을 보여주고 코드를 기준으로 내림차순 정렬
SELECT 
 	menu_code,
 	menu_name,
 	menu_price
  FROM tbl_menu
 WHERE menu_price >= 20000
 ORDER BY menu_code DESC;

SELECT 
 	menu_code,
 	menu_name,
 	menu_price
  FROM tbl_menu;
  
 
-- 가격이 5000원 이상이면서 판매중인 제품을 조회
SELECT 
	menu_code,
	menu_name,
	menu_price,
	orderable_status
  FROM tbl_menu
 WHERE menu_price >= 5000
   AND orderable_status = 'Y';
   
-- 제품이 판매중이거나 혹은 카테고리 코드가 10인 목록 조회
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y'
 	OR category_code = 10
 ORDER BY category_code;

SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu
 WHERE category_code = 4
    OR menu_price = 9000
   AND menu_code > 10;
  
-- 범위를 조회하는 경우 
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
  FROM tbl_menu
 WHERE menu_price >= 10000
   AND menu_price <= 25000
 ORDER BY menu_price;

SELECT 
	 menu_name,
	 menu_price,
	 category_code
  FROM tbl_menu
 WHERE menu_price BETWEEN 10000 AND 25000;


-- 범위에 해당하지 않는 목록 조회 
SELECT 
	menu_name,
	menu_price,
	category_code
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 10000 AND 25000
 ORDER BY menu_price DESC;
 
-- 값이 포함되어 있는지 확인하는 방
SELECT 
	menu_name,
	menu_price,
	category_code
  FROM tbl_menu
 WHERE menu_name LIKE '%마늘%' /*이름에 리조또 들어간 놈만 골라 */
 ORDER BY menu_name;
 
-- 가격이 5000원 이상이고, 카테고리 코드가 10인 녀석 중 갈치라는 이름이 포함된 메뉴를 조회
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code
  FROM tbl_menu
 WHERE menu_price >= 5000
   AND category_code = 10
   AND menu_name LIKE '%갈치%';
	
-- like의 부정문을 알아본다
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code
  FROM tbl_menu
 WHERE menu_price >= 5000
   AND category_code = 10
   AND menu_name NOT LIKE '%갈치%';
 
-- 한식(4) 중식(5) 일식(6) 메뉴를 조회하자 
SELECT 
	menu_name,
	category_code
  FROM tbl_menu
 WHERE category_code = 4
    OR category_code = 5
    OR category_code = 6;
   
-- in()
SELECT 
	menu_name,
	category_code
  FROM tbl_menu
 WHERE category_code IN (4,5,6);
 
-- 포함되지 않은 값을 조회
SELECT 
	menu_name,
	category_code
  FROM tbl_menu
 WHERE category_code NOT IN (4,5,6);
 
-- null을 조회하는 방법
SELECT 
	category_code,
	category_name,
	ref_category_code
  FROM tbl_category
 WHERE ref_category_code IS NULL;

-- null이 아닌 것 조회하는 방법
SELECT 
	category_code,
	category_name,
	ref_category_code
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;
