-- select
-- rownum
-- �������� ���� å ���Ǹ�
SELECT * FROM
(
    SELECT names, to_char(releasedate, 'yyyy-mm-dd') "������"
      FROM bookstbl
      order by releasedate
)
WHERE ROWNUM <= 3;  --ROWNUM: ���� n�� ���, �ܵ� ��� �Ұ���, �������� WHRER���� ����ؾ���

-- GROUP BY
SELECT author "����", division "�帣", sum(price) "�հ�(��)", sum(1) "å(����)"
  FROM bookstbl
 GROUP BY author, division  -- group by�� select���� �ִ� �÷��� �����ؾ� ��(�Լ��� ����)
 --HAVING SUM(price) >= 200000  --�Լ��� ��� where���� �� �� �����Ƿ� group by ���� having�� Ȱ��
 ORDER BY division;
 
-- å ���� ���ġ
SELECT CAST(AVG(price) AS NUMBER(8,2)) as "���å ����" FROM bookstbl;

-- å ���� : ���� ��� å, ������ å ��ȸ
SELECT MAX(price), MIN(price) FROM bookstbl;

--ROLLUP, CUBE
SELECT division "�帣", sum(price) "�հ�(��)", sum(1) "å(����)"
     , GROUPING_ID(division) "�߰� �� ����"
  FROM bookstbl
 GROUP BY ROLLUP(division);
 
