-- DBA
-- 뷰
CREATE view scott_bookslist
as
  SELECT bt.idx, bt.author as "저자", dt.division as "장르코드"
    , dt.names as "책장르명", bt.names, to_char(bt.releasedate, 'yyyy-mm-dd') as "출판일"
    , to_char(bt.price, '999,999') as "가격", bt.isbn
    FROM scott.bookstbl bt
   inner JOIN scott.divtbl dt
      ON bt.division = dt.division;
      
      
SELECT
    * FROM scott_bookslist
    where idx=6;
    
-- SCOTT
-- 인덱스
-- 클라이머리인덱스 : PK로 생성된 인덱스(순차적 인덱스)
select * from bookstbl;

create index idx_bookstbl_author on bookstbl (author asc);

create index IDX_BOOKSTBL_NAMES ON BOOKSTBL (NAMES ASC);