-- select 절과 FROM절
SELECT * FROM EMP;
-- 사원 번호, 이름, 부서 번호만 조회하고 싶으면 * 쓰지 않고 변수를 넣으면 된다
SELECT EMPNO, ENAME, DEPTNO
	FROM EMP;
	
SELECT EMPNO, DEPTNO FROM EMP;

-- 열과 계산식
SELECT ENAME, SAL, SAL * 12 + COMM "연봉", COMM 
	FROM EMP;

-- 별칭을 지정하는 방식
SELECT ENAME, SAL, SAL * 12 + COMM AS "연봉", COMM
	FROM EMP;
	
-- 별칭 붙이기
SELECT ENAME AS 이름, SAL "$ 봉급"
	FROM EMP;

-- 중복을 제거하는 DISTINCT
SELECT DISTINCT DEPTNO FROM EMP;
-- 중복 제거하지 않은 경우
SELECT DEPTNO FROM EMP;

-- 컬럼값을 계산하는 산술 연산자
-- 사용시 유일할 점은 두 컬럼 모두 자료형이 숫자형이나 날짜형이어야 한다.
-- 날짜형의 경우에는 +, - 만 사용 가능하다.
SELECT ENAME,SAL, SAL * 12
	FROM EMP;

-- JOB 열 데이터를 중복을 제거하고 출력
SELECT DISTINCT JOB FROM EMP;

-- WHERE 구문
-- SELECT 컬럼명 1, 컬럼명 2
-- FROM 테이블 명
-- WHERE [컬럼 이름] [비교연산자] [조건값];

-- EMP 테이블에서 부서번호가 10인 사원의 정보 출력
SELECT * FROM EMP 
WHERE DEPTNO = 10;

SELECT * FROM EMP
WHERE EMPNO = 7369;


-- 산술 연산자
SELECT * FROM EMP
WHERE SAL * 12 = 36000;

-- 비교 연산자
-- 컬럼의 값이 500인 데이터만 조회하여 출력
SELECT * FROM EMP
WHERE COMM > 500;

-- HIREDATE가 81년 01월 01일 이전인 데이터를 조회하여 출력
SELECT * FROM EMP
WHERE HIREDATE < '81/01/01';




























