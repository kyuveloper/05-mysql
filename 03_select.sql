-- sql의 기본 select 구문
SELECT MENU_NAME FROM tbl_menu;

SELECT /*명령어는 대문자로 작성해준다*/
	menu_code,
	menu_name,
	menu_price
	FROM tbl_menu;
	
-- CODE, 이름, 가격, STATUS(상태), 카테고를 조회해주세요.

SELECT
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
	FROM tbl_menu;
	
SELECT 
	* /*전부다, 하지만 권장하지 않는다.. 실제 개발 환경에선 잘 쓰지 않*/
	FROM tbl_menu;
	
-- 연산을 바로 실행
SELECT 6 + 3;
SELECT 6 * 3;

-- 내장 함수를 사용
SELECT NOW();
SELECT CONCAT('홍','        ','길동');
/*별칭을 만들어 준다.*/
SELECT CONCAT('홍','        ','길동') AS 'NAME';