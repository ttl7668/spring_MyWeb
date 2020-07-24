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
    rno number(10,0),--��۹�ȣ
    bno number(10,0),--�۹�ȣ
    reply varchar2(1000),--����
    replyId varchar2(50),--�۾���
    replyPw varchar2(50),--��й�ȣ
    replydate date default sysdate,--�����
    updatedate date default sysdate--������
);
create SEQUENCE freereply_seq;
alter table freereply add CONSTRAINT freereply_pk PRIMARY KEY (rno);

create table users(
    userId VARCHAR2(50) not null,
    userPw VARCHAR2(50) not null,
    userName VARCHAR2(50) not null,
    userPhone1 VARCHAR2(50) not null,
    userPhone2 VARCHAR2(50) not null,
    userEmail1 VARCHAR2(50) not null,
    userEmail2 VARCHAR2(50) not null,
    addrZipNum VARCHAR2(50) not null,
    addrBasic VARCHAR2(50) not null,
    addrDetail VARCHAR2(50) not null,
    regdate date DEFAULT sysdate
    
    );

alter table users add CONSTRAINT users_pk PRIMARY key (userId);