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
commit;     -- 삭제, 수정, 추가 시 로딩 길어질 수 있는데 이럴땐 commit 해주고 실행하기

