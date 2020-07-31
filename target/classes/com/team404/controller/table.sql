/*게시판*/
create table freeboard(
    bno number(10, 0),
    title varchar2(300) not null,
    writer varchar2(300) not null,
    content varchar2(2000) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);
 alter table freeboard add CONSTRAINT freeboard_pk PRIMARY KEY (bno);
 
 /*댓글게시판*/
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

/*유저*/
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

/*sns게시판*/
create table snsboard(
    bno number(10,0) not null,
    writer VARCHAR2(50) not null,
    content VARCHAR2(2000) not null,
    fileloca VARCHAR2(200), --파일 저장된 위치
    filename VARCHAR2(50), --파일이름
    filerealname VARCHAR2(50),--파일실제 이름
    regdate date default sysdate      
);
alter table snsboard add CONSTRAINT snsboard_pk PRIMARY key (bno);
create SEQUENCE snsboard_seq INCREMENT by 1 start with 1 NOCACHE;