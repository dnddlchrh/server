---- NUMBER(15, 2) == 15자리, 소수점 2자리
---- DDL: DROP TABLE : 주문 테이블 삭제
DROP TABLE 주문테이블;
---- DDL: CREATE TABLE : 주문 테이블 생성
CREATE TABLE 주문테이블(
	주문번호 	VARCHAR2(16) NOT NULL,
	고객번호 	VARCHAR2(16) NOT NULL,
	주문일 		VARCHAR2(8) NOT NULL,
	주문가격 	NUMBER(15, 2) NOT NULL,
	배송도시 	VARCHAR2(256),
	배송완료일 	VARCHAR2(8),
	결제금액 	VARCHAR2(8),
	할인금액 	NUMBER(15, 2) NOT NULL,
	적립포인트 	NUMBER(15, 2) NOT NULL,
	PRIMARY KEY(주문번호)
);
---- DDL: CREATE TABLE : 주문 테이블 생성
CREATE TABLE 주문테이블_백업 AS SELECT * FROM 주문테이블;
---- DDL: 테이블 목록 확인:
SELECT * FROM USER_TABLES;
---- DDL: 컬럼 이름과 타입을 변경
ALTER TABLE 주문테이블 MODIFY 배송도시 VARCHAR2(16);
---- DDL: 컬럼 이름 변경
ALTER TABLE 주문테이블 RENAME COLUMN 배송도시 TO 배송도시코드;
---- DDL: 새 컬럼추가
ALTER TABLE 주문테이블 ADD 배송도시 VARCHAR2(256);
---- DDL: 컬럼 삭제
ALTER TABLE 주문테이블 DROP COLUMN 배송도시;
---- DDL: CREATE TABLE: 배송도시 테이블생성
CREATE TABLE 배송도시테이블(
	배송도시코드 		NUMBER(16) 		NOT NULL,
	배송도시 		VARCHAR2(256) 	NOT NULL,
	PRIMARY KEY(배송도시코드)
);
---- DDL: 제악조건추가
ALTER TABLE 주문테이블
ADD CONSTRAINT 배송도시_FK 
FOREIGN KEY(배송도시코드) REFERENCES 배송도시테이블(배송도시코드);
---- DDL: 제악조건삭제
ALTER TABLE 주문테이블
DROP CONSTRAINT 배송도시_FK;
---------------------------------------------------------
---------------------------------------------------------
------												-----
------			DML				실습					-----
------												-----
---------------------------------------------------------
---------------------------------------------------------

---- 단일 레코드 삽입
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (1, '서울');
---- 단일 레코드 삽입2
INSERT INTO 배송도시테이블 VALUES (2, '인천');
---- 단일 레코드 삽입 에러: PRIMARY KEY 중복
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (1, '대구');
---- 단일 레코드 삽입 에러: 컬럼 데이터 타입 오류
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (3, 10.3);
---- 단일 레코드 삽입 에러: 컬럼 데이터 갯수 오류
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (3, '대구', '수성구');
---- 단일 레코드 삽입
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (3, '대구');
---- 단일 레코드 삽입
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (4, '광주');
---- 단일 레코드 삽입
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (5, '대전');
---- 단일 레코드 삽입
INSERT INTO 배송도시테이블 (배송도시코드, 배송도시) VALUES (6, '부산');
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('1', 'USER_01', '20190601', 100.25, 1, '20190602', '100', 0.25, 100);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('2', 'USER_12', '20190601', 256.11, 5, '20190603', '256', 0.11, 256);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('3', 'USER_05', '20190605', 1235.00, 3, '20190607', '1235', 0.11, 1235);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('4', 'USER_35', '20190607', 254.00, 2, '20190610', '200', 54.54, 200);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('5', 'USER_01', '20190601', 5486.00, 3, '20190611', '5000', 486, 5000);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('6', 'USER_02', '20190610', 514.00, 3, '20190615', '500', 14, 500);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('7', 'USER_35', '20190611', 5487.00, 1, '20190618', '5400', 87, 5400);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('8', 'USER_05', '20190612', 5486.00, 3, '20190613', '5400', 86, 5400);
---- 단일 레코드 삽입: 주문테이블
INSERT INTO 주문테이블 
(주문번호, 고객번호, 주문일, 주문가격, 배송도시코드, 배송완료일, 결제금액, 할인금액, 적립포인트) 
VALUES 
('9', 'USER_01', '20190617', 58.00, 1, '20190620', '50', 8, 50);
---- 데이터 조회: 주문테이블의 모든 데이터 조회
SELECT * FROM 주문테이블;
---- 데이터 조회: 배송도시테이블의 모든 데이터 조회
SELECT * FROM 배송도시테이블;
---- 데이터 조회: 고객번호가 USER_01인 것을 조회
SELECT * FROM 주문테이블 WHERE 고객번호='USER_01';
---- 데이터 조회: 고객번호가 USER_01인 것의 주문번호, 주문일, 배송완료일 만 조회
SELECT 주문번호, 주문일, 배송완료일 FROM 주문테이블 WHERE 고객번호='USER_01';
---- 데이터 조회: 할인 금액이 10보다 크거나 같은것만 조회
SELECT * FROM 주문테이블 WHERE 할인금액>=10;
---- 데이터 조회: 할인 금액이 0이 아닌것만 조회
SELECT * FROM 주문테이블 WHERE 할인금액<>0;
SELECT * FROM 주문테이블 WHERE 할인금액!=0;
SELECT * FROM 주문테이블 WHERE NOT 할인금액=0;
---- 데이터 조회: 주문금액과 결제금액이 50이상 차이가 나는 경우만 조회
SELECT * FROM 주문테이블 WHERE 주문가격-결제금액>=50;
---- 데이터 조회: 주문가격 1000이상이고 할인금애이50 미만 경우만 조회
SELECT * FROM 주문테이블 WHERE 주문가격>=1000 AND 할인금액<50;
---- 데이터 조회: 배송도시 코드가 1,2 또는 3 인 경우만조회
SELECT * FROM 주문테이블 WHERE 배송도시코드 IN (1, 2, 3);
SELECT * FROM 주문테이블 WHERE 배송도시코드 = 1 OR 배송도시코드 = 2 OR 배송도시코드 = 3;
---- 데이터 조회: 배송도시 코드가 1,2 또는 3 이 아닌 경우만조회
SELECT * FROM 주문테이블 WHERE 배송도시코드 NOT IN (1, 2, 3);
SELECT * FROM 주문테이블 WHERE NOT(배송도시코드 = 1 OR 배송도시코드 = 2 OR 배송도시코드 = 3);
SELECT * FROM 주문테이블 WHERE 배송도시코드 != 1 AND 배송도시코드 != 2 AND 배송도시코드 != 3;
---- 데이터 조회: 주문금액1000이상 3000이하 만 조회
SELECT * FROM 주문테이블 WHERE 주문가격 >= 1000 AND 주문가격 <= 3000;
SELECT * FROM 주문테이블 WHERE 주문가격 BWTWEEN 1000 AND 3000;
---- 데이터 조회: 주문금액1000이상 3000이하 가 아닌것 조회
SELECT * FROM 주문테이블 WHERE 주문가격 <= 1000 OR 주문가격 > 3000);
SELECT * FROM 주문테이블 WHERE NOT(주문가격 >= 1000 AND 주문가격 <= 3000);
SELECT * FROM 주문테이블 WHERE 주문가격 NOT BWTWEEN 1000 AND 3000;
---- 데이터 조회: 주문일이 그달의 1일인 경우만 조회
SELECT * FROM 주문테이블 WHERE 주문일 LIKE '%01';
SELECT * FROM 주문테이블 WHERE 주문일 LIKE '______01';
---- 데이터 조회: 주문일이 그달의 10에서 19일 사이인 경우만 조회
SELECT * FROM 주문테이블 WHERE 주문일 LIKE '______1%';
SELECT * FROM 주문테이블 WHERE 주문일 LIKE '______1_';
---- 데이터 조회: 고객번호에 밑줄문자가있는 경우만 출력하세요. 단 LIKE 연산자를 사용하시오.
SELECT * FROM 주문테이블 WHERE 고객번호 LIKE '%A_%' ESCAPE 'A';
---- 데이터 조회: 고객번호의 USER_01을 USER01로 변경하시오
---- 데이터 조회: 고객번호의 USER_01을 USER01로 변경하시오
UPDATE 주문테이블 SET 고객번호='USER01' WHERE 고객번호='USER_01';
SELECT * FROM 주문테이블;
---- 데이터 조회: 모든 주문의 적립포인트를 10%씩 오려주세요.
UPDATE 주문테이블 SET 적립포인트 = 적립포인트 * 1.1;
conn sys/oracle as sysdba
//아이디 생성
create user sample_user identified by 1111;
//권한 부여
grant connect, RESOURCE to sample_user;
//권한 삭제
revoke connect, RESOURCE from sample_user;
//테이블 생성 권한
grant create table to sample_user;
//세션 생성, 사용자 삭제 권한
grant create session, drop user to sample_user;
//권한 삭제
revoke create table, create session, drop user from sample_user;
//HR.jobs를 검색할 수 있는 권한
grant select on HR.jobs to sample_user;
//HR.jobs를 삽입할 수 있는 권한
grant select, insert on HR.jobs to sample_user;
//권한 모두 회수
revoke all on HR.jobs from sample_user;
//자기권한확인
select * from user_sys_privs;
//데이터베이스에서 하는 역할
select * from user_role_privs;
//자기꺼
select * from user_tab_privs;
//다른애꺼
select * from user_tab_privs;

show autocommit
//on자리에 숫자가 붙으면 몇개의 문장마다 커밋을 할지 정함
set autocommit on

//나 테이블쿼리없음
insert into HR.jobs values ('ZZ_XYZ','albmon',1000,2000);
insert into HR.jobs values ('XX_XYZ','alb1004',5000,30000);
//트랜잭션 취소
rollback;
//세이브포인트
SAVEPOINT SVPT1

SAVE TRAN SVTR3;
DELETE FROM PLAYER;
ROLLBACK TRAN SVPT3;

