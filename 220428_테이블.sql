-- 테이블 생성
create table usertbl 
(
    userid char(8) not null PRIMARY key,
    username nvarchar2(10) not null,
    addr NVARCHAR2(50)
    
);

-- 테이블 삭제
-- 관계형성 시 부모테이블을 먼저 지울 수 없음(자식테이블 먼저 지워야함)
 drop table buytbl;
 drop table usertbl;

-- 부모/자식 관계테이블 생성 : FOREIGN key(생성컬럼) REFERENCES 참조테이블(참조컬럼)
CREATE TABLE buytbl
(
    idnum number(8) not null PRIMARY KEY,
    userid char(8) not null,  -- not null 미입력시 점선모델
    buydate date,
    
    FOREIGN key(userid) REFERENCES usertbl(userid)
);

-- 제약조건 : 데이터의 무결성을 지키기 위한 제한된 조건
-- PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT, NULL






