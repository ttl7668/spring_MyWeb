create table freeboard(
    bno number(10, 0),
    title varchar2(300) not null,
    writer varchar2(300) not null,
    content varchar2(2000) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);
 alter table freeboard add CONSTRAINT freeboard_pk PRIMARY KEY (bno);
 
 create table freereply (
    rno number(10,0),--댓글번호
    bno number(10,0),--글번호
    reply varchar2(1000),--내용
    replyId varchar2(50),--글쓴이
    replyPw varchar2(50),--비밀번호
    replydate date default sysdate,--등록일
    updatedate date default sysdate--수정일
);
create SEQUENCE freereply_seq;
alter table freereply add CONSTRAINT freereply_pk PRIMARY KEY (rno);