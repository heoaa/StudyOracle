-- < 1번 > 

SELECT lower(email) as "EMAIL", mobile, names, addr, levels
 FROM membertbl
 WHERE idx <> 27
 ORDER BY names DESC;
 
 
-- < 2번 >  정렬

SELECT names as "책제목", author as "저자명"
     , to_char(releasedate, 'yyyy-mm-dd') as "출판일", price as "가격"
 FROM bookstbl
 ORDER BY price DESC,
          DECODE(price, 15000, releasedate);


-- < 3번 > 
SELECT dt.names as "장르", bt.names as "책제목", bt.author as "저자"
     , to_char(bt.releasedate, 'yyyy-mm-dd') as "출판일"
     , bt.isbn as "책코드번호", concat(bt.price, '원') as "가격"
 FROM bookstbl bt
 inner join divtbl dt
   on bt.division = dt.division
 ORDER BY bt.idx DESC;
 
 
-- < 4번 > 
CREATE SEQUENCE idseq
       start with 27
       increment by 1;

INSERT INTO membertbl 
    VALUES (idseq.NEXTVAL, '홍길동', 'A', '부산시 동구 초량동',
            '010-7989-0909', 'HGE09@NAVER.COM', 'HGD7989', 12345, null, null);
-- 커밋 필요
SELECT * FROM membertbl WHERE idx=27;
       
       
-- < 5번 >
-- null 치환 함수 활용 가능 NVL(dt.names, '--합계--')
SELECT DECODE(GROUPING(dt.names), 1, '--합계--', dt.names) as "장르"
     , sum(bt.price) as "장르별합계금액"
 FROM bookstbl bt
 inner join divtbl dt
   on bt.division = dt.division
 GROUP BY ROLLUP(dt.names)
 ORDER BY dt.names;