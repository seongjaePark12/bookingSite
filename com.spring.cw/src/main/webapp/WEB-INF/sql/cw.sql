show tables;
drop table CW_USER;
select * from CW_USER;
/* 회원 정보 */
CREATE TABLE CW_USER(
	CW_USER_NO INT NOT NULL AUTO_INCREMENT COMMENT '회원 번호', 
    CW_USER_MID VARCHAR(20) NOT NULL COMMENT '회원 아이디',
    CW_USER_PWD VARCHAR(100) NOT NULL COMMENT '회원 비밀번호',
	CW_USER_NAME VARCHAR(20) NOT NULL COMMENT '회원 이름',
    CW_USER_BIRTH VARCHAR(11) DEFAULT NULL COMMENT '생년월일',
    CW_USER_HOBBY VARCHAR(50) DEFAULT NULL COMMENT '단체/동호회',
    CW_USER_NUMBER CHAR(15) NOT NULL COMMENT '회원 전화번호',
    CW_USER_ADDRESS VARCHAR(50) DEFAULT NULL COMMENT '회원 주소',
    CW_USER_CHECK INT NOT NULL DEFAULT 1 COMMENT '본인인증 1:인증전 2: 인증후',
    CW_USER_VISITCNT INT DEFAULT 0 COMMENT '방문 횟수',
    CW_USER_JOINDAY DATETIME DEFAULT NOW() COMMENT '회원 가입일',
    CW_USER_LASTDATE DATETIME DEFAULT NOW() COMMENT '마지막 접속일',
    CW_USER_LEVEL INT NOT NULL DEFAULT 0 COMMENT '회원 등급',
    PRIMARY KEY (CW_USER_NO,CW_USER_MID)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
COMMENT = '회원 정보 테이블'
;
update CW_USER set CW_USER_LEVEL = 1 where CW_USER_MID = 'qqqq';

select * from CW_FACILITY_INFORMATION;
update CW_FACILITY_INFORMATION set FA_AP_CH = 'N';
ALTER TABLE CW_FACILITY_INFORMATION ADD FA_AP_CH CHAR(1) NULL DEFAULT 'N' COMMENT '상시 접수 N: 체크안함 Y:체크함';
ALTER TABLE CW_FACILITY_INFORMATION DROP COLUMN FA_AP_CH;
/* 시설 정보 */
CREATE TABLE CW_FACILITY_INFORMATION(
	FA_NO INT NOT NULL AUTO_INCREMENT COMMENT '시설 번호',
    FA_GROUP VARCHAR(20) NOT NULL COMMENT '시설 분류',
    FA_FNAME VARCHAR(50) NOT NULL COMMENT '시설 이름',
    FA_INAME VARCHAR(50) NOT NULL COMMENT '기관 이름',
    FA_ADDRESS VARCHAR(100) NOT NULL COMMENT '시설 위치',
    FA_AP_START VARCHAR(20) DEFAULT NULL COMMENT '접수 기간 시작일',
    FA_AP_END VARCHAR(20) DEFAULT NULL COMMENT '접수 기간 종료일',
    FA_AP_CH CHAR(1) NOT NULL DEFAULT 'N' COMMENT '상시 접수 N: 체크안함 Y:체크함',
    FA_OP_START VARCHAR(20) DEFAULT NULL COMMENT '운영 기간 시작일',
    FA_OP_END VARCHAR(20) DEFAULT NULL COMMENT '운영 기간 종료일',
    FA_OPTIME_STRAT VARCHAR(20) DEFAULT NULL COMMENT '운영 시간 시작',
    FA_OPTIME_END VARCHAR(20) DEFAULT NULL COMMENT '운영 시간 종료',
    FA_OPTIME_CH VARCHAR(20) NOT NULL COMMENT '운영 시간 단위',
    FA_METHOD CHAR(1) NOT NULL COMMENT '접수 방법 1:승인 2: 선착순',
    FA_PEOPLE_NO INT NOT NULL COMMENT '모집 인원',
    FA_NUMBER INT NOT NULL COMMENT '문의 전화',
    FA_TARGET VARCHAR(20) NOT NULL COMMENT '이용 대상',
    FA_PAY INT DEFAULT 0 COMMENT '이용 요금',
    FA_DETAILED VARCHAR(500) DEFAULT NULL COMMENT '상세 정보',
    FA_ATTENTION VARCHAR(500) DEFAULT NULL COMMENT '유의 사항',
    FA_PHOTO VARCHAR(40) DEFAULT 'NO_IMAGE.PNG' COMMENT '사진 파일',
    FA_SHOW CHAR(1) NOT NULL DEFAULT 'N' COMMENT '표시 여부 N: 미표시 Y: 표시',
    FA_BANK_NAME VARCHAR(20) DEFAULT NULL COMMENT '은행명',
    FA_BANK_NUM VARCHAR(20) DEFAULT NULL COMMENT '계좌번호',
    FA_BANK_MASTER VARCHAR(20) DEFAULT NULL COMMENT '예금주',
    FA_CLOSE_START CHAR(14) DEFAULT NULL COMMENT '휴관 시작일',
    FA_CLOSE_END CHAR(14) DEFAULT NULL COMMENT '휴관 종료일',
    FA_CLOSE_DAY varchar(50) DEFAULT NULL COMMENT '요일',
    PRIMARY KEY (FA_NO,FA_FNAME)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
COMMENT = '시설 정보 테이블'
;
show tables;
select * from CW_FACILITY_INFORMATION;
drop table CW_FACILITY_INFORMATION;
drop table CW_FACILITY_BOOKING;
drop table CW_FACILITY_PAYMENT;
drop table CW_FACILITY_REFUND;

select * from CW_FACILITY_BOOKING;
/* 예약 테이블 */
CREATE TABLE CW_FACILITY_BOOKING(
	BOOKING_NO INT NOT NULL AUTO_INCREMENT COMMENT '예약 번호',
	FA_NO INT NOT NULL COMMENT '시설 번호',
	FA_FNAME VARCHAR(50) NOT NULL COMMENT '시설 이름',
    FA_INAME VARCHAR(50) NOT NULL COMMENT '기관 이름',
    BOOKING_DAY DATETIME DEFAULT NOW() COMMENT '예약일시',
    BOOKING_USEDAY VARCHAR(14) NOT NULL COMMENT '이용날짜',
    BOOKING_USETIME VARCHAR(11) NOT NULL COMMENT '이용시간',
    BOOKING_PERSONNEL INT NOT NULL COMMENT '인원',
    FA_PAY INT DEFAULT NULL COMMENT '이용 요금',
    BOOKING_PAY INT DEFAULT NULL COMMENT '최종 결제 요금',
	CW_USER_NAME VARCHAR(20) NOT NULL COMMENT '회원 이름',
    CW_USER_BIRTH VARCHAR(11) DEFAULT NULL COMMENT '생년월일',
    CW_USER_HOBBY VARCHAR(50) DEFAULT NULL COMMENT '단체/동호회',
    CW_USER_NUMBER CHAR(15) NOT NULL COMMENT '회원 전화번호',
    BOOKING_POU VARCHAR(50) NOT NULL COMMENT '사용 목적',
    BOOKING_STATUS CHAR(1) DEFAULT 1 COMMENT '예약상태 1:예약신청 2:예약완료 3:예약취소',
    BOOKING_APPROVAL CHAR(1) NOT NULL DEFAULT 1 COMMENT '승인여부 1:대기 2: 승인 3:반려(사유)',
    BOOKING_APPROVAL2 TEXT DEFAULT NULL COMMENT '반려사유',
    BOOKING_PAYMENT CHAR(1) NOT NULL DEFAULT 0 COMMENT '결제상태 0:결제대기 1: 결제완료 2:결제취소',
    BOOKING_CNT CHAR(1) DEFAULT 1 COMMENT '사용자 - 1: 예약가능 2: 예약마감',
    BOOKING_DELETE CHAR(1) DEFAULT 1 COMMENT '취소 - 0: 환불요청 1: 요청전 2: 예약취소 3:취소완료 4:사용완료 5:환불',
    PRIMARY KEY (BOOKING_NO),
    FOREIGN KEY(FA_NO) REFERENCES CW_FACILITY_INFORMATION(FA_NO) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
COMMENT = '예약 테이블'
;
select CW_FACILITY_INFORMATION.FA_FNAME,CW_FACILITY_INFORMATION.FA_BANK_NAME,CW_FACILITY_BOOKING.BOOKING_DAY from CW_FACILITY_INFORMATION left join CW_FACILITY_BOOKING on CW_FACILITY_INFORMATION.FA_NO = CW_FACILITY_BOOKING.FA_NO; 
select CW_FACILITY_BOOKING.*,CW_FACILITY_INFORMATION.* from CW_FACILITY_BOOKING left join CW_FACILITY_INFORMATION on (CW_FACILITY_BOOKING.FA_NO = CW_FACILITY_INFORMATION.FA_NO) where CW_FACILITY_BOOKING.FA_NO = 2;
/* 결제 테이블 */
/*
CREATE TABLE CW_FACILITY_PAYMENT(
	PAYMENT_NO INT NOT NULL AUTO_INCREMENT COMMENT '결제 번호',
    BOOKING_NO INT NOT NULL COMMENT '예약 번호',
    BANK_NO INT NOT NULL COMMENT '기관 은행번호',
    CW_USER_MID VARCHAR(20) NOT NULL COMMENT '회원 아이디',
	CW_USER_NAME VARCHAR(20) NOT NULL COMMENT '회원 이름',
	BOOKING_DAY DATETIME DEFAULT NOW() COMMENT '예약일시  결제기한:예약실시 + 1주일',
    BOOKING_USEDAY CHAR(14) NOT NULL COMMENT '이용날짜',
    BOOKING_USETIME CHAR(11) NOT NULL COMMENT '이용시간',
	BOOKING_PAYMENT CHAR(1) NOT NULL DEFAULT 1 COMMENT '결제상태 1:결제대기 2: 결제완료',
	BOOKING_PAY INT DEFAULT NULL COMMENT '이용 요금',
	BOOKING_FPAY INT DEFAULT NULL COMMENT '최종 결제 요금',
    BANK_NAME VARCHAR(20) NOT NULL COMMENT '은행명',
    BANK_NUM VARCHAR(20) NOT NULL COMMENT '계좌번호',
    BANK_MASTER VARCHAR(20) NOT NULL COMMENT '예금주',
    PRIMARY KEY (PAYMENT_NO),
    FOREIGN KEY(BOOKING_NO) REFERENCES CW_FACILITY_BOOKING(BOOKING_NO) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
COMMENT = '결제 테이블'
;
*/
select * from CW_FACILITY_REFUND;
/* 환불 테이블 */
CREATE TABLE CW_FACILITY_REFUND(
	REFUND_NO INT NOT NULL AUTO_INCREMENT COMMENT '환불 번호',
    BOOKING_NO INT NOT NULL COMMENT '예약 번호',
	CW_USER_NAME VARCHAR(20) NOT NULL COMMENT '회원 이름',
    USER_BANK_NAME VARCHAR(20) NOT NULL COMMENT '은행명', 
    USER_BANK_NUM VARCHAR(20) NOT NULL COMMENT '계좌번호',
    USER_NAME VARCHAR(20) NOT NULL COMMENT '예금주',
    REFUND_BIGO VARCHAR(50) DEFAULT NULL COMMENT '비고',
    PRIMARY KEY (REFUND_NO),
    FOREIGN KEY(BOOKING_NO) REFERENCES CW_FACILITY_BOOKING(BOOKING_NO) ON UPDATE NO ACTION ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8
COMMENT = '환불 테이블'
;
select CW_FACILITY_BOOKING.*,CW_FACILITY_REFUND.* from CW_FACILITY_BOOKING left join CW_FACILITY_REFUND on CW_FACILITY_BOOKING.BOOKING_NO = CW_FACILITY_REFUND.BOOKING_NO where FA_NO = 2;