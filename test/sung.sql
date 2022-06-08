-- 1��
SELECT LOWER(email) email
     , mobile
     , names
     , addr
     , levels
  FROM membertbl
 ORDER BY names DESC;


-- 2��
SELECT names "å����"
     , author "���ڸ�"
     , TO_CHAR(releasedate, 'YYYY-MM-DD') ������
     , price ����
  FROM bookstbl
 ORDER BY price DESC;

-- 3��
SELECT d.names �帣
     , b.names å����
     , b.author ����
     , TO_CHAR(b.releasedate, 'YYYY-MM-DD') ������
     , b.isbn å�ڵ��ȣ
     , b.price || '��' ����
  FROM divtbl d
 INNER JOIN bookstbl b
    ON d.division = b.division
 ORDER BY b.idx DESC;

-- 4��
CREATE SEQUENCE SEQ_NEWMEMBER
 START WITH 27
 INCREMENT BY 1;

INSERT INTO membertbl 
     VALUES (SEQ_NEWMEMBER.nextval, 'ȫ�浿', 'A', '�λ�� ���� �ʷ���'
            , '010-7989-0909', 'HGD09@NAVER.COM', 'HGD7989', '12345'
            , NULL, NULL);
COMMIT;

-- 5��
SELECT NVL(d.names, '--�հ�--') "�帣"
     , SUM(b.price) �帣���հ�ݾ�
  FROM divtbl d
 INNER JOIN bookstbl b
    ON d.division = b.division
 GROUP BY ROLLUP(d.names);
 
 
 
 
 