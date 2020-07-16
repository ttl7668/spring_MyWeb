create table freeboard(
    bno number(10, 0),
    title varchar2(300) not null,
    writer varchar2(300) not null,
    content varchar2(2000) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);
 alter table freeboard add CONSTRAINT freeboard_pk PRIMARY KEY (bno);