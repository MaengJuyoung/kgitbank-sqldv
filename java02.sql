create table test_func(id number, num VARCHAR2(20));
insert into test_func values (1, '34.5678');
select * from test_func where id = 1;
-- round : 소수점 자리수를 자르며 잘린 후 값은 반올림
select round (num, 2) from test_func where id =1;
select round (num/2, 2) from test_func where id =1;
-- trunc : 버림
select trunc(num, 2) from test_func where id = 1;
-- mod : 나머지 값
insert into test_func values (2, '55');
select num from test_func where id = 2;
select mod(num, 2) from test_func where id = 2;

drop table test_fucn;

--quiz01
-- id 3~10까지 총 10개 저장
insert into test_func values (3, '32');
insert into test_func values (4, '13');
insert into test_func values (5, '78');
insert into test_func values (6, '81');
insert into test_func values (7, '8');
insert into test_func values (8, '29');
insert into test_func values (9, '44');
insert into test_func values (10, '65');
select * from test_func;

-- 강사님 저장값~
insert into test_func values(3,'77');
insert into test_func values(4,'67.123');
insert into test_func values(5,'123.123');
insert into test_func values(6,'99');
insert into test_func values(7,'99.456');
insert into test_func values(8,'128');
insert into test_func values(9,'123.777');
insert into test_func values(10,'101.44');
select * from test_func;

-- 홀수 id 값들을 모두 출력
select * from test_func where mod(id,2)=1;

-- 짝수 id의 값(num)을 2로 나눈 후 소수점 2자리까지 표현, 버려지는 소수점은 반올림으로 진행
select id, round (num/2, 2) from test_func where mod(id, 2)=0;


insert into test_func values(11, 'welcome To oracle');
select * from test_func where id = 11;
select upper(num) from test_func where id = 11;               -- 모두 대문자로
select lower(num) from test_func where id = 11;               -- 모두 소문자로
select initcap(num) from test_func where id = 11;             -- 앞글자만 대문자로


-- quiz02
create table test_company(
  name varchar2(20),
  연봉 varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

-- manager 직급 출력
select * from test_company where lower(class)='manager';

-- employee이면서 연봉 2800 이상인 사람 출력
select * from test_company where lower(class)='employee' and 연봉>=2800;

-- 모든 사원의 첫글자는 대문자로 출력하고, 한달 급여 출력(소수점이하 버림)
select initcap(name), trunc(연봉/12), class from test_company;



create table test_class(class varchar2(10), score number);
Insert into test_class values('A반',11);
insert into test_class values('A반',12);
insert into test_class values('A반',13);
insert into test_class values('B반',21);
insert into test_class values('B반',22);
insert into test_class values('B반',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select sum(score) from test_class;          -- 총합
select avg(score) from test_class;          -- 평균
select max(score) from test_class;          -- 최댓값
select count(class) from test_class;        -- 개수(9) : 값이 없는 것은 세어주지 않음
select count(*) from test_class;            -- 개수(10)

select class, sum(score) from test_class group by class;
select class, sum(score) from test_class group by class having sum(score)>60;


-- quiz03
-- 각 클래스 별 개수 출력
select class, count(*) from test_class group by class;
-- 각 클래스 별 평균, 내림차순으로 정렬하여 출력
select class, avg(score) from test_class group by class order by avg(score) desc; 
-- 각 클래스 별 가장 큰 값, 작은 값 출력
select class, max(score), min(score) from test_class group by class;


create table test_name(id varchar2(20), class varchar2(20));
Insert into test_name values('홍길동','A반');
insert into test_name values('김개똥','B반');
insert into test_name values('고길동','C반');

create table test_lesson(id varchar2(20), lesson varchar2(20), score number);
insert into test_lesson values('홍길동','python',80);
insert into test_lesson values('홍길동','java',90);
insert into test_lesson values('홍길동','c언어',70);
insert into test_lesson values('김개똥','server2012',70);
insert into test_lesson values('김개똥','linux',90);
insert into test_lesson values('고길동','jsp',100);
select * from test_name;
select * from test_lesson;
select * from test_name, test_lesson;

-- inner join : (내부 조인) 두 테이블을 조인할 때, 두 테이블에 모두 지정한 열의 데이터가 있어야 한다.
select N.*, L.lesson, L.score from test_name N, test_lesson L;      -- 별칭 지정가능
select N.*, L.lesson, L.score from test_name N, test_lesson L where N.ID=L.ID; 
select * from test_name N inner join test_lesson L on N.ID=L.ID;       -- 위 식과 동일
select N.*, L.lesson from test_name N inner join test_lesson L on N.ID=L.ID; 


create table test01( id varchar2(20), name varchar2(20), addr varchar2(100) );
create table test02( id varchar2(20), name varchar2(20), kor number, eng number );

insert into test01 values('aaa','홍길동','산골짜기');
insert into test01 values('bbb','고길동','마포구');
insert into test01 values('ccc','초록별','이슬');

insert into test02 values('aaa','홍길동',100,90);
insert into test02 values('bbb','고길동',100,90);
insert into test02 values('ccc','초록별',100,90);

select * from test01 where name=(select name from test02 where id='aaa');

-- 테이블 생성 SQL - membership
CREATE TABLE membership
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR(50)     NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);
-- 테이블 생성 SQL - board
CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(50)    NULL, 
    b_title      VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - board.b_num
CREATE SEQUENCE abc
START WITH 1
INCREMENT BY 1;
-- Foreign Key 설정 SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
insert into membership(m_id, m_pwd, m_name, m_addr) 
    values('aaa','aaa','홍길동','산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(abc.nextval, 'aaa','제목','내용',sysdate);
select * from board;
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values( (select max(b_num) from board )+1, 'aaa','제목','내용',sysdate);
delete from board where b_id='aaa';     
-- 상위에 있는 것을 삭제하려면 하위에 있는 것을 먼저 삭제
delete from membership where m_id='aaa';
-- 연결이 되어있을 땐 부모를 먼저 삭제하려하면 오류 발생

select * from user_sequences;       -- 사용자 계정에 생성된 모든 시퀀스 조회
select * from user_constraints;     -- 제약 조건 확인

drop sequence abc;                              -- abc 시퀀스 삭제
alter table board drop constraint FK_BOARD;     -- FK_BOARD 제약 조건 삭제

insert into membership(m_id, m_pwd, m_name, m_addr) 
    values('aaa','aaa','홍길동','산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(1, 'bbb','제목','내용',sysdate);
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(2, 'aaa','제목','내용',sysdate);
select * from board;
select * from membership;   -- 위에서 제약조건을 삭제하였으므로 오류 없이 삭제 가능
delete from membership;
delete from board;

-- on delete cascade : 부모를 삭제하면 자식까지(하위의 동일한 항목까지) 같이 삭제하겠다. 
alter table board add constraint fk_board foreign key(b_id) 
    references membership(m_id) on delete cascade;
insert into membership(m_id, m_pwd, m_name, m_addr) 
    values('aaa','aaa','홍길동','산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(1, 'aaa','제목','내용',sysdate);
select * from board;
delete from membership where m_id='aaa';    -- 추가 기능으로 오류 없이 삭제 가능


-- quiz04
-- 테이블 생성 SQL - member
CREATE TABLE member
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR2(50)    NULL, 
    m_name    VARCHAR2(50)    NULL, 
    m_addr    VARCHAR2(50)    NULL, 
     PRIMARY KEY (m_id)
);
-- 테이블 생성 SQL - goods
CREATE TABLE goods
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(50)    NULL, 
    g_name         VARCHAR2(50)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_sum    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;
-- Foreign Key 설정 SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
select * from user_sequences;       -- 사용자 계정에 생성된 모든 시퀀스 조회
        
-- 윗 내용 강사님 답
-- CREATE SEQUENCE g_seq;
-- ALTER TABLE goods ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
--        REFERENCES member (m_id) ON DELETE CASCADE;
        
-- 데이터 추가
insert into member values('aaa','aaa','홍길동','산골짜기');
insert into member values('bbb','bbb','김개똥','개똥별');
insert into member values('ccc','ccc','고길동','마포구');
insert into member values('ddd','ddd','분식집','분식집');
select * from member;
insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
    values(goods_SEQ.nextval, 'aaa','운동화',75000,2,150000,sysdate);
insert into goods values(goods_SEQ.nextval, 'aaa','티셔츠',15000,5,75000,sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb','가방', 450000, 1, 450000, sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb','책',35000,2,70000,sysdate);
select * from goods;
-- inner join 사용하여 출력
select M.*, G.* from member M inner join goods G ON M.m_id = G.g_id;
select * from member M inner join goods G on M.m_id=G.g_id;
select m_id, m_name, g_name, g_price_sum from member M inner join goods G on M.m_id=G.g_id;
-- sum 함수 이용하여 아이디 별 총 금액 출력
select M.m_id,M.m_name,M.m_addr, sum(G.g_price_sum) from member M 
    inner join goods G on M.m_id=G.g_id GROUP BY M.m_id, M.m_name, M.m_addr;


-- java와 데이터베이스 연결하기(?)
create table member_test(
    id VARCHAR2(20) primary key,
    pwd VARCHAR2(20),
    name VARCHAR2(20),
    age NUMBER
);
insert into member_test values('aaa','aaa','홍길동',20);
insert into member_test values('bbb','bbb','김개똥',30);
insert into member_test values('ccc','ccc','고길동',40);
commit;
select * from member_test;
-- 자바(이클립스)에서 작성한 내용 복붙해와서 실행해보고 문제가 발생하는지 확인
select * from member_test;

