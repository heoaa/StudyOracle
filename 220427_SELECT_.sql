-- select
-- rownum
-- 출판일이 빠른 책 세권만
SELECT * FROM
(
    SELECT names, to_char(releasedate, 'yyyy-mm-dd') "출판일"
      FROM bookstbl
      order by releasedate
)
WHERE ROWNUM <= 3;  --ROWNUM: 상위 n개 출력, 단독 사용 불가능, 서브쿼리 WHRER절로 사용해야함

-- GROUP BY
SELECT author "저자", division "장르", sum(price) "합계(원)", sum(1) "책(개수)"
  FROM bookstbl
 GROUP BY author, division  -- group by는 select문에 있는 컬럼과 동일해야 함(함수는 제외)
 --HAVING SUM(price) >= 200000  --함수의 경우 where절에 쓸 수 없으므로 group by 이후 having절 활용
 ORDER BY division;
 
-- 책 정가 평균치
SELECT CAST(AVG(price) AS NUMBER(8,2)) as "평균책 정가" FROM bookstbl;

-- 책 가격 : 제일 비싼 책, 저렴한 책 조회
SELECT MAX(price), MIN(price) FROM bookstbl;

--ROLLUP, CUBE
SELECT division "장르", sum(price) "합계(원)", sum(1) "책(개수)"
     , GROUPING_ID(division) "추가 행 여부"
  FROM bookstbl
 GROUP BY ROLLUP(division);
 
