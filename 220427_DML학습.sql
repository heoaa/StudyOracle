-- INSERT �н�

-- CREATE TABLE
CREATE TABLE testtbl
(
    id number(4) not null PRIMARY key,
    username NVARCHAR2(10),
    age number(3)
);

-- INSERT
INSERT INTO testtbl (id, username, age) VALUES (1, 'ȫ�浿', 99);
-- �Ȱ��� �÷����� �ִ� ��� �÷� ���� ����
INSERT INTO testtbl VALUES (2, N'ȫ���', 97); 
-- error: ���� ���� ��ġ���� ����
INSERT INTO testtbl VALUES (3, N'ȫ����'); 
-- ��ü���
INSERT INTO testtbl VALUES (3, N'ȫ����', NULL); 

INSERT INTO testtbl (id, username) VALUES (4, '�����'); 

-- �ǵ�����
ROLLBACK;

-- ��������
COMMIT;

-- CREATE TABLE
CREATE TABLE testtbl2
(
    id number(4) not null PRIMARY key,
    username NVARCHAR2(10),
    age number(3)
);


-- id ������ ����(�ڵ� ���� ��ü)
CREATE SEQUENCE test2seq -- ������ �̸�
 START WITH 1 -- ���� ��
 INCREMENT BY 1; -- ���� ��
 
-- ������ ��� �Է�
INSERT INTO testtbl2 (id, username, age)
 VALUES (TEST2SEQ.nextval, 'ȫ���', 97);
 
 COMMIT;
 
-- update(where�� �ʼ�!)
UPDATE testtbl2
 set username='ȫ���'
 , age=97
 where id =2;
 
-- Delete
 Delete from testtbl2 where id =3;
 
 
-- 