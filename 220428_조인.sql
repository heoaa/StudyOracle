-- INNER JOIN

SELECT bt.idx, bt.author as "����", dt.division as "�帣�ڵ�"
    , dt.names as "å�帣��", bt.names, to_char(bt.releasedate, 'yyyy-mm-dd') as "������"
    , to_char(bt.price, '999,999') as "����", bt.isbn
  FROM bookstbl bt
 inner JOIN divtbl dt
    ON bt.division = dt.division
 WHERE dt.division = 'B005';


-- INNER JOIN, ���̺� 3�� ***
select r.idx, to_char(r.rentaldate, 'yyyy-mm-dd') as "�뿩��"
     , to_char(r.returndate, 'yyyy-mm-dd') as "�ݳ���"
     , m.names as "�뿩��"
     , b.names as "���� å"
 from membertbl m
 inner join rentaltbl r
    on m.idx = r.memberidx
 inner join bookstbl b
    on b.idx = r.bookidx
 where r.returndate is not null   -- ���� (��)�ݳ��� ��ȸ ���ǹ�(null ��ȸ�� = �ƴ� is)
 order by r.idx;
 
 
-- (LEFT, RIGHT) OUTER JOIN : (outer join�� �������� �������̺� ��ġ ����)
-- ���� ���̺�� �ش� ���ǿ� �������� �ʴ� ���ڵ�� ����
select m.idx as "ȸ����ȣ", m.names as "ȸ����"
     , m.levels, m.mobile, m.email
     , r.idx
 from membertbl m
 left outer join rentaltbl r
    on m.idx = r.memberidx
 where r.idx is null
   and m.levels <> 'S'; -- ���� S�� ������

-- �ڽ����̺�(rentaltbl) ������ ��� null�� Ȯ�� �Ұ� : ������ �θ����̺��̾�� ��
select *
 from membertbl m
 right outer join rentaltbl r
    on m.idx = r.memberidx;

-- �ѹ��� �뿩���� ���� ���� ��ȸ ����
SELECT b.idx as "�����ڵ�", b.names as "������"
     , b.author, b.price
     , r.idx, r.rentaldate, r.returndate
  FROM bookstbl b
  left outer join rentaltbl r
    on b.idx = r.bookidx
  where r.idx is null;

-- OUTER JOIN, ���̺� 3��
--select d.division as "�����ڵ�", d.names as "�帣"
--     , r.idx as "��ŻID", b.idx as "����ID", b.names as "������"
--     , COUNT(DISTINCT(case when d.names !='' ans b.names !='' then 1 else  end))
--     as names_cnt
-- from rentaltbl r
-- right outer join bookstbl b
--   on b.idx = r.bookidx
-- right outer join divtbl d
--   on b.division = d.division
-- where r.idx is null;


-- UNION  ���� ex) ����� ����� ���� ��ȸ
select idx, names from bookstbl
 union 
select idx, names from membertbl;

-- �÷� ���°� �ٸ� ��� union �Ұ��� (price_��ġ, names_���� : to_char �� ���� ���Ͻ� �ʿ�)
select idx, price from bookstbl
 union 
select idx, names from membertbl;

