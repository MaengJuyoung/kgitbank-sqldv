create table person(
    num number, -- ���� ����
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

insert into person values(1000, 'ȫ�浿','20231216','010xx');
insert into person values(1001, 'ȫ�浿1','20231217','0101234');
insert into person(num, name, birth, tel) values(1002, '�谳��','20231217','0101234');

select * from person;
select num, name from person;
select * from person where num = 1000;
select * from person where name = '�谳��';

select * from tab;

delete from person;
select * from person;

insert into person values(1000, 'ȫ�浿','20231216','010xx');
insert into person values(1001, 'ȫ�浿1','20231217','0101234');
insert into person(num, name, birth, tel) values(1002, '�谳��','20231217','0101234');

select * from person;
delete from person where tel = '010xx';
select * from person;

update person set name = '�����';
select * from person;
update person set name='ȫ�浿', birth='111' where num=1001;
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
-- 1. ���̺�, �÷� ����
create table student02(
id VARCHAR2(10),
name VARCHAR2(10),
kor VARCHAR2(5),
eng VARCHAR2(5),
math VARCHAR2(5)
);
-- 2. 3�� �̻� ���� �Է�
insert into student02 values('10101', '�褷��', '90', '88', '95');
insert into student02 values('10102', '�ڤ���', '79', '98', '85');
insert into student02 values('10103', '�̤���', '96', '80', '100');
select * from student02;
-- 3. ����
update student02 set kor='95', eng='90', math='80' where id='10101';
select * from student02;
-- 4. Ȯ��(Ŀ��)
commit;
-- 5. ��� ���� ����
delete from student02;
select * from student02;
-- 6. ������ �۾� �ǵ�����
rollback;
-- 7. ������ ���ƿԴ��� Ȯ��
select * from student02;

-- ����� ��!
-- 1. ���̺� ����
create table student(
id varchar2(10),
name varchar2(20),
kor varchar2(5),
eng varchar2(5),
math varchar2(5),
primary key(id)
);
-- 2. ������ �Է� �� Ȯ��
insert into student values('1','��浿','100','100','100');
insert into student values('2','�踻��','90','90','90');
insert into student values('3','������','80','80','80');
commit;
-- 3. ������ ����
UPDATE STUDENT SET ENG='80' WHERE ID=1;
UPDATE STUDENT SET MATH='80' WHERE ID=2;
UPDATE STUDENT SET KOR='80' WHERE ID=3;
-- 4. ���� ������ Ȯ��
COMMIT;
-- 5. ��� ������ ����
DELETE FROM STUDENT;
-- 6. ������ ������ �ǵ�����
ROLLBACK;
-- 7. ������ ������ ���ƿԴ��� Ȯ�� �ϱ�
SELECT * FROM STUDENT;




create table test_table(num number);
desc test_table;

alter table test_table add(name varchar2(20));
desc test_table;

alter table test_table modify(name number);
desc test_table;

alter table test_table drop column name;
desc test_table;

alter table test_table rename column num to num_b;      -- �ռ���� _�� ����
desc test_table;

drop table test_table;
desc test_table;

drop table student;
drop table student01;

select * from student;
select * from student where eng>=90;
select * from student where kor!=100;

select math from student where name='��浿';
select math/2 from student where name='��浿';
select math+100 from student where name='��浿';
select math*100 from student where name='��浿';
select mod(math,3) from student where name='��浿';   
-- mod(num,n) : num�� n���� ���� ������ ���
select * from student;
select * from student where kor>=90 and math=100;
select * from student where kor>=90 or math=100;
select * from student where not kor>=90 ;

select * from student;
select * from student where kor>=90 and kor<=100;
select * from student where kor between 90 and 100;

create table test_number(
    num_ps number(5,2),     -- �� 5�ڸ�����, �Ҽ��� ���� 2�ڸ� ��ŭ ����.
    num_p number(3),        -- �Ǽ��� ���� 3�ڸ����� ����
    num number              -- �Է��� �� �״�� ����
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
INSERT INTO STUDENT VALUES ('4', '�����', '10', '10', '10');
SELECT * FROM STUDENT WHERE NAME LIKE '��%';     -- '��'���� �����ϴ� ��� �� ������
SELECT * FROM STUDENT WHERE NAME LIKE '%��';     -- '��'���� ������ ��� �� ������
SELECT * FROM STUDENT WHERE NAME LIKE '%��%';    -- '��'�� ���� ��� �� ������

SELECT * FROM STUDENT;
SELECT * FROM STUDENT ORDER BY NAME DESC;       -- �̸��� ������������ �������ּ���
SELECT * FROM STUDENT ORDER BY NAME ASC;        -- �̸��� ������������ �������ּ���

SELECT * FROM STUDENT ORDER BY ENG DESC;        -- ��� ������������ ����(������)
SELECT * FROM STUDENT ORDER BY ENG DESC, MATH ASC;  -- ���� ���� ������ ������



-- QUIZ01
CREATE TABLE EMPLOYEE(
    NAME VARCHAR2(15),
    SALARY NUMBER,
    JOB VARCHAR2(20),
    JOIN_COMPANY DATE
);
alter session set nls_date_format = 'YYYY/MM/DD';
INSERT INTO EMPLOYEE VALUES('ȫ�浿', 2000000, '��ǻ��', '2222/12/24');
SELECT * FROM employee;

-- QUIZ02
DELETE FROM employee;

insert into employee values('����ġ',1800000,'�Ｚ','2017/10/24');
insert into employee values('�ι�Ʈ',1850000,'����','2019/01/04');
insert into employee values('����',2200000,'����','2017/11/06');
insert into employee values('�谳��',2500000,'SK','2017/04/14');
insert into employee values('�����',2410000,'������','2018/01/09');
insert into employee values('����',1900000,'�Ｚ','2019/10/24');
insert into employee values('�Ҹ�',1800000,'����','2019/12/04');
insert into employee values('�ɽ���',4630000,'����','2015/04/02');
insert into employee values('�����',2770000,'SK','2017/01/24');
insert into employee values('�ո���',3650000,'������','2016/08/04');
insert into employee values('�Ӹ���',4210000,'�Ｚ','2015/03/18');
insert into employee values('������',2720000,'����','2017/01/04');
insert into employee values('��ġ��',4320000,'����','2015/06/07');
insert into employee values('�ȱ��',3490000,'SK','2015/09/07');
insert into employee values('��¯',2200000,'������','2017/05/04');
insert into employee values('����',1920000,'�Ｚ','2018/11/24');
insert into employee values('���',3420000,'����','2016/07/29');
insert into employee values('������',1800000,'����','2018/12/24');
insert into employee values('������',2230000,'SK','2018/01/05');
insert into employee values('�Ұ��',1800000,'������','2019/01/09');
insert into employee values('¥���',2100000,'�Ｚ','2017/10/24');
insert into employee values('�Ұ�â',2200000,'����','2017/11/04');
insert into employee values('���̽�',1950000,'����','2017/10/24');
insert into employee values('����',1800000,'SK','2018/10/24');
insert into employee values('������',1800000,'������','2019/12/07');
insert into employee values('�ϰ��',1880000,'�Ｚ','2018/11/14');
insert into employee values('���̽�',1970000,'����','2019/06/04');
insert into employee values('�ڵ���',7200000,'����','2010/01/27');
insert into employee values('�򽺺�',3570000,'SK','2015/02/17');
insert into employee values('�����',3200000,'������','2015/11/24');
insert into employee values('���̴�',2400000,'�Ｚ','2017/09/26');
insert into employee values('�踻��',7000000,'����','2010/01/21');
insert into employee values('������',6230000,'����','2011/08/19');

insert into employee values('������',3710000,'SK','2015/08/19');
insert into employee values('ȭ����',1770000,'������','2019/04/28');
insert into employee values('��ȭ��',1920000,'�Ｚ','2019/10/07');
insert into employee values('��ȿ��',2670000,'����','2017/11/24');
insert into employee values('�Ǻ���',3120000,'����','2016/05/19');
insert into employee values('�����',4190000,'SK','2015/01/02');
insert into employee values('������',4280000,'������','2015/01/02');
insert into employee values('���߱�',3700000,'�Ｚ','2016/02/17');
insert into employee values('��ȫ��',2220000,'����','2018/02/04');
insert into employee values('������',2760000,'����','2017/10/14');
insert into employee values('��â��',2620000,'SK','2017/09/04');
insert into employee values('���ڶ�',2500000,'������','2017/11/20');
insert into employee values('�߽���',1970000,'�Ｚ','2017/10/30');
insert into employee values('����', 2720000,'����','2018/11/11');
insert into employee values('������',2600000,'����','2015/11/19');
insert into employee values('������',5670000,'SK','2017/10/16');
insert into employee values('��ȿ��',3750000,'������','2015/09/15');
insert into employee values('��ä��',3400000,'�Ｚ','2016/02/09');
insert into employee values('�ְ��',8900000,'����','2010/01/04');
insert into employee values('��ȭ��',1860000,'����','2017/10/24');
insert into employee values('���빮',1790000,'SK','2017/10/24');
insert into employee values('���빮',2880000,'������','2016/02/27');
insert into employee values('�����',2320000,'�Ｚ','2016/05/24');
insert into employee values('������',1780000,'����','2019/01/09');
insert into employee values('���ҹ�',2900000,'����','2016/10/22');
insert into employee values('���ʿ�',3000000,'SK','2015/10/10');
insert into employee values('���ѱ�',3200000,'������','2015/11/11');
insert into employee values('���ѱ�',2500000,'�Ｚ','2016/12/19');
insert into employee values('¥����',1850000,'����','2018/04/03');
insert into employee values('�̽±�',1900000,'����','2018/01/01');
insert into employee values('������',1790000,'SK','2018/05/02');
insert into employee values('��Ÿ�',2700000,'������','2016/07/20');

SELECT * FROM employee WHERE SALARY*12>=100000000;
SELECT NAME, JOIN_COMPANY FROM employee WHERE JOIN_COMPANY <'2015/01/01';
SELECT * FROM employee WHERE SALARY BETWEEN 2800000 AND 3000000; 

-- QUIZ03
SELECT * FROM employee WHERE JOIN_COMPANY>'2015/01/01' AND SALARY*12>=60000000;
SELECT * FROM employee WHERE (JOB='�Ｚ' OR JOB='����') AND SALARY*12>=50000000;

-- QUIZ04
SELECT * FROM employee WHERE NAME LIKE '��%' AND SALARY*12>=30000000 ORDER BY JOB ASC, SALARY DESC;

commit;


