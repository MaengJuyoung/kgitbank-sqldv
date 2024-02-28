create table person(
    num number, -- 숫자 저장
    name VARCHAR2(20),
    BIRth VARCHAR2(10),
    teL VARchar2(20),
    PRIMARY key(num)
);
desc person;
create table person111(
    num number,
    name VARCHAR2(10) ,
    BIRth VARCHAR2(10) not null,
    teL VARchar2(20),
    PRIMARY key(name)
);
desc person111;

insert into person values(1000, '홍길동','20231216','010xx');
insert into person values(1001, '홍길동1','20231217','0101234');
insert into person(num, name, birth, tel) values(1002, '김개똥','20231217','0101234');

select * from person;
select num, name from person;
select * from person where num = 1000;
select * from person where name = '김개똥';

select * from tab;

delete from person;
select * from person;

insert into person values(1000, '홍길동','20231216','010xx');
insert into person values(1001, '홍길동1','20231217','0101234');
insert into person(num, name, birth, tel) values(1002, '김개똥','20231217','0101234');

select * from person;
delete from person where tel = '010xx';
select * from person;

update person set name = '김길이';
select * from person;
update person set name='홍길동', birth='111' where num=1001;
select * from person;

commit;

delete from person;
select * from person;
rollback;
select * from person;

-- quiz01 
create table student(
num number,
id VARCHAR2(10),
name VARCHAR2(10),
kor NUMBER,
eng NUMBER,
math NUMBER
);
delete from student;

-- quiz01 
-- 1.
create table student01(
id VARCHAR2(10),
name VARCHAR2(10),
kor NUMBER,
eng NUMBER,
math NUMBER
);

-- quiz01 
-- 1. 테이블, 컬럼 생성
create table student02(
id VARCHAR2(10),
name VARCHAR2(10),
kor VARCHAR2(5),
eng VARCHAR2(5),
math VARCHAR2(5)
);
-- 2. 3명 이상 정보 입력
insert into student02 values('10101', '김ㅇㅇ', '90', '88', '95');
insert into student02 values('10102', '박ㅇㅇ', '79', '98', '85');
insert into student02 values('10103', '이ㅇㅇ', '96', '80', '100');
select * from student02;
-- 3. 수정
update student02 set kor='95', eng='90', math='80' where id='10101';
select * from student02;
-- 4. 확정(커밋)
commit;
-- 5. 모든 정보 삭제
delete from student02;
select * from student02;
-- 6. 삭제된 작업 되돌리기
rollback;
-- 7. 정보가 돌아왔는지 확인
select * from student02;

-- 강사님 답!
-- 1. 테이블 생성
create table student(
id varchar2(10),
name varchar2(20),
kor varchar2(5),
eng varchar2(5),
math varchar2(5),
primary key(id)
);
-- 2. 데이터 입력 및 확정
insert into student values('1','고길동','100','100','100');
insert into student values('2','김말이','90','90','90');
insert into student values('3','현대인','80','80','80');
commit;
-- 3. 데이터 수정
UPDATE STUDENT SET ENG='80' WHERE ID=1;
UPDATE STUDENT SET MATH='80' WHERE ID=2;
UPDATE STUDENT SET KOR='80' WHERE ID=3;
-- 4. 수정 데이터 확정
COMMIT;
-- 5. 모든 데이터 삭제
DELETE FROM STUDENT;
-- 6. 삭제된 데이터 되돌리기
ROLLBACK;
-- 7. 삭제된 데이터 돌아왔는지 확인 하기
SELECT * FROM STUDENT;




create table test_table(num number);
desc test_table;

alter table test_table add(name varchar2(20));
desc test_table;

alter table test_table modify(name number);
desc test_table;

alter table test_table drop column name;
desc test_table;

alter table test_table rename column num to num_b;      -- 합성어는 _로 구분
desc test_table;

drop table test_table;
desc test_table;

drop table student;
drop table student01;

select * from student;
select * from student where eng>=90;
select * from student where kor!=100;

select math from student where name='고길동';
select math/2 from student where name='고길동';
select math+100 from student where name='고길동';
select math*100 from student where name='고길동';
select mod(math,3) from student where name='고길동';   
-- mod(num,n) : num을 n으로 나눈 나머지 출력
select * from student;
select * from student where kor>=90 and math=100;
select * from student where kor>=90 or math=100;
select * from student where not kor>=90 ;

select * from student;
select * from student where kor>=90 and kor<=100;
select * from student where kor between 90 and 100;

create table test_number(
    num_ps number(5,2),     -- 총 5자리저장, 소수의 값은 2자리 만큼 저장.
    num_p number(3),        -- 실수의 값만 3자리까지 저장
    num number              -- 입력한 수 그대로 저장
);
insert into test_number values(1.123456, 1.123456, 1.123456);
insert into test_number values(1234.123456, 1.123456, 1.123456);
insert into test_number values(1.123456, 123.123456, 1.123456);

select * from test_number;


-- Date java.util.Date, java,sql,Date
create table test_date(my_date date);
insert into test_date values(sysdate);
insert into test_date values ('2000/12/24');
select * from test_date;
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
insert into test_date values ('2000/12/24 12:12:12');
select * from test_date;
select * from test_date where my_date < '2024/02/27';

CREATE TABLE TEST_CHAR(
    CH CHAR(5),
    VAR VARCHAR2(20)
);
INSERT INTO TEST_CHAR VALUES('1','1');
SELECT LENGTHB(CH), LENGTHB(VAR) FROM TEST_CHAR;

SELECT * FROM STUDENT;
INSERT INTO STUDENT VALUES ('4', '길고인', '10', '10', '10');
SELECT * FROM STUDENT WHERE NAME LIKE '김%';     -- '김'으로 시작하는 모든 값 가져옴
SELECT * FROM STUDENT WHERE NAME LIKE '%인';     -- '인'으로 끝나는 모든 값 가져옴
SELECT * FROM STUDENT WHERE NAME LIKE '%고%';    -- '고'가 들어가는 모든 값 가져옴

SELECT * FROM STUDENT;
SELECT * FROM STUDENT ORDER BY NAME DESC;       -- 이름을 내림차순으로 정렬해주세용
SELECT * FROM STUDENT ORDER BY NAME ASC;        -- 이름을 오름차순으로 정렬해주세용

SELECT * FROM STUDENT ORDER BY ENG DESC;        -- 영어를 내림차순으로 정렬(성적순)
SELECT * FROM STUDENT ORDER BY ENG DESC, MATH ASC;  -- 같은 값들 끼리의 재정렬



-- QUIZ01
CREATE TABLE EMPLOYEE(
    NAME VARCHAR2(15),
    SALARY NUMBER,
    JOB VARCHAR2(20),
    JOIN_COMPANY DATE
);
alter session set nls_date_format = 'YYYY/MM/DD';
INSERT INTO EMPLOYEE VALUES('홍길동', 2000000, '컴퓨터', '2222/12/24');
SELECT * FROM employee;

-- QUIZ02
DELETE FROM employee;

insert into employee values('설까치',1800000,'삼성','2017/10/24');
insert into employee values('로버트',1850000,'애플','2019/01/04');
insert into employee values('고도리',2200000,'엘지','2017/11/06');
insert into employee values('김개똥',2500000,'SK','2017/04/14');
insert into employee values('리우뚱',2410000,'샤오미','2018/01/09');
insert into employee values('강민',1900000,'삼성','2019/10/24');
insert into employee values('할리',1800000,'애플','2019/12/04');
insert into employee values('심심해',4630000,'엘지','2015/04/02');
insert into employee values('놀아줘',2770000,'SK','2017/01/24');
insert into employee values('왕만두',3650000,'샤오미','2016/08/04');
insert into employee values('머리빨',4210000,'삼성','2015/03/18');
insert into employee values('마리오',2720000,'애플','2017/01/04');
insert into employee values('최치우',4320000,'엘지','2015/06/07');
insert into employee values('안깔쌈',3490000,'SK','2015/09/07');
insert into employee values('끝짱',2200000,'샤오미','2017/05/04');
insert into employee values('막장',1920000,'삼성','2018/11/24');
insert into employee values('드라마',3420000,'애플','2016/07/29');
insert into employee values('개똥이',1800000,'엘지','2018/12/24');
insert into employee values('마포구',2230000,'SK','2018/01/05');
insert into employee values('소고기',1800000,'샤오미','2019/01/09');
insert into employee values('짜장면',2100000,'삼성','2017/10/24');
insert into employee values('소곱창',2200000,'애플','2017/11/04');
insert into employee values('참이슬',1950000,'엘지','2017/10/24');
insert into employee values('뤼우뚱',1800000,'SK','2018/10/24');
insert into employee values('위메프',1800000,'샤오미','2019/12/07');
insert into employee values('북경시',1880000,'삼성','2018/11/14');
insert into employee values('스미스',1970000,'애플','2019/06/04');
insert into employee values('핸드폰',7200000,'엘지','2010/01/27');
insert into employee values('빅스비',3570000,'SK','2015/02/17');
insert into employee values('노라줘',3200000,'샤오미','2015/11/24');
insert into employee values('사이다',2400000,'삼성','2017/09/26');
insert into employee values('김말이',7000000,'애플','2010/01/21');
insert into employee values('오도독',6230000,'엘지','2011/08/19');

insert into employee values('쌈지돈',3710000,'SK','2015/08/19');
insert into employee values('화장지',1770000,'샤오미','2019/04/28');
insert into employee values('소화기',1920000,'삼성','2019/10/07');
insert into employee values('박효신',2670000,'애플','2017/11/24');
insert into employee values('판빙빙',3120000,'엘지','2016/05/19');
insert into employee values('김재욱',4190000,'SK','2015/01/02');
insert into employee values('송혜교',4280000,'샤오미','2015/01/02');
insert into employee values('송중기',3700000,'삼성','2016/02/17');
insert into employee values('손홍민',2220000,'애플','2018/02/04');
insert into employee values('백종원',2760000,'엘지','2017/10/14');
insert into employee values('오창석',2620000,'SK','2017/09/04');
insert into employee values('스텔라',2500000,'샤오미','2017/11/20');
insert into employee values('멕스웰',1970000,'삼성','2017/10/30');
insert into employee values('조현', 2720000,'애플','2018/11/11');
insert into employee values('류현진',2600000,'엘지','2015/11/19');
insert into employee values('은지원',5670000,'SK','2017/10/16');
insert into employee values('전효성',3750000,'샤오미','2015/09/15');
insert into employee values('이채은',3400000,'삼성','2016/02/09');
insert into employee values('최고봉',8900000,'애플','2010/01/04');
insert into employee values('광화문',1860000,'엘지','2017/10/24');
insert into employee values('동대문',1790000,'SK','2017/10/24');
insert into employee values('서대문',2880000,'샤오미','2016/02/27');
insert into employee values('대통령',2320000,'삼성','2016/05/24');
insert into employee values('예지원',1780000,'애플','2019/01/09');
insert into employee values('정소민',2900000,'엘지','2016/10/22');
insert into employee values('워너원',3000000,'SK','2015/10/10');
insert into employee values('북한군',3200000,'샤오미','2015/11/11');
insert into employee values('남한군',2500000,'삼성','2016/12/19');
insert into employee values('짜투리',1850000,'애플','2018/04/03');
insert into employee values('이승기',1900000,'엘지','2018/01/01');
insert into employee values('기차길',1790000,'SK','2018/05/02');
insert into employee values('길거리',2700000,'샤오미','2016/07/20');

SELECT * FROM employee WHERE SALARY*12>=100000000;
SELECT NAME, JOIN_COMPANY FROM employee WHERE JOIN_COMPANY <'2015/01/01';
SELECT * FROM employee WHERE SALARY BETWEEN 2800000 AND 3000000; 

-- QUIZ03
SELECT * FROM employee WHERE JOIN_COMPANY>'2015/01/01' AND SALARY*12>=60000000;
SELECT * FROM employee WHERE (JOB='삼성' OR JOB='엘지') AND SALARY*12>=50000000;

-- QUIZ04
SELECT * FROM employee WHERE NAME LIKE '김%' AND SALARY*12>=30000000 ORDER BY JOB ASC, SALARY DESC;

commit;


