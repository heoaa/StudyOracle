--��ȸ ������(where)(�ּ�)
select names, levels, addr, mobile 
from membertbl
where names='�����';

--idx�� 5�̻� 10���� ��ȸ, level�� A�� ����� ��ȸ
SELECT * FROM membertbl
where (idx >=5 and idx <= 10)
 and (levels='A');
 
 --between A and B (a�� b�� ������ ������ ��ȸ)
 --idx�� 5�̻� 10������ ȸ�� ���ڵ� ��ȸ
SELECT * FROM membertbl
where idx BETWEEN 5 AND 10;

--or
SELECT * FROM membertbl
WHERE levels = 'B' OR levels='D' OR levels='S';

--in
select*from membertbl
where levels NOT in ('B', 'D', 'S');

--like(����˻�)
SELECT * FROM bookstbl
WHERE names = '������ 7' or names = '������ 8';
--
SELECT * FROM bookstbl
WHERE names IN ('������ 7','������ 8');
--% Ȱ��(���� ������� ���� �ٸ� �κ��� �ִ� ��� �ش� ��ġ�� ���� Ȱ�� ����)
--_ (���� ���ڰ� �ִ��� ������ �ش� �ڸ��� _������ŭ ���� ��)
SELECT * FROM bookstbl
WHERE names LIKE '_����%';  -- ������%, _����__, ������__, (�����ϰ� ��� ����)

--LIKE ����˻�
SELECT * FROM bookstbl
 WHERE description Like '%��ǰ%'
 AND division = 'B005';
 
--LIKE�� IN�� �Բ� �� �� ����

--��������1 (WHERE��)
SELECT * FROM bookstbl
 WHERE division IN (SELECT division FROM divtbl
  WHERE names='�߸�');
 
--��������2 (�÷����)
select b.idx as "��ȣ"
    ,b.author as "����"
    ,b.division "�帣�ڵ�"
    ,(select d.names from divtbl d where d.division = 'B005') as "�帣"    
    ,b.names "å ����"
    ,b.price "����"

 from bookstbl b
where b.division='B005';

--��������3 (FROM��)
SELECT bb. * FROM (SELECT b.author, b.division, b.names FROM bookstbl b) bb;
                   -- ������ ���̺� b
  --ex) bb.price �Ұ��� > ������ ���̺� b�� price�� ���� ����
  
--�������� ANY
SELECT * FROM bookstbl
 WHERE division IN (SELECT division FROM divtbl
 WHERE division LIKE 'B%');
 -- WHERE�� = �� ������ ��ġ�ϴ� ��쿡�� ��� ���� 
 -- ERROR:���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�. >> IN���� ����
 
-- ���� Order by (ASC[ending]:��������_�⺻��, DESC[ending]:��������)
select idx, author, names, releasedate, price 
 from bookstbl
 ORDER BY price, idx DESC;
 
--DISTINCT
select DISTINCT price from bookstbl;

select * from divtbl
 where division IN (
  select DISTINCT division from bookstbl);