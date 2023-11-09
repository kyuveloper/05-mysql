/* Join */

-- inner join
-- on은 테이블 간에 연결할 조건을 의미한다.
-- where은 조회된 결과에서 필터링할 조건이다.

SELECT 
	a.menu_name,
	b.category_name,
	a.category_code,
	b.category_code
  FROM tbl_menu a -- 테이블의 이름을 지정해야함 AS 가 생략됨
  JOIN tbl_category b ON (a.category_code = b.category_code);
  
-- right join
SELECT 
	a.menu_name,
	b.category_name,
	a.category_code,
	b.category_code
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
  
-- cross join
SELECT 
	a.menu_name,
	b.category_name
  FROM tbl_menu a -- 테이블의 이름을 지정해야함 AS 가 생략됨
  CROSS JOIN tbl_category b; -- 각각을 모두 매칭함 // 잘안씀

-- outer join
SELECT 
	a.menu_name,
	b.category_name
  FROM tbl_menu a
 RIGHT JOIN tbl_category b ON (a.category_code = b.category_code)
 WHERE a.menu_name IS NULL;
 
-- self join
SELECT
	b.category_code  AS 'b의 코드',
	b.ref_category_code,
	a.category_code AS 'a의 코드',
	a.category_name,
	b.category_name
  FROM tbl_category a
  JOIN tbl_category b ON (a.category_code = b.ref_category_code); -- 생각보다 자주 쓰임
  
 SELECT * FROM tbl_category;