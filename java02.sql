create table test_func(id number, num VARCHAR2(20));
insert into test_func values (1, '34.5678');
select * from test_func where id = 1;
-- round : �Ҽ��� �ڸ����� �ڸ��� �߸� �� ���� �ݿø�
select round (num, 2) from test_func where id =1;
select round (num/2, 2) from test_func where id =1;
-- trunc : ����
select trunc(num, 2) from test_func where id = 1;
-- mod : ������ ��
insert into test_func values (2, '55');
select num from test_func where id = 2;
select mod(num, 2) from test_func where id = 2;

drop table test_fucn;

--quiz01
-- id 3~10���� �� 10�� ����
insert into test_func values (3, '32');
insert into test_func values (4, '13');
insert into test_func values (5, '78');
insert into test_func values (6, '81');
insert into test_func values (7, '8');
insert into test_func values (8, '29');
insert into test_func values (9, '44');
insert into test_func values (10, '65');
select * from test_func;

-- ����� ���尪~
insert into test_func values(3,'77');
insert into test_func values(4,'67.123');
insert into test_func values(5,'123.123');
insert into test_func values(6,'99');
insert into test_func values(7,'99.456');
insert into test_func values(8,'128');
insert into test_func values(9,'123.777');
insert into test_func values(10,'101.44');
select * from test_func;

-- Ȧ�� id ������ ��� ���
select * from test_func where mod(id,2)=1;

-- ¦�� id�� ��(num)�� 2�� ���� �� �Ҽ��� 2�ڸ����� ǥ��, �������� �Ҽ����� �ݿø����� ����
select id, round (num/2, 2) from test_func where mod(id, 2)=0;


insert into test_func values(11, 'welcome To oracle');
select * from test_func where id = 11;
select upper(num) from test_func where id = 11;               -- ��� �빮�ڷ�
select lower(num) from test_func where id = 11;               -- ��� �ҹ��ڷ�
select initcap(num) from test_func where id = 11;             -- �ձ��ڸ� �빮�ڷ�


-- quiz02
create table test_company(
  name varchar2(20),
  ���� varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

-- manager ���� ���
select * from test_company where lower(class)='manager';

-- employee�̸鼭 ���� 2800 �̻��� ��� ���
select * from test_company where lower(class)='employee' and ����>=2800;

-- ��� ����� ù���ڴ� �빮�ڷ� ����ϰ�, �Ѵ� �޿� ���(�Ҽ������� ����)
select initcap(name), trunc(����/12), class from test_company;



create table test_class(class varchar2(10), score number);
Insert into test_class values('A��',11);
insert into test_class values('A��',12);
insert into test_class values('A��',13);
insert into test_class values('B��',21);
insert into test_class values('B��',22);
insert into test_class values('B��',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select sum(score) from test_class;          -- ����
select avg(score) from test_class;          -- ���
select max(score) from test_class;          -- �ִ�
select count(class) from test_class;        -- ����(9) : ���� ���� ���� �������� ����
select count(*) from test_class;            -- ����(10)

select class, sum(score) from test_class group by class;
select class, sum(score) from test_class group by class having sum(score)>60;


-- quiz03
-- �� Ŭ���� �� ���� ���
select class, count(*) from test_class group by class;
-- �� Ŭ���� �� ���, ������������ �����Ͽ� ���
select class, avg(score) from test_class group by class order by avg(score) desc; 
-- �� Ŭ���� �� ���� ū ��, ���� �� ���
select class, max(score), min(score) from test_class group by class;


create table test_name(id varchar2(20), class varchar2(20));
Insert into test_name values('ȫ�浿','A��');
insert into test_name values('�谳��','B��');
insert into test_name values('��浿','C��');

create table test_lesson(id varchar2(20), lesson varchar2(20), score number);
insert into test_lesson values('ȫ�浿','python',80);
insert into test_lesson values('ȫ�浿','java',90);
insert into test_lesson values('ȫ�浿','c���',70);
insert into test_lesson values('�谳��','server2012',70);
insert into test_lesson values('�谳��','linux',90);
insert into test_lesson values('��浿','jsp',100);
select * from test_name;
select * from test_lesson;
select * from test_name, test_lesson;

-- inner join : (���� ����) �� ���̺��� ������ ��, �� ���̺� ��� ������ ���� �����Ͱ� �־�� �Ѵ�.
select N.*, L.lesson, L.score from test_name N, test_lesson L;      -- ��Ī ��������
select N.*, L.lesson, L.score from test_name N, test_lesson L where N.ID=L.ID; 
select * from test_name N inner join test_lesson L on N.ID=L.ID;       -- �� �İ� ����
select N.*, L.lesson from test_name N inner join test_lesson L on N.ID=L.ID; 


create table test01( id varchar2(20), name varchar2(20), addr varchar2(100) );
create table test02( id varchar2(20), name varchar2(20), kor number, eng number );

insert into test01 values('aaa','ȫ�浿','���¥��');
insert into test01 values('bbb','��浿','������');
insert into test01 values('ccc','�ʷϺ�','�̽�');

insert into test02 values('aaa','ȫ�浿',100,90);
insert into test02 values('bbb','��浿',100,90);
insert into test02 values('ccc','�ʷϺ�',100,90);

select * from test01 where name=(select name from test02 where id='aaa');

-- ���̺� ���� SQL - membership
CREATE TABLE membership
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR(50)     NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);
-- ���̺� ���� SQL - board
CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(50)    NULL, 
    b_title      VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

-- Auto Increment�� ���� Sequence �߰� SQL - board.b_num
CREATE SEQUENCE abc
START WITH 1
INCREMENT BY 1;
-- Foreign Key ���� SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
insert into membership(m_id, m_pwd, m_name, m_addr) 
    values('aaa','aaa','ȫ�浿','���¥��');
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(abc.nextval, 'aaa','����','����',sysdate);
select * from board;
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values( (select max(b_num) from board )+1, 'aaa','����','����',sysdate);
delete from board where b_id='aaa';     
-- ������ �ִ� ���� �����Ϸ��� ������ �ִ� ���� ���� ����
delete from membership where m_id='aaa';
-- ������ �Ǿ����� �� �θ� ���� �����Ϸ��ϸ� ���� �߻�

select * from user_sequences;       -- ����� ������ ������ ��� ������ ��ȸ
select * from user_constraints;     -- ���� ���� Ȯ��

drop sequence abc;                              -- abc ������ ����
alter table board drop constraint FK_BOARD;     -- FK_BOARD ���� ���� ����

insert into membership(m_id, m_pwd, m_name, m_addr) 
    values('aaa','aaa','ȫ�浿','���¥��');
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(1, 'bbb','����','����',sysdate);
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(2, 'aaa','����','����',sysdate);
select * from board;
select * from membership;   -- ������ ���������� �����Ͽ����Ƿ� ���� ���� ���� ����
delete from membership;
delete from board;

-- on delete cascade : �θ� �����ϸ� �ڽı���(������ ������ �׸����) ���� �����ϰڴ�. 
alter table board add constraint fk_board foreign key(b_id) 
    references membership(m_id) on delete cascade;
insert into membership(m_id, m_pwd, m_name, m_addr) 
    values('aaa','aaa','ȫ�浿','���¥��');
insert into board(b_num, b_id, b_title, b_content, b_date) 
    values(1, 'aaa','����','����',sysdate);
select * from board;
delete from membership where m_id='aaa';    -- �߰� ������� ���� ���� ���� ����


-- quiz04
-- ���̺� ���� SQL - member
CREATE TABLE member
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR2(50)    NULL, 
    m_name    VARCHAR2(50)    NULL, 
    m_addr    VARCHAR2(50)    NULL, 
     PRIMARY KEY (m_id)
);
-- ���̺� ���� SQL - goods
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

-- Auto Increment�� ���� Sequence �߰� SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;
-- Foreign Key ���� SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
select * from user_sequences;       -- ����� ������ ������ ��� ������ ��ȸ
        
-- �� ���� ����� ��
-- CREATE SEQUENCE g_seq;
-- ALTER TABLE goods ADD CONSTRAINT g_id_m_id FOREIGN KEY (g_id)
--        REFERENCES member (m_id) ON DELETE CASCADE;
        
-- ������ �߰�
insert into member values('aaa','aaa','ȫ�浿','���¥��');
insert into member values('bbb','bbb','�谳��','���˺�');
insert into member values('ccc','ccc','��浿','������');
insert into member values('ddd','ddd','�н���','�н���');
select * from member;
insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
    values(goods_SEQ.nextval, 'aaa','�ȭ',75000,2,150000,sysdate);
insert into goods values(goods_SEQ.nextval, 'aaa','Ƽ����',15000,5,75000,sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb','����', 450000, 1, 450000, sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb','å',35000,2,70000,sysdate);
select * from goods;
-- inner join ����Ͽ� ���
select M.*, G.* from member M inner join goods G ON M.m_id = G.g_id;
select * from member M inner join goods G on M.m_id=G.g_id;
select m_id, m_name, g_name, g_price_sum from member M inner join goods G on M.m_id=G.g_id;
-- sum �Լ� �̿��Ͽ� ���̵� �� �� �ݾ� ���
select M.m_id,M.m_name,M.m_addr, sum(G.g_price_sum) from member M 
    inner join goods G on M.m_id=G.g_id GROUP BY M.m_id, M.m_name, M.m_addr;


-- java�� �����ͺ��̽� �����ϱ�(?)
create table member_test(
    id VARCHAR2(20) primary key,
    pwd VARCHAR2(20),
    name VARCHAR2(20),
    age NUMBER
);
insert into member_test values('aaa','aaa','ȫ�浿',20);
insert into member_test values('bbb','bbb','�谳��',30);
insert into member_test values('ccc','ccc','��浿',40);
commit;
select * from member_test;
-- �ڹ�(��Ŭ����)���� �ۼ��� ���� �����ؿͼ� �����غ��� ������ �߻��ϴ��� Ȯ��
select * from member_test;

