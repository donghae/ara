--계정명: ara 
--비밀번호 : ara
--ip 주소 : 192.168.0.125


--테이블
select * from tab;
commit;
purge recyclebin;
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';
DROP TABLE TEST CASCADE CONSTRAINTS;
DROP TABLE TBL_ADMIN CASCADE CONSTRAINTS;
DROP TABLE TBL_LIB_SEAT CASCADE CONSTRAINTS;
DROP TABLE TBL_BUS CASCADE CONSTRAINTS;
DROP TABLE TBL_UNI_DIET CASCADE CONSTRAINTS;
DROP TABLE TBL_DOM_DIET CASCADE CONSTRAINTS;
DROP TABLE TBL_DORM CASCADE CONSTRAINTS;
DROP TABLE TBL_DORM_STUDENT CASCADE CONSTRAINTS;
DROP TABLE TBL_BOOK CASCADE CONSTRAINTS;
DROP TABLE TBL_DOM_NOTICE CASCADE CONSTRAINTS;
DROP TABLE TBL_ENTRANCE CASCADE CONSTRAINTS;


--관리자★ 
CREATE TABLE TBL_ADMIN(
    ad_no       VARCHAR2(10) PRIMARY KEY,    --관리자번호
    ad_pwd      VARCHAR2(150)   NOT NULL, --비밀번호
    ad_name     VARCHAR2(150) NOT NULL, --이름
    ad_hp       VARCHAR2(20),     --번호
    ad_zipcode  VARCHAR2(7),    --우편번호
    ad_addr1    VARCHAR2(500), --주소1
    ad_addr2    VARCHAR2(500), --주소2
    ad_birth_dt DATE,          --생년월일
    ad_email    VARCHAR2(300), --이메일
    ad_img      VARCHAR2(500) --사진    
);

--전공★
CREATE TABLE TBL_MAJOR(
    maj_cd    NUMBER(3), --전공명
    prof_no   VARCHAR2(10),    --전임교수 번호
    maj_office_no NUMBER(10),    --과사무실 번호
    maj_cnt NUMBER(2),  --전공생 수
    maj_tuition NUMBER(8),  --학비
    maj_info  VARCHAR2(3000),--전공 설명
    CONSTRAINT TBL_MAJOR_maj_cd_PK PRIMARY KEY(maj_cd)
);


--학생★
CREATE TABLE TBL_STUDENT(
    st_no         VARCHAR2(10),    --학번
    maj_cd          NUMBER(3),   --전공명
    st_pwd        VARCHAR2(150), --비밀번호
    st_name       VARCHAR2(150), --이름
    st_hp         VARCHAR2(20),    --전화번호
    st_ent_dt     DATE,          --입학일
    st_level      NUMBER(1),    --학년
    st_abs_fl     NUMBER(1),    --휴학여부
    st_disable_fl NUMBER(1),    --장애여부
    st_birth      VARCHAR2(10),          --생년월일
    st_zipcode    NUMBER(7),    --우편번호
    st_addr1      VARCHAR2(500), --주소1
    st_addr2      VARCHAR2(500), --주소2
    st_email      VARCHAR2(150), --이메일
    st_bk           VARCHAR2(50),--은행명
    st_bk_holder    VARCHAR2(150),  --예금주명
    st_bkno     VARCHAR2(20),    --계좌번호
    st_point    NUMBER(3),      --이수학점
    st_schol      NUMBER(8),    --장학금
    st_tuition_dt DATE,          --등록금 납부일
    cc_name       VARCHAR2(150), --동아리명
    st_img        VARCHAR2(500), --사진
    st_regi_no		VARCHAR2(14),	--수강신청번호
    CONSTRAINT TBL_STUDENT_st_no_PK PRIMARY KEY(st_no),
    CONSTRAINT FK_maj_cd_STUDNET FOREIGN KEY (maj_cd) REFERENCES TBL_MAJOR (maj_cd) ON DELETE CASCADE, 
    CONSTRAINT FK_cc_name_STUDENT FOREIGN KEY (cc_name) REFERENCES TBL_CIRCLE (cc_name) ON DELETE CASCADE
);


--교수★
CREATE TABLE TBL_PROF(
    prof_no      VARCHAR2(10),    --교번
    maj_cd       NUMBER(3), --전공명
    prof_pwd     VARCHAR2(150), --비밀번호
    prof_hp      VARCHAR2(20),    --전화번호
    prof_name    VARCHAR2(150), --이름
    prof_birth   VARCHAR2(10),  --생년월일
    prof_zipcode NUMBER(7),    --우편번호
    prof_addr1   VARCHAR2(500), --주소1
    prof_addr2   VARCHAR2(500), --주소2
    prof_email   VARCHAR2(150), --이메일
    prof_img     VARCHAR2(500), --사진
    CONSTRAINT TBL_PROF_prof_no_PK PRIMARY KEY(prof_no),
    CONSTRAINT FK_maj_cd_PROF FOREIGN KEY (maj_cd) REFERENCES TBL_MAJOR (maj_cd) ON DELETE CASCADE
);



--입학신청★
CREATE TABLE TBL_ENTRANCE(
    ent_no            NUMBER(8),    --수험번호
    ent_name          VARCHAR2(150), --이름
    ent_regi_no        NUMBER(14),  --주민등록번호
    ent_hp           VARCHAR2(20),    --전화번호
    ent_zipcode       VARCHAR2(7),    --우편번호
    ent_addr1         VARCHAR2(500), --주소1
    ent_addr2         VARCHAR2(500), --주소2
    ent_email         VARCHAR2(150), --이메일
    ent_disability_fl NUMBER(1),    --장애여부
    ent_highschool  VARCHAR2(500),  --출신학교
    ent_grade       NUMBER(3),      --수능성적
    ent_maj            VARCHAR2(300),   --지원학과
    ent_image         VARCHAR2(500), --사진
    ent_state       NUMBER(1),  --입학지원상태
    CONSTRAINT TBL_ENTRANCE_ent_no_PK PRIMARY KEY(ent_no)
);



--강의★
CREATE TABLE TBL_LECTURE(
    lec_no       NUMBER(6),    --강의번호
    prof_no      VARCHAR2(10),    --교번
    lec_name     VARCHAR2(350), --강의명
    lec_room_no  VARCHAR2(6), --강의실명
    lec_day_dt   VARCHAR2(10),          --강의요일
    lec_dt       NUMBER(3),          --강의시간
    lec_point    NUMBER(1),     --학점
    lec_cy_fl    NUMBER(1),    --온라인 여부
    max_person   NUMBER(2),     --수강최대인원
    limit_cnt    NUMBER(2),     --수용최대인원(기본 50명)
    lec_startdate VARCHAR2(30)	--강의 시작일
    CONSTRAINT TBL_LECTURE_lecture_no_PK PRIMARY KEY(lec_no),
    CONSTRAINT FK_prof_no_LECTURE FOREIGN KEY (prof_no) REFERENCES TBL_PROF (prof_no) ON DELETE CASCADE
   
);


--수강신청 장바구니★
CREATE TABLE TBL_LECTURE_WISH(
    lec_wish_no NUMBER(6), --장바구니번호
    st_no      	VARCHAR2(10), --학번
    lec_no      NUMBER(6), --강의번호
    lec_wish_person	NUMBER(6)	--현재인원
    CONSTRAINT TBL_LEC_WISH_lec_wish_no_PK PRIMARY KEY(lec_wish_no),
    CONSTRAINT FK_st_no_LEC_WISH FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE,
    CONSTRAINT FK_lec_no_LEC_WISH FOREIGN KEY (lec_no) REFERENCES TBL_LECTURE (lec_no) ON DELETE CASCADE
);


--수강신청★
CREATE TABLE TBL_REG_LECTURE(
    reg_lec_no  NUMBER(6),  --수강신청번호
    lec_no      NUMBER(6),  --강의번호
    st_no       VARCHAR2(10), --학번
    lec_now_person	NUMBER(6),	--현재인원
    CONSTRAINT TBL_REG_LECTURE_reg_lec_no_PK PRIMARY KEY(reg_lec_no),
    CONSTRAINT FK_lec_no_REG_LEC FOREIGN KEY (lec_no) REFERENCES TBL_LECTURE (lec_no) ON DELETE CASCADE,
    CONSTRAINT FK_st_no_REG_LEC FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE
);


--출석★
CREATE TABLE TBL_ATTENDANCE(
    attend_no NUMBER(5), --출석번호
    st_no     VARCHAR2(10), --학번
    lec_no    NUMBER(6), --강의번호
    attend_fl NUMBER(1),  --출결여부
    lec_dt    VARCHAR2(30),       --강의날짜
    CONSTRAINT TBL_ATTENDANCE_attend_no_PK PRIMARY KEY(attend_no),
    CONSTRAINT FK_st_no_ATTEND FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE,
    CONSTRAINT FK_lec_no_ATTEND FOREIGN KEY (lec_no) REFERENCES TBL_LECTURE (lec_no) ON DELETE CASCADE
);


--성적★
CREATE TABLE TBL_GPA(
    st_no        VARCHAR2(10), --학번
    lec_no       NUMBER(6), --강의번호
    gpa_semester VARCHAR2(20), --학기
    gpa          NUMBER(4,1), --평점
    CONSTRAINT FK_st_no_GPA FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE,
    CONSTRAINT FK_lec_no_GPA FOREIGN KEY (lec_no) REFERENCES TBL_LECTURE (lec_no) ON DELETE CASCADE
);


--성적 총 평균
CREATE TABLE TBL_GPA_TOTAL(
	st_no	VARCHAR2(10),
	gpa_semester	VARCHAR2(20),
	gpa_total	NUMBER(4,2),
	CONSTRAINT FK_st_no_GPA_TOTAL FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE
);


--온라인 강의 출석 ★
CREATE TABLE TBL_CY_ATTENDANCE(
    lec_no      NUMBER(6),   --강의번호
	round_no	NUMBER(2),		--회차번호
	st_no		VARCHAR2(10),	--학번
	watch_time	NUMBER(20),	--시청시간
	watch_dt	DATE,	--시청일
    CONSTRAINT FK_lec_no_CY_ATTENDANCE FOREIGN KEY (lec_no) REFERENCES TBL_LECTURE (lec_no) ON DELETE CASCADE,
    CONSTRAINT FK_st_no_CY_ATTENDANCE FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE
);


--온라인 강의★
CREATE TABLE TBL_CY_LECTURE(
    lec_no	NUMBER(6),	--강의번호
    round_no	NUMBER(2),	--회차번호
    round_name	VARCHAR2(350),	--회차별 강의명
    file_names	VARCHAR2(500),	--파일명
    file_len	VARCHAR2(500),	--파일 길이   
    CONSTRAINT FK_lec_no_CY_LECTURE FOREIGN KEY (lec_no) REFERENCES TBL_LECTURE (lec_no) ON DELETE CASCADE
);


--온라인 강의 공지 ★
CREATE TABLE TBL_CYBER_LEC_NOTICE(
    cy_lec_n_no      NUMBER(5),    --글번호
    lec_no		NUMBER(6),	--강의번호
    prof_no        VARCHAR2(10),    --교수 사번
    cy_lec_n_title   VARCHAR2(300), --제목
    cy_lec_n_content VARCHAR2(1000), --내용
    cy_lec_n_dt      DATE,          --작성일
    cy_lec_n_file    VARCHAR2(500), --첨부파일
    cy_lec_n_cnt     NUMBER(5),    --조회수
    CONSTRAINT TBL_CYBER_LEC_NOTICE_cy_lec_n_no_PK PRIMARY KEY(cy_lec_n_no) ON DELETE CASCADE
);


--온라인 공지 ★
CREATE TABLE TBL_CYBER_NOTICE(
    cy_n_no      NUMBER(5),    --글번호
    ad_no        VARCHAR2(10),    --관리자번호
    cy_n_title   VARCHAR2(300), --제목
    cy_n_content VARCHAR2(1000), --내용
    cy_n_dt      DATE,          --작성일
    cy_n_file    VARCHAR2(500), --첨부파일
    cy_n_cnt     NUMBER(5),    --조회수
    CONSTRAINT TBL_CYBER_NOTICE_cy_n_no_PK PRIMARY KEY(cy_n_no),
    CONSTRAINT FK_ad_no_CYBER_NOTICE FOREIGN KEY (ad_no) REFERENCES TBL_ADMIN (ad_no) ON DELETE CASCADE
);



--기숙사★
CREATE TABLE TBL_DORM(
    dorm_room   NUMBER(4), --호실
    dorm_max    NUMBER(3), --최대인원
    dorm_price  NUMBER(8), --비용
    CONSTRAINT TBL_DORM_dorm_room_PK PRIMARY KEY(dorm_room) ON DELETE CASCADE
);

--기숙사 학생★
CREATE TABLE TBL_DORM_STUDENT(
    st_no        NUMBER(10), --학번
    dorm_room     NUMBER(4), --호실
    dorm_st_dt DATE,       --기숙사시작날짜
    dorm_end_dt   DATE,       --기숙사 종료날짜
    CONSTRAINT TBL_DORM_STUDENT_st_no_PK PRIMARY KEY(st_no), 
    CONSTRAINT FK_dorm_room_DORM_STUDENT FOREIGN KEY (dorm_room) REFERENCES TBL_DORM (dorm_room) ON DELETE CASCADE
);

--기숙사 벌점★
CREATE TABLE TBL_PENALTY(
    st_no	VARCHAR2(10),	--학번
    dorm_penalty	NUMBER(3),	--벌점
    dorm_penalty_dt	DATE,	--벌점일
    dorm_reason	VARCHAR2(200),	--벌점사유
    CONSTRAINT FK_st_no_PENALTY FOREIGN KEY (st_no) REFERENCES TBL_STUDENT (st_no) ON DELETE CASCADE
);

--기숙사 공지★
CREATE TABLE TBL_DORM_NOTICE(
    dorm_n_no        NUMBER(5),     --글번호
    ad_no           VARCHAR2(10),     --관리자번호
    dorm_n_title     VARCHAR2(300),  --제목
    dorm_n_content   VARCHAR2(1000),  --내용
    dorm_n_dt        DATE,           --작성일
    dorm_n_file      VARCHAR2(500),  --첨부파일
    dorm_n_cnt       NUMBER(10),     --조회수
    CONSTRAINT TBL_DORM_NOTICE_dorm_n_no_PK PRIMARY KEY(dorm_n_no),
    CONSTRAINT FK_ad_no_DORM_NOTICE FOREIGN KEY (ad_no) REFERENCES TBL_ADMIN (ad_no)
);



--도서★
CREATE TABLE TBL_BOOK(
    b_no        VARCHAR2(50) PRIMARY KEY,     --도서번호 isbn번호 + 000
    b_isbn      NUMBER(15),
    b_global   NUMBER(1),     --도서 국가 코드
    b_category  NUMBER(2),     --장르 분류
    b_title      VARCHAR2(500),  --도서명
    b_price     NUMBER(20),     --가격
    b_author      VARCHAR2(150),  --저자
    b_publish       VARCHAR2(300),  --출판사
    b_date      VARCHAR2(100),  --발행일    
    b_intoDate  DATE,               --도서 반입일    
    b_state_fl  NUMBER(3) default 1 -- 1 : 대여가능, 2: 대여불가
);


-- 도서 대여 시퀀스
CREATE SEQUENCE loan_no_seq 
    START WITH 0001
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE;
    
--도서 대여★
CREATE TABLE TBL_BOOK_LOAN(
    loan_no     NUMBER(10), --대출번호
    b_no        VARCHAR2(50), --도서번호
    user_no       NUMBER(10), --학번
    loan_dt     DATE,       --대출일
    return_sche   VARCHAR2(100),       --반납 예정일
    overdue     NUMBER(5) default 0,  --연체일
    return_dt   DATE,       --반납일
    loan_state     NUMBER(2) default 2,  -- 대여상태 (1:대여중, 12:정상반납)
    CONSTRAINT TBL_BOOK_LOAN_loan_no_PK PRIMARY KEY(loan_no),
    CONSTRAINT FK_b_no_BOOK_LOAN FOREIGN KEY (b_no) REFERENCES TBL_BOOK (b_no) ON DELETE CASCADE   
);

--도서관 열람실★
CREATE TABLE TBL_LIB_RDROOM(
    rdRoom_no    VARCHAR2(50) PRIMARY KEY,
    rdRoom_floor     VARCHAR2(10)
);

--도서관 열람실 좌석★
CREATE TABLE TBL_LIB_SEAT(
    rdRoom_no    VARCHAR2(50),    --reading room 번호
    seat_no     NUMBER(5), --좌석번호
    user_no           VARCHAR2(10), --학번
    seat_st_dt DATE,       --시작시각
    seat_end_dt DATE,       --종료시각
    seat_usetime    VARCHAR2(100), --예약시간  
    seat_state  NUMBER(1),  --좌석예약상태 (0:빈좌석/사용가능 , 1:이용중, 2:이용불가)
    CONSTRAINT TBL_LIB_SEAT_rdRoom_no_FK FOREIGN KEY (rdRoom_no) REFERENCES TBL_LIB_RDROOM (rdRoom_no)  
);


--도서관 좌석등록 프로시저
begin
    DBMS_SCHEDULER.CREATE_JOB (
         job_name             => 'seat_reset',
         job_type             => 'PLSQL_BLOCK',
         job_action           => 'begin update tbl_lib_seat set user_no=null,seat_st_dt=null,seat_end_dt=null,seat_usetime=null,seat_state=0 where seat_end_dt <= sysdate ;commit;end;',                         
         repeat_interval      => 'FREQ=MINUTELY;INTERVAL=1;',   -- 작동 주기로 1분마다 실행
         enabled              => TRUE
    );
end;
/
commit;




--관리자    0 | 입사년도 | 과번호 | 해당 입사동기 이름순서 'ㄱ-ㅎ'
INSERT INTO tbl_admin(ad_no,ad_pwd,ad_name,username) VALUES ('018104001','018104001','0박희현');
INSERT INTO tbl_admin(ad_no,ad_pwd,ad_name,username) VALUES ('018202001','018202001','0김동해');
INSERT INTO tbl_admin(ad_no,ad_pwd,ad_name,username) VALUES ('018304001','018304001','0이아름');
INSERT INTO tbl_admin(ad_no,ad_pwd,ad_name,username) VALUES ('018401001','018401001','0이승희');
INSERT INTO tbl_admin(ad_no,ad_pwd,ad_name,username) VALUES ('018505001','018505001','0최유민');
INSERT INTO tbl_admin(ad_no,ad_pwd,ad_name,username) VALUES ('018601001','018601001','0김광민');


--학생
INSERT INTO tbl_student(st_no,maj_cd, st_pwd,st_name)VALUES('218104001',104,'218104001','2박희현');
INSERT INTO tbl_student(st_no,maj_cd, st_pwd,st_name)VALUES('218202001',202,'218202001','2김동해');
INSERT INTO tbl_student(st_no,maj_cd, st_pwd,st_name)VALUES('218304001',304,'218304001','2이아름');
INSERT INTO tbl_student(st_no,maj_cd, st_pwd,st_name)VALUES('218401001',401,'218401001','2이승희');
INSERT INTO tbl_student(st_no,maj_cd, st_pwd,st_name)VALUES('218505001',505,'218505001','2최유민');
INSERT INTO tbl_student(st_no,maj_cd, st_pwd,st_name)VALUES('218601001',601,'218601001','2김광민');

--교수
INSERT INTO tbl_prof(prof_no,maj_cd,prof_pwd,prof_name) VALUES('118104001',104,'118104001','1박희현');
INSERT INTO tbl_prof(prof_no,maj_cd,prof_pwd,prof_name) VALUES('118202001',202,'118202001','1김동해');
INSERT INTO tbl_prof(prof_no,maj_cd,prof_pwd,prof_name) VALUES('118304001',304,'118304001','1이아름');
INSERT INTO tbl_prof(prof_no,maj_cd,prof_pwd,prof_name) VALUES('118401001',401,'118401001','1이승희');
INSERT INTO tbl_prof(prof_no,maj_cd,prof_pwd,prof_name) VALUES('118505001',505,'118505001','1최유민');
INSERT INTO tbl_prof(prof_no,maj_cd,prof_pwd,prof_name) VALUES('118601001',601,'118601001','1김광민');


--전공
INSERT INTO tbl_major(maj_cd,prof_no,maj_office_no,maj_cnt,maj_tuition,maj_info)
    VALUES (104,'118104001',021041104,50,4320000,'전기공학과입니다');

INSERT INTO tbl_major(maj_cd,prof_no,maj_office_no,maj_cnt,maj_tuition,maj_info)
    VALUES (202,'118202001',022022202,50,4468000,'미생물학과입니다');
    
INSERT INTO tbl_major(maj_cd,prof_no,maj_office_no,maj_cnt,maj_tuition,maj_info)
    VALUES (304,'118304001',023043304,50,3997120,'정치외교학과입니다');
    
INSERT INTO tbl_major(maj_cd,prof_no,maj_office_no,maj_cnt,maj_tuition,maj_info)
    VALUES (401,'118401001',024014401,50,4358500,'도예과입니다');
    
INSERT INTO tbl_major(maj_cd,prof_no,maj_office_no,maj_cnt,maj_tuition,maj_info)
    VALUES (505,'118505001',025055505,50,3978000,'포르투갈어과입니다');
    
INSERT INTO tbl_major(maj_cd,prof_no,maj_office_no,maj_cnt,maj_tuition,maj_info)
    VALUES (601,'118601001',026016601,50,4452600,'국제스포츠학과입니다');



