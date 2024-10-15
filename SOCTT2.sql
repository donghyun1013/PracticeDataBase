-- 함수
-- 숫자 함수
-- abs() : 지정된 숫자의 절대 값을 반환
SELECT -10, abs(-10) FROM dual;
-- ROUND : 반올림한 결과를 반환하는 함수
-- 소수점 첫째자리에서 반올림해서 결과 반환
SELECT ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND_0,
	-- 소수점 두 번째 자리에서 반올림해서 소수점 1자리 표시
	ROUND(1234.5678, 1) AS ROUND_1,
	-- 소수점 세 번째 자리에서 반올림해서 소수점 2자리 표시
	ROUND(1234.5678, 2) AS ROUND_2,
	-- 정수 첫 번째 자리를 반올림
	ROUND(1234.5678, -1) AS ROUND_MINUS1,
	ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;