-- < 1�� > 

SELECT lower(email) as "EMAIL", mobile, names, addr, levels
 FROM membertbl
 WHERE idx <> 27
 ORDER BY names DESC;
 
 
-- < 2�� >  ����

SELECT names as "å����", author as "���ڸ�"
     , to_char(releasedate, 'yyyy-mm-dd') as "������", price as "����"
 FROM bookstbl
 ORDER BY price DESC,
          DECODE(price, 15000, releasedate);


-- < 3�� > 
SELECT dt.names as "�帣", bt.names as "å����", bt.author as "����"
     , to_char(bt.releasedate, 'yyyy-mm-dd') as "������"
     , bt.isbn as "å�ڵ��ȣ", concat(bt.price, '��') as "����"
 FROM bookstbl bt
 inner join divtbl dt
   on bt.division = dt.division
 ORDER BY bt.idx DESC;
 
 
-- < 4�� > 
CREATE SEQUENCE idseq
       start with 27
       increment by 1;

INSERT INTO membertbl 
    VALUES (idseq.NEXTVAL, 'ȫ�浿', 'A', '�λ�� ���� �ʷ���',
            '010-7989-0909', 'HGE09@NAVER.COM', 'HGD7989', 12345, null, null);
-- Ŀ�� �ʿ�
SELECT * FROM membertbl WHERE idx=27;
       
       
-- < 5�� >
-- null ġȯ �Լ� Ȱ�� ���� NVL(dt.names, '--�հ�--')
SELECT DECODE(GROUPING(dt.names), 1, '--�հ�--', dt.names) as "�帣"
     , sum(bt.price) as "�帣���հ�ݾ�"
 FROM bookstbl bt
 inner join divtbl dt
   on bt.division = dt.division
 GROUP BY ROLLUP(dt.names)
 ORDER BY dt.names;