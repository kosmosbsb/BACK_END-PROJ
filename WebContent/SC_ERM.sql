
/* Drop Tables */

DROP TABLE ADMIN_ANSWER CASCADE CONSTRAINTS;
DROP TABLE HELP CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE RESERVE_CANCEL CASCADE CONSTRAINTS;
DROP TABLE RESERVE_DETAIL_EXTRAINFO CASCADE CONSTRAINTS;
DROP TABLE RESERVE_OPTION_REGI CASCADE CONSTRAINTS;
DROP TABLE USER_CREDIT CASCADE CONSTRAINTS;
DROP TABLE USER_NORMAL_PAY CASCADE CONSTRAINTS;
DROP TABLE RESERVE CASCADE CONSTRAINTS;
DROP TABLE SC_ADMIN CASCADE CONSTRAINTS;
DROP TABLE SEARCH_KEYWORD CASCADE CONSTRAINTS;
DROP TABLE SPACE_BIZMAN CASCADE CONSTRAINTS;
DROP TABLE SPACE_DETAIL_HOUR_PRICE CASCADE CONSTRAINTS;
DROP TABLE SPACE_DETAIL_IMG CASCADE CONSTRAINTS;
DROP TABLE SPACE_DETAIL_SISEOL CASCADE CONSTRAINTS;
DROP TABLE SPACE_OPTION_REGI CASCADE CONSTRAINTS;
DROP TABLE SPACE_DETAIL CASCADE CONSTRAINTS;
DROP TABLE SPACE_IMG CASCADE CONSTRAINTS;
DROP TABLE SPACE_MOIM_EXTRAINFO CASCADE CONSTRAINTS;
DROP TABLE SPACE_MOIM_WEBSITE CASCADE CONSTRAINTS;
DROP TABLE SPACE_MOIM CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE_EXTRAINFO CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE_PRICE_DAY CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE_PRICE_DAY_POL CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE_PRICE_MONTH CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE_PRICE_MONTH_POL CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE_SISEOL CASCADE CONSTRAINTS;
DROP TABLE SPACE_OFFICE CASCADE CONSTRAINTS;
DROP TABLE SPACE_OPTION CASCADE CONSTRAINTS;
DROP TABLE SPACE_QNA_ANSWER CASCADE CONSTRAINTS;
DROP TABLE SPACE_QNA CASCADE CONSTRAINTS;
DROP TABLE SPACE_REFUND CASCADE CONSTRAINTS;
DROP TABLE SPACE_REVIEW_ANSWER CASCADE CONSTRAINTS;
DROP TABLE SPACE_REVIEW_IMG CASCADE CONSTRAINTS;
DROP TABLE SPACE_REVIEW CASCADE CONSTRAINTS;
DROP TABLE SPACE_STORY CASCADE CONSTRAINTS;
DROP TABLE SPACE CASCADE CONSTRAINTS;
DROP TABLE USER_HOST_IMG CASCADE CONSTRAINTS;
DROP TABLE USER_HOST CASCADE CONSTRAINTS;
DROP TABLE USER_QUESTION CASCADE CONSTRAINTS;
DROP TABLE USER_NORMAL CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ADMIN_ANSWER
(
	-- 문의 일련변호와 동일함
	NO number NOT NULL,
	ANSWER_DATE date DEFAULT SYSDATE,
	CONTENT nvarchar2(300),
	ID varchar2(15 char),
	PRIMARY KEY (NO)
);


CREATE TABLE HELP
(
	NOTICE_NO number NOT NULL,
	TITLE nvarchar2(100),
	-- 웹에디터로 이미지경로, 링크버튼 등 추가
	CONTENT nvarchar2(500),
	REGIDATE date,
	-- 일반(N), 호스트(H)
	NORMAL_OR_HOST char(1 char),
	CATEGORY nvarchar2(10),
	ID varchar2(15 char) NOT NULL,
	PRIMARY KEY (NOTICE_NO)
);


CREATE TABLE NOTICE
(
	NOTICE_NO number NOT NULL,
	TITLE nvarchar2(100),
	-- 웹에디터로 이미지경로, 링크버튼 등 추가
	CONTENT nvarchar2(500),
	REGIDATE date,
	-- 일반(N), 호스트(H)
	NORMAL_OR_HOST char(1 char),
	CATEGORY nvarchar2(10),
	ID varchar2(15 char) NOT NULL,
	PRIMARY KEY (NOTICE_NO)
);


CREATE TABLE RESERVE
(
	RESERVE_NO number NOT NULL,
	RESERVE_NAME nvarchar2(10),
	RESERVE_PHONE nvarchar2(11),
	RESERVE_EMAIL nvarchar2(30),
	-- 예약확정, 승인대기, 결제대기, 추가예약(예약변경?), 이용완료, 취소환불
	STATUS nvarchar2(30),
	-- 최소1일, 최대30일(13자*최대30일 + 구분자* 최대29개)
	RESERVE_DATE nvarchar2(420),
	RESERVE_PERSON number,
	REGIDATE date DEFAULT SYSDATE,
	ASK nvarchar2(300),
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	-- 일반회원 아이디와 동일
	ID varchar2(15 char) NOT NULL,
	PRIMARY KEY (RESERVE_NO)
);


CREATE TABLE RESERVE_CANCEL
(
	-- 예약 일련번호와 동일
	RESERVE_NO number NOT NULL,
	CANCEL_PRICE number,
	CANCEL_COMMENT nvarchar2(100),
	PRIMARY KEY (RESERVE_NO)
);


CREATE TABLE RESERVE_DETAIL_EXTRAINFO
(
	-- 예약 일련번호와 동일
	RESERVE_NO number NOT NULL,
	DISCOUNT number,
	-- 00~24
	RESERVE_HOUR varchar2(5 char),
	PRIMARY KEY (RESERVE_NO)
);


CREATE TABLE RESERVE_OPTION_REGI
(
	RESERVE_OPTION_REGI_NO number NOT NULL,
	OPTION_COUNT number,
	-- 옵션 일련번호와 동일
	OPTION_NO number NOT NULL,
	-- 예약 일련번호와 동일
	RESERVE_NO number NOT NULL,
	PRIMARY KEY (RESERVE_OPTION_REGI_NO)
);


CREATE TABLE SC_ADMIN
(
	ID varchar2(15 char) NOT NULL,
	-- 암호화값
	PWD varchar2(200 char) NOT NULL,
	ADMIN_NAME nvarchar2(10) NOT NULL,
	-- 마스터관리자(M), CS관리자(C), 통계관리자(A)
	ADMIN_LEVEL char(1 char) NOT NULL,
	REGIDATE date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE SEARCH_KEYWORD
(
	-- 10자 이상 검색어는 미포함
	KEYWORD nvarchar2(10) NOT NULL,
	COUNT number,
	PRIMARY KEY (KEYWORD)
);


CREATE TABLE SPACE
(
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	SPACE_NAME nvarchar2(18),
	HEART number,
	-- 모임공간(사업자)(S1), 모임공간(비사업자)(S2), 공유오피스(O)
	SPACE_TYPE varchar2(2 char),
	INTRO_MAIN nvarchar2(27),
	INTRO_DETAIL nvarchar2(500),
	ADDRESS nvarchar2(150),
	-- 최대 5개 단어 나열
	SPACE_TAG nvarchar2(50),
	IMG_MAIN varchar2(100 char),
	MAIL varchar2(30 char),
	-- 최대 2개 ex. 010-0000-0000/010-0000-0000
	PHONE varchar2(23),
	-- 가상번호와 매치시켜서 SMS발송
	TOP_PHONE varchar2(11 char),
	-- 일반회원 노출용
	VIRTUAL_PHONE varchar2(12 char),
	-- 호스트 아이디와 동일
	ID varchar2(15 char) NOT NULL,
	PRIMARY KEY (SPACE_NO)
);


CREATE TABLE SPACE_BIZMAN
(
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	BIZ_NAME nvarchar2(17),
	TOP_NAME nvarchar2(10),
	BIZ_NUMBER varchar2(12 char),
	BIZ_IMG nvarchar2(100),
	BIZ_ADDRESS nvarchar2(150),
	BIZ_EMAIL varchar2(50 char),
	BIZ_PHONE varchar2(11 char),
	-- ex. 은행명]계좌번호]예금주
	-- 
	ACCOUNT nvarchar2(50),
	PRIMARY KEY (SPACE_NO)
);


CREATE TABLE SPACE_DETAIL
(
	-- 세부공간 일련번호와 동일
	SPACE_DETAIL_NO number NOT NULL,
	SPACE_DETAIL_NAME nvarchar2(17),
	SPACE_DETAIL_INTRO nvarchar2(400),
	-- 공간유형에서 선택된 항목 중 최대 3개 선택가능
	SPACE_DETAIL_TYPE nvarchar2(30),
	SPACE_DETAIL_IMG varchar2(100 char),
	MIN_DAY number,
	MIN_PERSON number,
	MAX_PERSON number,
	-- 공간당가격(S) OR 1인당가격(P)
	PRICE_STANDARD char(1 char),
	PRICE_WEEKDAY number,
	PRICE_WEEKEND number,
	-- 공간 일련번호와 동일
	SPACE_NO number NOT NULL,
	PRIMARY KEY (SPACE_DETAIL_NO)
);


CREATE TABLE SPACE_DETAIL_HOUR_PRICE
(
	-- 세부공간 일련번호와 동일
	SPACE_DETAIL_NO number NOT NULL,
	PRICE_ALL_WEEKDAY number,
	PRICE_ALL_WEEKEND number,
	PRIMARY KEY (SPACE_DETAIL_NO)
);


CREATE TABLE SPACE_DETAIL_IMG
(
	IMG_NO number NOT NULL,
	IMG varchar2(100 char),
	-- 세부공간 일련번호와 동일
	SPACE_DETAIL_NO number NOT NULL,
	PRIMARY KEY (IMG_NO)
);


CREATE TABLE SPACE_DETAIL_SISEOL
(
	SISEOL_NO number NOT NULL,
	SISEOL_NAME nvarchar2(10),
	-- 세부공간 일련번호와 동일
	SPACE_DETAIL_NO number NOT NULL,
	PRIMARY KEY (SISEOL_NO)
);


CREATE TABLE SPACE_IMG
(
	IMG_NO number NOT NULL,
	IMG varchar2(100 char),
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	PRIMARY KEY (IMG_NO)
);


CREATE TABLE SPACE_MOIM
(
	-- 공간 일련번호와 동일
	SPACE_MOIM_NO number NOT NULL,
	-- 시간단위(T), 일단위(D)
	TIME_OR_DAY char(1 char),
	-- 00:00~24:00
	-- 
	OPER_TIME varchar2(11),
	REGULARLY_CLOSE nvarchar2(50),
	PRIMARY KEY (SPACE_MOIM_NO)
);


CREATE TABLE SPACE_MOIM_EXTRAINFO
(
	EXTRAINFO_NO number NOT NULL,
	-- 시설안내(S), 예약시 주의사항(R)
	-- 
	INFO_TYPE char(1 char),
	INFO_CONTENT nvarchar2(100),
	-- 모임공간 일련번호와 동일
	SPACE_MOIM_NO number NOT NULL,
	PRIMARY KEY (EXTRAINFO_NO)
);


CREATE TABLE SPACE_MOIM_WEBSITE
(
	-- 모임공간 일련번호와 동일
	SPACE_MOIM_NO number NOT NULL,
	-- 긴 URL은 구글쇼트너 활용 유도, URL 표현식 적용
	WEBSITE nvarchar2(200),
	PRIMARY KEY (SPACE_MOIM_NO)
);


CREATE TABLE SPACE_OFFICE
(
	-- 공간 일련번호와 동일
	SPACE_OFFICE_NO number NOT NULL,
	-- 제곱미터 OR 고정석(FIXED) OR 자유석(FREE)
	SPACE_TYPE varchar2(10),
	AVAIL_COUNT number,
	MIN_PERSON number,
	MAX_PERSON number,
	-- 일단위(D), 월단위(M), 둘다(A)
	-- 
	DAY_OR_MONTH char(1 char),
	-- ex. 월]휴무]화]09:00~22:00 … 금]00:00~24:00
	-- 
	OPER_TIME nvarchar2(100),
	PRIMARY KEY (SPACE_OFFICE_NO)
);


CREATE TABLE SPACE_OFFICE_EXTRAINFO
(
	EXTRAINFO_NO number NOT NULL,
	-- 운영/휴무관련 추가 안내
	INFO_CONTENT nvarchar2(100),
	-- 공유오피스 일련번호와 동일
	SPACE_OFFICE_NO number NOT NULL,
	PRIMARY KEY (EXTRAINFO_NO)
);


CREATE TABLE SPACE_OFFICE_PRICE_DAY
(
	-- 공유오피스 일련번호와 동일
	-- 
	SPACE_OFFICE_NO number NOT NULL,
	PRICE number,
	MIN_DAY number,
	MAX_DAY number,
	PRIMARY KEY (SPACE_OFFICE_NO)
);


CREATE TABLE SPACE_OFFICE_PRICE_DAY_POL
(
	-- 공유오피스 일련번호와 동일
	SPACE_OFFICE_NO number NOT NULL,
	POLICY nvarchar2(300),
	PRIMARY KEY (SPACE_OFFICE_NO)
);


CREATE TABLE SPACE_OFFICE_PRICE_MONTH
(
	-- 공유오피스 일련번호와 동일
	-- 
	SPACE_OFFICE_NO number NOT NULL,
	PRICE number,
	PRIMARY KEY (SPACE_OFFICE_NO)
);


CREATE TABLE SPACE_OFFICE_PRICE_MONTH_POL
(
	-- 공유오피스 일련번호와 동일
	SPACE_OFFICE_NO number NOT NULL,
	POLICY nvarchar2(300),
	PRIMARY KEY (SPACE_OFFICE_NO)
);


CREATE TABLE SPACE_OFFICE_SISEOL
(
	SISEOL_NO number NOT NULL,
	SISEOL_NAME nvarchar2(15),
	SISEOL_INTRO nvarchar2(100),
	-- 유료(P), 무료(F)
	PAY_OR_FREE char(1),
	-- 공유오피스 일련번호와 동일
	-- 
	SPACE_OFFICE_NO number NOT NULL,
	PRIMARY KEY (SISEOL_NO)
);


CREATE TABLE SPACE_OPTION
(
	OPTION_NO number NOT NULL,
	OPTION_NAME nvarchar2(10),
	OPTION_COUNT number,
	OPTION_INTRO nvarchar2(30),
	-- 시간당가격(H) OR 기본가격(N)
	PRICE_TYPE char(1 char),
	OPTION_PRICE number,
	-- 등록 안하면 기본이미지경로
	OPTION_IMG varchar2(100 char),
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	PRIMARY KEY (OPTION_NO)
);


CREATE TABLE SPACE_OPTION_REGI
(
	OPTION_REGI_NO number NOT NULL,
	-- 옵션 일련번호와 동일
	OPTION_NO number NOT NULL,
	-- 세부공간 일련번호와 동일
	SPACE_DETAIL_NO number NOT NULL,
	PRIMARY KEY (OPTION_REGI_NO)
);


CREATE TABLE SPACE_QNA
(
	QNA_NO number NOT NULL,
	REVIEWER nvarchar2(10),
	CONTENT nvarchar2(400),
	QNA_DATE date,
	-- 공간 일련번호와 동일
	SPACE_NO number NOT NULL,
	PRIMARY KEY (QNA_NO)
);


CREATE TABLE SPACE_QNA_ANSWER
(
	-- QNA 일련번호와 동일
	QNA_ANSWER_NO number NOT NULL,
	CONTENT nvarchar2(400),
	PRIMARY KEY (QNA_ANSWER_NO)
);


CREATE TABLE SPACE_REFUND
(
	-- 공간 일련번호와 동일
	SPACE_NO number NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY8 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY7 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY6 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY5 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY4 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY3 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY2 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY1 number(2,1) NOT NULL,
	-- 0.0~1.0 (0.1단위)
	LEFTDAY0 number(2,1) NOT NULL,
	PRIMARY KEY (SPACE_NO)
);


CREATE TABLE SPACE_REVIEW
(
	REVIEW_NO number NOT NULL,
	REVIEWER nvarchar2(10),
	CONTENT nvarchar2(400),
	-- 0~5
	SCORE number,
	REVIEW_DATE date DEFAULT SYSDATE,
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	PRIMARY KEY (REVIEW_NO)
);


CREATE TABLE SPACE_REVIEW_ANSWER
(
	-- 리뷰 일련번호와 동일
	REVIEW_NO number NOT NULL,
	CONTENT nvarchar2(400),
	PRIMARY KEY (REVIEW_NO)
);


CREATE TABLE SPACE_REVIEW_IMG
(
	IMG_NO number NOT NULL,
	IMG nvarchar2(100),
	-- 리뷰 일련번호와 동일
	REVIEW_NO number NOT NULL,
	PRIMARY KEY (IMG_NO)
);


CREATE TABLE SPACE_STORY
(
	STORY_NO number NOT NULL,
	SITE_URL varchar2(100 char),
	-- 공간 일련번호와 동일
	-- 
	SPACE_NO number NOT NULL,
	PRIMARY KEY (STORY_NO)
);


CREATE TABLE USER_CREDIT
(
	CREDIT_NO number NOT NULL,
	-- 획득(G), 사용(U)
	CREDIT_TYPE char(1 char),
	REGIDATE date DEFAULT SYSDATE,
	CONTENT nvarchar2(100),
	PRICE number,
	-- 일반회원 아이디와 동일
	ID varchar2(15 char) NOT NULL,
	-- 예약 고유번호와 동일
	RESERVE_NO number NOT NULL,
	PRIMARY KEY (CREDIT_NO)
);


CREATE TABLE USER_HOST
(
	-- 네아로에서 얻어옴
	ID varchar2(15 char) NOT NULL,
	H_NICKNAME nvarchar2(15),
	INTRODUCE nvarchar2(30),
	-- 동의(Y), 비동의(N)
	H_ALARM_SMS char(1 char) NOT NULL,
	-- 동의(Y), 비동의(N)
	H_ALARM_MAIL char(1 char) NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE USER_HOST_IMG
(
	-- 호스트 회원 아이디와 동일
	ID varchar2(15 char) NOT NULL,
	IMG varchar2(100 char),
	PRIMARY KEY (ID)
);


CREATE TABLE USER_NORMAL
(
	-- 네아로에서 얻어옴
	ID varchar2(15 char) NOT NULL,
	-- 네아로에서 얻어옴
	-- (미설정인 경우, 네아로에서 기본 이미지 경로를 얻어옴)
	IMG varchar2(160 char),
	-- 네아로에서 얻어옴
	N_NICKNAME nvarchar2(15),
	-- 네아로에서 얻어옴
	NAME nvarchar2(10),
	-- 네아로에서 얻어옴
	MAIL varchar2(30 char),
	-- 남자(M), 여자(F)
	GENDER char(1 char),
	-- 네아로에서 얻어옴   ex. 20-29
	AGE varchar2(5 char),
	PHONE varchar2(11 char),
	-- 동의(Y), 비동의(N)
	N_ALARM_SMS char(1 char) NOT NULL,
	-- 동의(Y), 비동의(N)
	N_ALARM_MAIL char(1 char) NOT NULL,
	CREDIT number,
	GRADE nvarchar2(10),
	PRIMARY KEY (ID)
);


CREATE TABLE USER_NORMAL_PAY
(
	PAY_NO number NOT NULL,
	-- 호스트 승인(H), 계좌이체(A), 신용카드(C)
	WAY char(1 char),
	PRICE number,
	-- 예약 고유번호와 동일
	RESERVE_NO number NOT NULL,
	PRIMARY KEY (PAY_NO)
);


CREATE TABLE USER_QUESTION
(
	NO number NOT NULL,
	QUESTION_TYPE nvarchar2(5),
	QUESTION_TITLE nvarchar2(20),
	QUESTION_CONTENT nvarchar2(300),
	REGIDATE date DEFAULT SYSDATE,
	PASSDATE date,
	-- 네아로에서 얻어옴
	ID varchar2(15 char) NOT NULL,
	PRIMARY KEY (NO)
);



/* Create Foreign Keys */

ALTER TABLE RESERVE_CANCEL
	ADD FOREIGN KEY (RESERVE_NO)
	REFERENCES RESERVE (RESERVE_NO)
;


ALTER TABLE RESERVE_DETAIL_EXTRAINFO
	ADD FOREIGN KEY (RESERVE_NO)
	REFERENCES RESERVE (RESERVE_NO)
;


ALTER TABLE RESERVE_OPTION_REGI
	ADD FOREIGN KEY (RESERVE_NO)
	REFERENCES RESERVE (RESERVE_NO)
;


ALTER TABLE USER_CREDIT
	ADD FOREIGN KEY (RESERVE_NO)
	REFERENCES RESERVE (RESERVE_NO)
;


ALTER TABLE USER_NORMAL_PAY
	ADD FOREIGN KEY (RESERVE_NO)
	REFERENCES RESERVE (RESERVE_NO)
;


ALTER TABLE ADMIN_ANSWER
	ADD FOREIGN KEY (ID)
	REFERENCES SC_ADMIN (ID)
;


ALTER TABLE HELP
	ADD FOREIGN KEY (ID)
	REFERENCES SC_ADMIN (ID)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (ID)
	REFERENCES SC_ADMIN (ID)
;


ALTER TABLE RESERVE
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_BIZMAN
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_DETAIL
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_IMG
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_MOIM
	ADD FOREIGN KEY (SPACE_MOIM_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_OFFICE
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_OPTION
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_QNA
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_REFUND
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_REVIEW
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_STORY
	ADD FOREIGN KEY (SPACE_NO)
	REFERENCES SPACE (SPACE_NO)
;


ALTER TABLE SPACE_DETAIL_HOUR_PRICE
	ADD FOREIGN KEY (SPACE_DETAIL_NO)
	REFERENCES SPACE_DETAIL (SPACE_DETAIL_NO)
;


ALTER TABLE SPACE_DETAIL_IMG
	ADD FOREIGN KEY (SPACE_DETAIL_NO)
	REFERENCES SPACE_DETAIL (SPACE_DETAIL_NO)
;


ALTER TABLE SPACE_DETAIL_SISEOL
	ADD FOREIGN KEY (SPACE_DETAIL_NO)
	REFERENCES SPACE_DETAIL (SPACE_DETAIL_NO)
;


ALTER TABLE SPACE_OPTION_REGI
	ADD FOREIGN KEY (SPACE_DETAIL_NO)
	REFERENCES SPACE_DETAIL (SPACE_DETAIL_NO)
;


ALTER TABLE SPACE_MOIM_EXTRAINFO
	ADD FOREIGN KEY (SPACE_MOIM_NO)
	REFERENCES SPACE_MOIM (SPACE_MOIM_NO)
;


ALTER TABLE SPACE_MOIM_WEBSITE
	ADD FOREIGN KEY (SPACE_MOIM_NO)
	REFERENCES SPACE_MOIM (SPACE_MOIM_NO)
;


ALTER TABLE SPACE_OFFICE_EXTRAINFO
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE_OFFICE (SPACE_OFFICE_NO)
;


ALTER TABLE SPACE_OFFICE_PRICE_DAY
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE_OFFICE (SPACE_OFFICE_NO)
;


ALTER TABLE SPACE_OFFICE_PRICE_DAY_POL
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE_OFFICE (SPACE_OFFICE_NO)
;


ALTER TABLE SPACE_OFFICE_PRICE_MONTH
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE_OFFICE (SPACE_OFFICE_NO)
;


ALTER TABLE SPACE_OFFICE_PRICE_MONTH_POL
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE_OFFICE (SPACE_OFFICE_NO)
;


ALTER TABLE SPACE_OFFICE_SISEOL
	ADD FOREIGN KEY (SPACE_OFFICE_NO)
	REFERENCES SPACE_OFFICE (SPACE_OFFICE_NO)
;


ALTER TABLE RESERVE_OPTION_REGI
	ADD FOREIGN KEY (OPTION_NO)
	REFERENCES SPACE_OPTION (OPTION_NO)
;


ALTER TABLE SPACE_OPTION_REGI
	ADD FOREIGN KEY (OPTION_NO)
	REFERENCES SPACE_OPTION (OPTION_NO)
;


ALTER TABLE SPACE_QNA_ANSWER
	ADD FOREIGN KEY (QNA_ANSWER_NO)
	REFERENCES SPACE_QNA (QNA_NO)
;


ALTER TABLE SPACE_REVIEW_ANSWER
	ADD FOREIGN KEY (REVIEW_NO)
	REFERENCES SPACE_REVIEW (REVIEW_NO)
;


ALTER TABLE SPACE_REVIEW_IMG
	ADD FOREIGN KEY (REVIEW_NO)
	REFERENCES SPACE_REVIEW (REVIEW_NO)
;


ALTER TABLE SPACE
	ADD FOREIGN KEY (ID)
	REFERENCES USER_HOST (ID)
;


ALTER TABLE USER_HOST_IMG
	ADD FOREIGN KEY (ID)
	REFERENCES USER_HOST (ID)
;


ALTER TABLE RESERVE
	ADD FOREIGN KEY (ID)
	REFERENCES USER_NORMAL (ID)
;


ALTER TABLE USER_CREDIT
	ADD FOREIGN KEY (ID)
	REFERENCES USER_NORMAL (ID)
;


ALTER TABLE USER_HOST
	ADD FOREIGN KEY (ID)
	REFERENCES USER_NORMAL (ID)
;


ALTER TABLE USER_QUESTION
	ADD FOREIGN KEY (ID)
	REFERENCES USER_NORMAL (ID)
;


ALTER TABLE ADMIN_ANSWER
	ADD FOREIGN KEY (NO)
	REFERENCES USER_QUESTION (NO)
;



/* Comments */

COMMENT ON COLUMN ADMIN_ANSWER.NO IS '문의 일련변호와 동일함';
COMMENT ON COLUMN HELP.CONTENT IS '웹에디터로 이미지경로, 링크버튼 등 추가';
COMMENT ON COLUMN HELP.NORMAL_OR_HOST IS '일반(N), 호스트(H)';
COMMENT ON COLUMN NOTICE.CONTENT IS '웹에디터로 이미지경로, 링크버튼 등 추가';
COMMENT ON COLUMN NOTICE.NORMAL_OR_HOST IS '일반(N), 호스트(H)';
COMMENT ON COLUMN RESERVE.STATUS IS '예약확정, 승인대기, 결제대기, 추가예약(예약변경?), 이용완료, 취소환불';
COMMENT ON COLUMN RESERVE.RESERVE_DATE IS '최소1일, 최대30일(13자*최대30일 + 구분자* 최대29개)';
COMMENT ON COLUMN RESERVE.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN RESERVE.ID IS '일반회원 아이디와 동일';
COMMENT ON COLUMN RESERVE_CANCEL.RESERVE_NO IS '예약 일련번호와 동일';
COMMENT ON COLUMN RESERVE_DETAIL_EXTRAINFO.RESERVE_NO IS '예약 일련번호와 동일';
COMMENT ON COLUMN RESERVE_DETAIL_EXTRAINFO.RESERVE_HOUR IS '00~24';
COMMENT ON COLUMN RESERVE_OPTION_REGI.OPTION_NO IS '옵션 일련번호와 동일';
COMMENT ON COLUMN RESERVE_OPTION_REGI.RESERVE_NO IS '예약 일련번호와 동일';
COMMENT ON COLUMN SC_ADMIN.PWD IS '암호화값';
COMMENT ON COLUMN SC_ADMIN.ADMIN_LEVEL IS '마스터관리자(M), CS관리자(C), 통계관리자(A)';
COMMENT ON COLUMN SEARCH_KEYWORD.KEYWORD IS '10자 이상 검색어는 미포함';
COMMENT ON COLUMN SPACE.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN SPACE.SPACE_TYPE IS '모임공간(사업자)(S1), 모임공간(비사업자)(S2), 공유오피스(O)';
COMMENT ON COLUMN SPACE.SPACE_TAG IS '최대 5개 단어 나열';
COMMENT ON COLUMN SPACE.PHONE IS '최대 2개 ex. 010-0000-0000/010-0000-0000';
COMMENT ON COLUMN SPACE.TOP_PHONE IS '가상번호와 매치시켜서 SMS발송';
COMMENT ON COLUMN SPACE.VIRTUAL_PHONE IS '일반회원 노출용';
COMMENT ON COLUMN SPACE.ID IS '호스트 아이디와 동일';
COMMENT ON COLUMN SPACE_BIZMAN.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN SPACE_BIZMAN.ACCOUNT IS 'ex. 은행명]계좌번호]예금주
';
COMMENT ON COLUMN SPACE_DETAIL.SPACE_DETAIL_NO IS '세부공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_DETAIL.SPACE_DETAIL_TYPE IS '공간유형에서 선택된 항목 중 최대 3개 선택가능';
COMMENT ON COLUMN SPACE_DETAIL.PRICE_STANDARD IS '공간당가격(S) OR 1인당가격(P)';
COMMENT ON COLUMN SPACE_DETAIL.SPACE_NO IS '공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_DETAIL_HOUR_PRICE.SPACE_DETAIL_NO IS '세부공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_DETAIL_IMG.SPACE_DETAIL_NO IS '세부공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_DETAIL_SISEOL.SPACE_DETAIL_NO IS '세부공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_IMG.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN SPACE_MOIM.SPACE_MOIM_NO IS '공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_MOIM.TIME_OR_DAY IS '시간단위(T), 일단위(D)';
COMMENT ON COLUMN SPACE_MOIM.OPER_TIME IS '00:00~24:00
';
COMMENT ON COLUMN SPACE_MOIM_EXTRAINFO.INFO_TYPE IS '시설안내(S), 예약시 주의사항(R)
';
COMMENT ON COLUMN SPACE_MOIM_EXTRAINFO.SPACE_MOIM_NO IS '모임공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_MOIM_WEBSITE.SPACE_MOIM_NO IS '모임공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_MOIM_WEBSITE.WEBSITE IS '긴 URL은 구글쇼트너 활용 유도, URL 표현식 적용';
COMMENT ON COLUMN SPACE_OFFICE.SPACE_OFFICE_NO IS '공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_OFFICE.SPACE_TYPE IS '제곱미터 OR 고정석(FIXED) OR 자유석(FREE)';
COMMENT ON COLUMN SPACE_OFFICE.DAY_OR_MONTH IS '일단위(D), 월단위(M), 둘다(A)
';
COMMENT ON COLUMN SPACE_OFFICE.OPER_TIME IS 'ex. 월]휴무]화]09:00~22:00 … 금]00:00~24:00
';
COMMENT ON COLUMN SPACE_OFFICE_EXTRAINFO.INFO_CONTENT IS '운영/휴무관련 추가 안내';
COMMENT ON COLUMN SPACE_OFFICE_EXTRAINFO.SPACE_OFFICE_NO IS '공유오피스 일련번호와 동일';
COMMENT ON COLUMN SPACE_OFFICE_PRICE_DAY.SPACE_OFFICE_NO IS '공유오피스 일련번호와 동일
';
COMMENT ON COLUMN SPACE_OFFICE_PRICE_DAY_POL.SPACE_OFFICE_NO IS '공유오피스 일련번호와 동일';
COMMENT ON COLUMN SPACE_OFFICE_PRICE_MONTH.SPACE_OFFICE_NO IS '공유오피스 일련번호와 동일
';
COMMENT ON COLUMN SPACE_OFFICE_PRICE_MONTH_POL.SPACE_OFFICE_NO IS '공유오피스 일련번호와 동일';
COMMENT ON COLUMN SPACE_OFFICE_SISEOL.PAY_OR_FREE IS '유료(P), 무료(F)';
COMMENT ON COLUMN SPACE_OFFICE_SISEOL.SPACE_OFFICE_NO IS '공유오피스 일련번호와 동일
';
COMMENT ON COLUMN SPACE_OPTION.PRICE_TYPE IS '시간당가격(H) OR 기본가격(N)';
COMMENT ON COLUMN SPACE_OPTION.OPTION_IMG IS '등록 안하면 기본이미지경로';
COMMENT ON COLUMN SPACE_OPTION.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN SPACE_OPTION_REGI.OPTION_NO IS '옵션 일련번호와 동일';
COMMENT ON COLUMN SPACE_OPTION_REGI.SPACE_DETAIL_NO IS '세부공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_QNA.SPACE_NO IS '공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_QNA_ANSWER.QNA_ANSWER_NO IS 'QNA 일련번호와 동일';
COMMENT ON COLUMN SPACE_REFUND.SPACE_NO IS '공간 일련번호와 동일';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY8 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY7 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY6 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY5 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY4 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY3 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY2 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY1 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REFUND.LEFTDAY0 IS '0.0~1.0 (0.1단위)';
COMMENT ON COLUMN SPACE_REVIEW.SCORE IS '0~5';
COMMENT ON COLUMN SPACE_REVIEW.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN SPACE_REVIEW_ANSWER.REVIEW_NO IS '리뷰 일련번호와 동일';
COMMENT ON COLUMN SPACE_REVIEW_IMG.REVIEW_NO IS '리뷰 일련번호와 동일';
COMMENT ON COLUMN SPACE_STORY.SPACE_NO IS '공간 일련번호와 동일
';
COMMENT ON COLUMN USER_CREDIT.CREDIT_TYPE IS '획득(G), 사용(U)';
COMMENT ON COLUMN USER_CREDIT.ID IS '일반회원 아이디와 동일';
COMMENT ON COLUMN USER_CREDIT.RESERVE_NO IS '예약 고유번호와 동일';
COMMENT ON COLUMN USER_HOST.ID IS '네아로에서 얻어옴';
COMMENT ON COLUMN USER_HOST.H_ALARM_SMS IS '동의(Y), 비동의(N)';
COMMENT ON COLUMN USER_HOST.H_ALARM_MAIL IS '동의(Y), 비동의(N)';
COMMENT ON COLUMN USER_HOST_IMG.ID IS '호스트 회원 아이디와 동일';
COMMENT ON COLUMN USER_NORMAL.ID IS '네아로에서 얻어옴';
COMMENT ON COLUMN USER_NORMAL.IMG IS '네아로에서 얻어옴
(미설정인 경우, 네아로에서 기본 이미지 경로를 얻어옴)';
COMMENT ON COLUMN USER_NORMAL.N_NICKNAME IS '네아로에서 얻어옴';
COMMENT ON COLUMN USER_NORMAL.NAME IS '네아로에서 얻어옴';
COMMENT ON COLUMN USER_NORMAL.MAIL IS '네아로에서 얻어옴';
COMMENT ON COLUMN USER_NORMAL.GENDER IS '남자(M), 여자(F)';
COMMENT ON COLUMN USER_NORMAL.AGE IS '네아로에서 얻어옴   ex. 20-29';
COMMENT ON COLUMN USER_NORMAL.N_ALARM_SMS IS '동의(Y), 비동의(N)';
COMMENT ON COLUMN USER_NORMAL.N_ALARM_MAIL IS '동의(Y), 비동의(N)';
COMMENT ON COLUMN USER_NORMAL_PAY.WAY IS '호스트 승인(H), 계좌이체(A), 신용카드(C)';
COMMENT ON COLUMN USER_NORMAL_PAY.RESERVE_NO IS '예약 고유번호와 동일';
COMMENT ON COLUMN USER_QUESTION.ID IS '네아로에서 얻어옴';



