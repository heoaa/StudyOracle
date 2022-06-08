--조회 조건절(where)(주석)
select names, levels, addr, mobile 
from membertbl
where names='성명건';

--idx가 5이상 10이하 조회, level이 A인 사람을 조회
SELECT * FROM membertbl
where (idx >=5 and idx <= 10)
 and (levels='A');
 
 --between A and B (a와 b를 포함한 데이터 조회)
 --idx가 5이상 10이하인 회원 레코드 조회
SELECT * FROM membertbl
where idx BETWEEN 5 AND 10;

--or
SELECT * FROM membertbl
WHERE levels = 'B' OR levels='D' OR levels='S';

--in
select*from membertbl
where levels NOT in ('B', 'D', 'S');

--like(유사검색)
SELECT * FROM bookstbl
WHERE names = '애프터 7' or names = '애프터 8';
--
SELECT * FROM bookstbl
WHERE names IN ('애프터 7','애프터 8');
--% 활용(개수 상관없이 서로 다른 부분이 있는 경우 해당 위치에 따라 활용 가능)
--_ (무슨 글자가 있는지 모르지만 해당 자리에 _개수만큼 있을 때)
SELECT * FROM bookstbl
WHERE names LIKE '_프터%';  -- 애프터%, _프터__, 애프터__, (동일하게 사용 가능)

--LIKE 유사검색
SELECT * FROM bookstbl
 WHERE description Like '%작품%'
 AND division = 'B005';
 
--LIKE와 IN은 함께 쓸 수 없음

--서브쿼리1 (WHERE절)
SELECT * FROM bookstbl
 WHERE division IN (SELECT division FROM divtbl
  WHERE names='추리');
 
--서브쿼리2 (컬럼사용)
select b.idx as "번호"
    ,b.author as "저자"
    ,b.division "장르코드"
    ,(select d.names from divtbl d where d.division = 'B005') as "장르"    
    ,b.names "책 제목"
    ,b.price "가격"

 from bookstbl b
where b.division='B005';

--서브쿼리3 (FROM절)
SELECT bb. * FROM (SELECT b.author, b.division, b.names FROM bookstbl b) bb;
                   -- 가상의 테이블 b
  --ex) bb.price 불가능 > 가상의 테이블 b에 price가 없기 때문
  
--서브쿼리 ANY
SELECT * FROM bookstbl
 WHERE division IN (SELECT division FROM divtbl
 WHERE division LIKE 'B%');
 -- WHERE절 = 은 무조건 일치하는 경우에만 사용 가능 
 -- ERROR:단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다. >> IN으로 수정
 
-- 정렬 Order by (ASC[ending]:오름차순_기본값, DESC[ending]:내림차순)
select idx, author, names, releasedate, price 
 from bookstbl
 ORDER BY price, idx DESC;
 
--DISTINCT
select DISTINCT price from bookstbl;

select * from divtbl
 where division IN (
  select DISTINCT division from bookstbl);