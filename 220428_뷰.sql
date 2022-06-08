-- DBA
-- ��
CREATE view scott_bookslist
as
  SELECT bt.idx, bt.author as "����", dt.division as "�帣�ڵ�"
    , dt.names as "å�帣��", bt.names, to_char(bt.releasedate, 'yyyy-mm-dd') as "������"
    , to_char(bt.price, '999,999') as "����", bt.isbn
    FROM scott.bookstbl bt
   inner JOIN scott.divtbl dt
      ON bt.division = dt.division;
      
      
SELECT
    * FROM scott_bookslist
    where idx=6;
    
-- SCOTT
-- �ε���
-- Ŭ���̸Ӹ��ε��� : PK�� ������ �ε���(������ �ε���)
select * from bookstbl;

create index idx_bookstbl_author on bookstbl (author asc);

create index IDX_BOOKSTBL_NAMES ON BOOKSTBL (NAMES ASC);