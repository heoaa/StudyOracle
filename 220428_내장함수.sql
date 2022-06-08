-- ���� ���
SET SERVEROUTPUT ON;
DECLARE 
    myID NUMBER(4) := 1;
    resName NVARCHAR2(10) := '';
BEGIN
    SELECT username INTO resName FROM testtbl where id = myID;
    DBMS_OUTPUT.put_line('ã�� ��� : ' || resname);
END;

-- CAST(������ AS ����������) : ������ ���� ��ȯ
SELECT CAST(AVG(price) as number(10,2)) as "å �������" FROM bookstbl;
SELECT CAST(AVG(hisal) as number(10,2)) as "�ְ�������" FROM salgrade;

-- DUAL : ����Ŭ��ü����db (���� db���̺� ������� ���� �� ����� �� ����)
SELECT CAST('1000' as number(10)) FROM dual;
SELECT CAST(1000.08 as char(10)) FROM dual;
SELECT CAST('2022/04/28' as date) FROM dual;

-- TO_CHAR(����, '����') : ���ڸ� �پ��� �������� ��ȯ
-- ���� ������ ��� 9 Ȱ��
SELECT to_char(12345, '$999,999') FROM dual;  
SELECT to_char(12345, '999,999') FROM dual;
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mm:ss') "�����Ͻ�" FROM dual; -- ���� ���

-- ���ڿ� �Լ� : ASCII(������), CHR(����), ASCIISTR(�ѱ�), UNISTR(�������ڵ� ����)
SELECT ASCII('A'), CHR(65), ASCIISTR('��'), UNISTR('\D55C') FROM dual;

-- CONCAT �Ǵ� ||
SELECT 'Hello, '  || 'Word ' || '!' FROM dual;  
SELECT CONCAT('Hello, ', 'Word') FROM dual;  

-- INSTR �Լ�('���ڵ�����', 'ã���� �ϴ� ����' : ���°�� ��ġ�ϴ��� ��� ���
SELECT INSTR('�̰��� Oracle�̴�. �ݰ����ϴ�.', 'Oracle') FROM dual;  

-- ��ҹ��� ��ȯ
SELECT UPPER('abcde'), LOWER('ABCDE') FROM dual; 

-- SUBSTR('���ڵ�����', ������ġ, ����) : ���(���� �ڸ���)
SELECT SUBSTR('���ѹα�����',5,2) "Substring" FROM DUAL;

-- TRIM(������_���� ������_���� FROM ���ڿ�)   ** ���ڿ� �߰� ���� ���� �Ұ���
SELECT LTRIM('   �ȳ��ϼ���'), RTRIM('�ȳ��ϼ���   '), TRIM('   �ȳ�  �ϼ���   ')
    FROM DUAL;
    
-- SYSDATE  : ���� ��¥ ����
SELECT sysdate from dual;

