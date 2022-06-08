-- INNER JOIN

SELECT bt.idx, bt.author as "저자", dt.division as "장르코드"
    , dt.names as "책장르명", bt.names, to_char(bt.releasedate, 'yyyy-mm-dd') as "출판일"
    , to_char(bt.price, '999,999') as "가격", bt.isbn
  FROM bookstbl bt
 inner JOIN divtbl dt
    ON bt.division = dt.division
 WHERE dt.division = 'B005';


-- INNER JOIN, 테이블 3개 ***
select r.idx, to_char(r.rentaldate, 'yyyy-mm-dd') as "대여일"
     , to_char(r.returndate, 'yyyy-mm-dd') as "반납일"
     , m.names as "대여자"
     , b.names as "빌린 책"
 from membertbl m
 inner join rentaltbl r
    on m.idx = r.memberidx
 inner join bookstbl b
    on b.idx = r.bookidx
 where r.returndate is not null   -- 도서 (미)반납자 조회 조건문(null 조회시 = 아닌 is)
 order by r.idx;
 
 
-- (LEFT, RIGHT) OUTER JOIN : (outer join을 기준으로 기준테이블 위치 설정)
-- 기준 테이블과 해당 조건에 만족하지 않는 레코드와 도출
select m.idx as "회원번호", m.names as "회원명"
     , m.levels, m.mobile, m.email
     , r.idx
 from membertbl m
 left outer join rentaltbl r
    on m.idx = r.memberidx
 where r.idx is null
   and m.levels <> 'S'; -- 레벨 S는 관리자

-- 자식테이블(rentaltbl) 기준인 경우 null값 확인 불가 : 기준은 부모테이블이어야 함
select *
 from membertbl m
 right outer join rentaltbl r
    on m.idx = r.memberidx;

-- 한번도 대여되지 않은 도서 조회 가능
SELECT b.idx as "도서코드", b.names as "도서명"
     , b.author, b.price
     , r.idx, r.rentaldate, r.returndate
  FROM bookstbl b
  left outer join rentaltbl r
    on b.idx = r.bookidx
  where r.idx is null;

-- OUTER JOIN, 테이블 3개
--select d.division as "도서코드", d.names as "장르"
--     , r.idx as "렌탈ID", b.idx as "도서ID", b.names as "도서명"
--     , COUNT(DISTINCT(case when d.names !='' ans b.names !='' then 1 else  end))
--     as names_cnt
-- from rentaltbl r
-- right outer join bookstbl b
--   on b.idx = r.bookidx
-- right outer join divtbl d
--   on b.division = d.division
-- where r.idx is null;


-- UNION  강의 ex) 몇개월간 입출금 내역 조회
select idx, names from bookstbl
 union 
select idx, names from membertbl;

-- 컬럼 형태가 다른 경우 union 불가능 (price_수치, names_문자 : to_char 등 형태 동일시 필요)
select idx, price from bookstbl
 union 
select idx, names from membertbl;

