create table login_fx(
id varchar(20) Primary key not null,
email varchar(20) not null,
pwd varchar(20) not null,
name varchar(20) not null
);
create table movie_board(
    moviename varchar2(50),
    content varchar2(2000)
);
select * from movie_board;