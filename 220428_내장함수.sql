-- 변수 사용
SET SERVEROUTPUT ON;
DECLARE 
    myID NUMBER(4) := 1;
    resName NVARCHAR2(10) := '';
BEGIN
    SELECT username INTO resName FROM testtbl where id = myID;
    DBMS_OUTPUT.put_line('찾은 사람 : ' || resname);
END;

-- CAST(데이터 AS 데이터형식) : 데이터 형식 변환
SELECT CAST(AVG(price) as number(10,2)) as "책 가격평균" FROM bookstbl;
SELECT CAST(AVG(hisal) as number(10,2)) as "최고월급평균" FROM salgrade;

-- DUAL : 오라클자체제공db (실제 db테이블 사용하지 않을 때 사용할 수 있음)
SELECT CAST('1000' as number(10)) FROM dual;
SELECT CAST(1000.08 as char(10)) FROM dual;
SELECT CAST('2022/04/28' as date) FROM dual;

-- TO_CHAR(숫자, '형식') : 숫자를 다양한 형식으로 변환
-- 숫자 형식의 경우 9 활용
SELECT to_char(12345, '$999,999') FROM dual;  
SELECT to_char(12345, '999,999') FROM dual;
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mm:ss') "현재일시" FROM dual; -- 자주 사용

-- 문자열 함수 : ASCII(영문자), CHR(숫자), ASCIISTR(한글), UNISTR(‘유니코드 값’)
SELECT ASCII('A'), CHR(65), ASCIISTR('한'), UNISTR('\D55C') FROM dual;

-- CONCAT 또는 ||
SELECT 'Hello, '  || 'Word ' || '!' FROM dual;  
SELECT CONCAT('Hello, ', 'Word') FROM dual;  

-- INSTR 함수('문자데이터', '찾고자 하는 문자' : 몇번째에 위치하는지 결과 출력
SELECT INSTR('이것이 Oracle이다. 반갑습니다.', 'Oracle') FROM dual;  

-- 대소문자 변환
SELECT UPPER('abcde'), LOWER('ABCDE') FROM dual; 

-- SUBSTR('문자데이터', 시작위치, 길이) : 출력(글자 자르기)
SELECT SUBSTR('대한민국만세',5,2) "Substring" FROM DUAL;

-- TRIM(제거할_방향 제거할_문자 FROM 문자열)   ** 문자열 중간 공백 제거 불가능
SELECT LTRIM('   안녕하세요'), RTRIM('안녕하세요   '), TRIM('   안녕  하세요   ')
    FROM DUAL;
    
-- SYSDATE  : 현재 날짜 도출
SELECT sysdate from dual;

