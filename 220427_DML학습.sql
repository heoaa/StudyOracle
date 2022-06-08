-- INSERT 학습

-- CREATE TABLE
CREATE TABLE testtbl
(
    id number(4) not null PRIMARY key,
    username NVARCHAR2(10),
    age number(3)
);

-- INSERT
INSERT INTO testtbl (id, username, age) VALUES (1, '홍길동', 99);
-- 똑같은 컬럼으로 넣는 경우 컬럼 생략 가능
INSERT INTO testtbl VALUES (2, N'홍길순', 97); 
-- error: 값의 수가 일치하지 않음
INSERT INTO testtbl VALUES (3, N'홍길자'); 
-- 대체방법
INSERT INTO testtbl VALUES (3, N'홍길자', NULL); 

INSERT INTO testtbl (id, username) VALUES (4, '허아현'); 

-- 되돌리기
ROLLBACK;

-- 완전저장
COMMIT;

-- CREATE TABLE
CREATE TABLE testtbl2
(
    id number(4) not null PRIMARY key,
    username NVARCHAR2(10),
    age number(3)
);


-- id 시퀀스 생성(자동 증가 객체)
CREATE SEQUENCE test2seq -- 시퀀스 이름
 START WITH 1 -- 시작 값
 INCREMENT BY 1; -- 증가 값
 
-- 시퀀스 사용 입력
INSERT INTO testtbl2 (id, username, age)
 VALUES (TEST2SEQ.nextval, '홍길순', 97);
 
 COMMIT;
 
-- update(where절 필수!)
UPDATE testtbl2
 set username='홍길순'
 , age=97
 where id =2;
 
-- Delete
 Delete from testtbl2 where id =3;
 
 
-- 