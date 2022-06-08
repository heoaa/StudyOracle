-- ���̺� ����
create table usertbl 
(
    userid char(8) not null PRIMARY key,
    username nvarchar2(10) not null,
    addr NVARCHAR2(50)
    
);

-- ���̺� ����
-- �������� �� �θ����̺��� ���� ���� �� ����(�ڽ����̺� ���� ��������)
 drop table buytbl;
 drop table usertbl;

-- �θ�/�ڽ� �������̺� ���� : FOREIGN key(�����÷�) REFERENCES �������̺�(�����÷�)
CREATE TABLE buytbl
(
    idnum number(8) not null PRIMARY KEY,
    userid char(8) not null,  -- not null ���Է½� ������
    buydate date,
    
    FOREIGN key(userid) REFERENCES usertbl(userid)
);

-- �������� : �������� ���Ἲ�� ��Ű�� ���� ���ѵ� ����
-- PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT, NULL






