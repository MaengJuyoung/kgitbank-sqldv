CREATE TABLE member_fx(
   id VARCHAR(20) PRIMARY KEY NOT NULL,
   pwd VARCHAR(20) NOT NULL,
   name VARCHAR(20) NOT NULL,
   gender NUMBER NOT NULL,
   age VARCHAR(10),
   hobby NUMBER
);
select * from member_fx;
alter table member_fx modify(age varchar2(20));
delete from member_fx;
commit;     -- ����, ����, �߰� �� �ε� ����� �� �ִµ� �̷��� commit ���ְ� �����ϱ�

