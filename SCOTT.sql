-- SELECT와 FROM 절
-- 기본 SELECT [조회할 열(옵션)], [조회할 열] FROM 테이블이름;
SELECT * FROM EMP;		-- FROM 다음에 오는 것은 테이블 이름
-- SQL 실행문은 ; 세미콜론으로 끝나야 된다.

-- 특정 컬럼만 선택해서 조회
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

-- 사원 번호와 부서번호만 나오도록 SQL 작성
SELECT EMPNO, DEPTNO FROM EMP;

-- 한 눈에 보기 좋게 별칭 부여하기
SELECT ENAME, SAL, COMM, SAL * 12 + COMM FROM EMP;

-- 한 눈에 보기 좋게 별칭 부여하기
-- 중간에 공백이 들어가면 "" 써줘야 된다.
SELECT ENAME "이름", SAL AS "급여", COMM AS "성과금", SAL * 12 "연봉" FROM EMP;
	
-- 중복 제거 DISTINCT
SELECT deptno FROM EMP;
-- 중복 제거하고 정렬하기
SELECT DISTINCT deptno FROM EMP ORDER BY DEPTNO;

-- 컬럼 값을 계산하는 산술 연산자(+, -, *, /)
SELECT ename "이름", sal "급여", sal * 12 "연간 급여", sal * 12 + comm "총 연봉" FROM emp;

-- 연습문제
-- JOB 열 데이터 중복없이 출력
SELECT DISTINCT JOB FROM EMP;

-- WHERE 구문 (조건문)
-- 먼저 테이블이 선택되고, where 조건절에서 행을 제한하고 출력할 열을 결정
-- 20번 부서만 나오도록 하는 코드
SELECT * FROM EMP WHERE DEPTNO = 20;

-- 사원번호가 7369번인 사원의 모든 정보를 보여주세요.
-- = : 같다라는 의미로 사용
SELECT * FROM emp WHERE EMPNO = 7369;

-- 연습문제
-- 급여가 2500 초과인 사원번호, 이름, 직무 출력, 급여 출력
-- EMP 테이블에서 급여가 2500 초과인 행을 선택하고 사원번호, 이름, 직무, 급여에 대한 컬럼을 선택해서 출력
SELECT EMPNO "사원번호", ENAME "이름", JOB "직무", SAL "급여" FROM emp WHERE sal > 2500;

-- WHERE 절에 기본 연산자 사용
-- WHERE 절 산술 연산자
SELECT * FROM EMP WHERE SAL * 12 = 36000;

-- WHERE 절 비교 연산자
-- >, >=, <, <=
-- 성과급이 500 초과인 사람의 모든 정보를 출력
SELECT * FROM EMP WHERE COMM > 500;

-- 입사일이 81년 01월 01일 이전인 데이터 조회
-- 데이터 베이스의 문자열을 비교할 때 '' 작은 따옴표 사용
-- 데이터 타입은 날짜의 형식에 맞으면 가능하다.
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';

-- 같지 않음을 표현하는 여러가지 방법 : <>, !=, ^=, NOT 컬럼명 =
SELECT * FROM EMP WHERE DEPTNO <> 30;
SELECT * FROM EMP WHERE DEPTNO != 30;
SELECT * FROM EMP WHERE DEPTNO ^= 30;
SELECT * FROM EMP WHERE NOT DEPTNO = 30;

-- 논리 연산자 : AND, OR, NOT 
-- 급여가 3000 이상이고, 부서가 20번 사원의 모든 정보 출력하기
SELECT * FROM EMP WHERE SAL >= 3000 AND DEPTNO = 20;
-- 급여가 3000 이상이거나 부서가 20번 사원의 모든 정보 출력하기
SELECT * FROM EMP WHERE SAL >= 3000 OR DEPTNO = 20;
-- 급여가 3000 이상이고 부서가 20번이고 입사일이 82년 1월 1일 이전 사원의 정보 출력
SELECT * FROM EMP WHERE SAL >= 3000 AND DEPTNO = 20 AND HIREDATE < '82/01/01';
-- 급여가 3000 이상이고 부서가 20번이거나 입사일이 82년 1월 1일 이전 사원의 모든 정보 출력하기
SELECT * FROM EMP WHERE SAL >= 3000 AND (DEPTNO = 20 OR HIREDATE < '82/01/01');
-- 급여가 2500 이상이고 직책이 MANAGER인 사원의 모든 정보 출력
SELECT * FROM EMP WHERE SAL >= 2500 AND JOB = 'MANAGER';

SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
-- IN 연산자
SELECT * FROM EMP WHERE JOB IN('MANAGER', 'SALEMAN', 'CLERK');
-- IN 연산자를 사용해서 20번과 30번인 부서에 포함된 사원의 모든 정보 조회
SELECT * FROM EMP WHERE deptno IN(20, 30);
-- NOT IN 연산자를 사용해서 20번과 30번 부서에 포함된 사원 조회
SELECT * FROM EMP WHERE DEPTNO NOT IN(10);

-- 비교 연선저와 AND 연산자를 사용하여 출력하기
SELECT * FROM EMP WHERE JOB != 'MANAGER' AND JOB <> 'SALESMAN' AND JOB ^= 'CLERK';

-- 급여가 2000 이상 3000 사이에 모든 사원 데이터 조회
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <= 3000;
-- BETWEEN A AND B 연산자
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;
-- 사원 번호가 7689 ~ 7902까지의 모든 사원의 정보 출력
SELECT * FROM EMP WHERE EMPNO BETWEEN 7689 AND 7908;

-- 1980년이 아닌 해에 입사한 직원 조회
SELECT * FROM EMP WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31';

-- LIKE, NOT LIKE 연산자
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 문자 1개 의미
-- 앞과 뒤의 문자열 길이에 상관없이 K가 포함되어 있는  문자 출력
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%K%';

-- 사원 이름의 두 번째 글자가 L인 사원만 출력
SELECT * FROM EMP WHERE ename LIKE '_L%';

-- 실습 문제
-- 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력
SELECT * FROM EMP WHERE ename LIKE '%AM%';
-- 사원 이름에 AM이 포함되어 있지 않은 사원 데이터만 출력
SELECT * FROM EMP WHERE ename NOT LIKE '%AM%';

-- 와일드카드 문자가 데이터 일부일 경우 (%와 _)
-- escape 문자로 지정된 '\'뒤에 오는 '%'는 와일드 카드가 아니고 포함된 데이터로 처리
-- 실제 % 문자가 된다. %P로 끝나는 경우
-- 사원 이름이 %P로 끝나는 사원을 조회 
SELECT * FROM EMP WHERE ename LIKE '%\%S' ESCAPE '\';

-- DML 구문
INSERT INTO EMP(empno, ename, job, mgr, HIREDATE, SAL, COMM, DEPTNO) VALUES
(1001, 'JAME%S', 'MANAGER', 7839, '2024-10-15', 3500, 450, 30);

-- DML DELETE
DELETE FROM EMP WHERE EMPNO = 1001;

SELECT * FROM EMP;

-- is null 연산자 
-- 데이터 값에는 null 값을 가질 수 있다. 값이 정해지지 않음을 의미한다. 연산 불가(계산 X, 비교 x, 할당 X)
SELECT ename, sal, sal * 12 + comm "연봉", comm FROM emp;

-- 비교연산으로 NULL 비교하기
-- 비교 연산 불가
-- NULL 비교 불가이므로 결과가 나오지 않는다
SELECT * FROM EMP where COMM = NULL;

-- 해당 데이터가 NULL 인지 확인하는 방법은 is NULL 연산자 사용
SELECT * FROM EMP WHERE COMM IS NULL;

-- 해당 데이터가 NULL이 아닌 데이터만 출력
SELECT * FROM EMP WHERE COMM IS NOT NULL;

-- 직속상관이 있는 사원 데이터만 출력
SELECT * FROM EMP WHERE MGR IS NOT NULL;

-- 정렬을 위한 ORDER BY 절
-- 급여에 대한 오름차순 정렬
SELECT * FROM EMP ORDER BY SAL;
-- 급여에 대한 내림차순 정렬
SELECT * FROM EMP ORDER BY SAL DESC;

-- 사원번호 기준으로 내림차순 정렬
SELECT * FROM EMP ORDER BY EMPNO DESC;

-- 정렬 조건을 여러 칼럼 기준으로 정렬
-- 급여가 많은 사람 순으로 정렬하고, 급여가 같으면 이름 순 정렬
SELECT * FROM EMP ORDER BY SAL, ENAME;

-- 별칭 사용과 ORDER BY 절 사용
-- 사원명 기준 오름차순 정렬, 월급 기준으로 내림차순 정렬
-- 실행 순서 : 1번 FROM 테이블 가져옴 2번 WHERE 절 해당 조건에 맞는 행(튜플)을 가져온다. 3번 SELECT 절 출력해야할 컬럼 제한 4번 ORDER BY 절 마지막 정렬 수행
SELECT empno 사원번호, ename 사원명, sal 월급, hiredate 입사일 FROM EMP WHERE SAL >= 2000 ORDER BY 월급 DESC, 사원명;

-- 연결 연산자
SELECT ENAME || '의 직책은' || JOB "사원정보" FROM EMP;

-- 실습 문제
-- 1번 EMP 테이블을 사용하여 사원이름이 S자로 끝나는 사원 데이터를 모두 출력
SELECT * FROM EMP WHERE ENAME LIKE '%S';

-- 2번 EMP 테이블을 사용하여 30번 부서에서 근무하고 있는 사원 중 직책이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서 번호를 출력
SELECT empno, ename,job, mgr, deptno FROM emp WHERE deptno = 30 AND job ='SALESMAN';

-- 3번 EMP 테이블을 사용하여 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000초과인 사원을 SELECT문을 사용하여 사원 번호, 이름, 급여, 부서 번호 출력
-- 1. 집합 연산자를 사용하지 않는 방식
-- 2. 집합 연산자 사용
SELECT empno, ename, sal, job, deptno FROM emp WHERE DEPTNO IN (20, 30) AND sal > 2000;

-- 4번 NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여 열 값이 2000이상 3000이하 범위 이외의 값을 가진 데이터만 출력
SELECT * FROM emp where sal < 2000 OR sal > 30000;

-- 5번 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서 번호를 출력
SELECT ename, empno, sal, deptno FROM emp WHERE ename LIKE '%E%' AND sal BETWEEN 1000 AND 2000;

-- 6번 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에서 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보 출력
SELECT * FROM emp 
	WHERE comm IS NULL 
	AND mgr IS NOT NULL 
	AND job IN ('MANAGER', 'CLERK') 
	AND ENAME NOT LIKE '_L%';
	
-- SELECT 연습 문제 
-- 1. EMP 테이블에서 COMM의 값이 NULL이 아닌 정보 조회
SELECT * FROM EMP WHERE COMM IS NOT NULL;
-- 2. EMP 테이블에서 커미션을 받지 못하는 직원 조회
SELECT * FROM EMP WHERE COMM IS NULL OR COMM = 0;
-- 3. EMP 테이블에서 관리자가 없는 직원 정보 조회
SELECT * FROM EMP WHERE COMM IS NULL;
-- 4. EMP 테이블에서 급여를 많이 받는 직원 순으로 조회
SELECT * FROM EMP ORDER BY SAL DESC;
-- 5. EMP 테이블에서 급여가 같을 경우 커미션을 내림 차순 정렬 조회
SELECT * FROM EMP ORDER BY SAL DESC, COMM DESC;
-- 6. EMP 테이블에서 사원번호, 사원명, 직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)
SELECT empno, ename, job, hiredate FROM emp ORDER BY 4; 
-- 7. EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
SELECT empno, ename FROM emp ORDER BY empno DESC;
-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회  (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
SELECT empno, deptno, hiredate, ename, sal FROM emp ORDER BY 2, 3 DESC;
-- 9. 오늘 날짜에 대한 정보 조회
SELECT SYSDATE FROM DUAL;
-- 10. EMP테이블에서 사번, 사원명, 급여 조회
SELECT empno, ename, sal FROM emp;
-- 11. EMP테이블에서 사원번호가 홀수인 사원들을 조회
SELECT * FROM emp WHERE MOD(empno, 2) = 1;
-- 12. EMP테이블에서 사원명, 입사일 조회
SELECT * FROM emp WHERE EXTRACT (MONTH FROM hiredate) = 9;
-- 13. EMP테이블에서 9월에 입사한 직원의 정보 조회

-- 14. EMP테이블에서 81년도에 입사한 직원 조회
SELECT * FROM emp WHERE EXTRACT (YEAR FROM hiredate ) = 1981;
-- 15. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT * FROM emp WHERE ename LIKE '%E';
-- 16. EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
SELECT * FROM emp WHERE ENAME LIKE '__R%';
-- 17. EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
-- 특정 날짜에 개월수를 더해 날짜 계산
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 12 * 40) FROM emp; 
-- 18. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
SELECT * FROM emp WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12 >= 38; 
-- 19. 오늘 날짜에서 년도만 추출
SELECT EXTRACT (YEAR FROM sysdate) FROM dual;

























