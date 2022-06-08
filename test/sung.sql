-- 1번
SELECT LOWER(email) email
     , mobile
     , names
     , addr
     , levels
  FROM membertbl
 ORDER BY names DESC;


-- 2번
SELECT names "책제목"
     , author "저자명"
     , TO_CHAR(releasedate, 'YYYY-MM-DD') 출판일
     , price 가격
  FROM bookstbl
 ORDER BY price DESC;

-- 3번
SELECT d.names 장르
     , b.names 책제목
     , b.author 저자
     , TO_CHAR(b.releasedate, 'YYYY-MM-DD') 출판일
     , b.isbn 책코드번호
     , b.price || '원' 가격
  FROM divtbl d
 INNER JOIN bookstbl b
    ON d.division = b.division
 ORDER BY b.idx DESC;

-- 4번
CREATE SEQUENCE SEQ_NEWMEMBER
 START WITH 27
 INCREMENT BY 1;

INSERT INTO membertbl 
     VALUES (SEQ_NEWMEMBER.nextval, '홍길동', 'A', '부산시 동구 초량동'
            , '010-7989-0909', 'HGD09@NAVER.COM', 'HGD7989', '12345'
            , NULL, NULL);
COMMIT;

-- 5번
SELECT NVL(d.names, '--합계--') "장르"
     , SUM(b.price) 장르별합계금액
  FROM divtbl d
 INNER JOIN bookstbl b
    ON d.division = b.division
 GROUP BY ROLLUP(d.names);
 
 
 
 
 