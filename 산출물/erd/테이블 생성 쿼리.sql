/* 회원 */
CREATE TABLE member (
	mem_cd VARCHAR2(20) NOT NULL, /* 회원코드 */
	mem_id VARCHAR2(20), /* 아이디 */
	mem_pwd VARCHAR2(255), /* 비밀번호 */
	mem_email VARCHAR2(50), /* 이메일 */
	mem_name VARCHAR2(50), /* 이름 */
	mem_bir DATE, /* 생년월일 */
	mem_phone VARCHAR2(20), /* 휴대폰번호 */
	mem_addr VARCHAR2(500), /* 주소 */
	mem_addr_detail VARCHAR2(500), /* 상세주소 */
	gb_sms_alert VARCHAR2(1), /* SMS알림여부 */
	gb_email_alert VARCHAR2(1), /* 이메일알림여부 */
	mem_pic_path VARCHAR2(500), /* 프로필사진URL */
	mem_grade VARCHAR2(1), /* 등급 */
	regdate DATE, /* 가입날짜 */
	gb_del VARCHAR2(1), /* 탈퇴여부 */
	deldate DATE, /* 탈퇴날짜 */
	gb_ban VARCHAR2(1), /* 정지여부 */
	stopdate DATE, /* 정지날짜 */
	gb_sleep VARCHAR2(1), /* 휴면여부 */
	lastlogindate DATE /* 최근로그인날짜 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		mem_cd ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			mem_cd
		);

/* 회원간편로그인 */
CREATE TABLE mem_sns_login (
	mem_cd VARCHAR2(20) NOT NULL, /* 회원코드 */
	sns VARCHAR2(50) NOT NULL, /* 소셜사이트 */
	sns_name VARCHAR2(50), /* 이름 */
	sns_email VARCHAR2(50), /* 이메일 */
	linkdate DATE /* 연동일자 */
);

CREATE UNIQUE INDEX PK_mem_sns_login
	ON mem_sns_login (
		mem_cd ASC,
		sns ASC
	);

ALTER TABLE mem_sns_login
	ADD
		CONSTRAINT PK_mem_sns_login
		PRIMARY KEY (
			mem_cd,
			sns
		);

/* 회원선호극장 */
CREATE TABLE mem_like_theater (
	mem_cd VARCHAR2(20), /* 회원코드 */
	thr_name VARCHAR2(100) /* 영화관명 */
);

/* 회원선호장르 */
CREATE TABLE mem_like_genre (
	mem_cd VARCHAR2(20), /* 회원코드 */
	genre_cd VARCHAR2(20) /* 장르코드 */
);

/* 회원구매 */
CREATE TABLE mem_buy (
	merchant_uid INTEGER NOT NULL, /* 회원구매번호 */
	product_cd VARCHAR2(20), /* 상품코드 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	buydate DATE, /* 구매날짜 */
	amount INTEGER, /* 수량 */
	discount INTEGER, /* 할인금액 */
	pricesum INTEGER, /* 상품금액 */
	mem_coupon_no INTEGER, /* 회원쿠폰번호 */
	use_point INTEGER /* 사용포인트 */
);

CREATE UNIQUE INDEX PK_mem_buy
	ON mem_buy (
		merchant_uid ASC
	);

ALTER TABLE mem_buy
	ADD
		CONSTRAINT PK_mem_buy
		PRIMARY KEY (
			merchant_uid
		);

/* 회원소지쿠폰 */
CREATE TABLE mem_coupon (
	mem_coupon_no INTEGER NOT NULL, /* 회원쿠폰번호 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	coupon_cd VARCHAR2(20), /* 쿠폰코드 */
	enddate DATE, /* 유효기한날짜 */
	gb_use VARCHAR2(1) /* 사용여부 */
);

CREATE UNIQUE INDEX PK_mem_coupon
	ON mem_coupon (
		mem_coupon_no ASC
	);

ALTER TABLE mem_coupon
	ADD
		CONSTRAINT PK_mem_coupon
		PRIMARY KEY (
			mem_coupon_no
		);

/* 영화 */
CREATE TABLE movie (
	movie_cd VARCHAR2(20) NOT NULL, /* 영화코드 */
	movie_name VARCHAR2(200), /* 영화제목 */
	movie_info VARCHAR2(3000), /* 영화소개 */
	movie_director VARCHAR2(50), /* 감독 */
	movie_actor VARCHAR2(500), /* 출연진 */
	movie_grade VARCHAR2(50), /* 관람등급 */
	movie_length VARCHAR2(30), /* 러닝타임 */
	movie_mainpic_path VARCHAR(500), /* 메인포스터URL */
	opendate DATE, /* 개봉일 */
	enddate DATE /* 상영종료일 */
);

CREATE UNIQUE INDEX PK_movie
	ON movie (
		movie_cd ASC
	);

ALTER TABLE movie
	ADD
		CONSTRAINT PK_movie
		PRIMARY KEY (
			movie_cd
		);

/* 관람등급 */
CREATE TABLE movie_grade (
	movie_grade VARCHAR2(50) NOT NULL /* 관람등급 */
);

CREATE UNIQUE INDEX PK_movie_grade
	ON movie_grade (
		movie_grade ASC
	);

ALTER TABLE movie_grade
	ADD
		CONSTRAINT PK_movie_grade
		PRIMARY KEY (
			movie_grade
		);

/* 영화좋아요 */
CREATE TABLE movie_like (
	mem_cd VARCHAR2(20), /* 회원코드 */
	movie_cd VARCHAR2(20) /* 영화코드 */
);

/* 영화관련사진 */
CREATE TABLE movie_picture (
	movie_pic_no INTEGER NOT NULL, /* 사진번호 */
	movie_cd VARCHAR2(20), /* 영화코드 */
	movie_pic_path VARCHAR2(500) /* 사진 URL */
);

CREATE UNIQUE INDEX PK_movie_picture
	ON movie_picture (
		movie_pic_no ASC
	);

ALTER TABLE movie_picture
	ADD
		CONSTRAINT PK_movie_picture
		PRIMARY KEY (
			movie_pic_no
		);

/* 예고편 */
CREATE TABLE movie_preview (
	movie_pre VARCHAR2(20) NOT NULL, /* 예고편코드 */
	movie_cd VARCHAR2(20), /* 영화코드 */
	movie_pre_path VARCHAR2(500) /* 예고편URL */
);

CREATE UNIQUE INDEX PK_movie_preview
	ON movie_preview (
		movie_pre ASC
	);

ALTER TABLE movie_preview
	ADD
		CONSTRAINT PK_movie_preview
		PRIMARY KEY (
			movie_pre
		);

/* 관람평 */
CREATE TABLE review (
	review_no INTEGER NOT NULL, /* 관람평번호 */
	movie_cd VARCHAR2(20), /* 영화코드 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	review_rating INTEGER, /* 평점 */
	review_content VARCHAR2(500), /* 내용 */
	regdate DATE, /* 등록일 */
	gb_del VARCHAR2(1), /* 삭제여부 */
	updatedate DATE /* 수정일 */
);

CREATE UNIQUE INDEX PK_review
	ON review (
		review_no ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			review_no
		);

/* 무비포스트 */
CREATE TABLE moviepost (
	mpost_no INTEGER NOT NULL, /* 무비포스트번호 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	movie_cd VARCHAR2(20), /* 영화코드 */
	mpost_content VARCHAR2(500), /* 내용 */
	movie_pic_no INTEGER, /* 사진번호 */
	gb_del VARCHAR2(1), /* 삭제여부 */
	regdate DATE, /* 등록일 */
	updatedate DATE /* 수정일 */
);

CREATE UNIQUE INDEX PK_moviepost
	ON moviepost (
		mpost_no ASC
	);

ALTER TABLE moviepost
	ADD
		CONSTRAINT PK_moviepost
		PRIMARY KEY (
			mpost_no
		);

/* 영화관 */
CREATE TABLE theater (
	thr_name VARCHAR2(100) NOT NULL, /* 영화관명 */
	thr_loc VARCHAR2(50), /* 지역구분 */
	thr_addr VARCHAR2(500), /* 주소 */
	thr_addr_detail VARCHAR2(500), /* 상세주소 */
	thr_info VARCHAR2(3000) /* 영화관소개 */
);

CREATE UNIQUE INDEX PK_theater
	ON theater (
		thr_name ASC
	);

ALTER TABLE theater
	ADD
		CONSTRAINT PK_theater
		PRIMARY KEY (
			thr_name
		);

/* 상영관 */
CREATE TABLE house (
	thr_no INTEGER NOT NULL, /* 상영관번호 */
	thr_name VARCHAR2(100), /* 영화관명 */
	house_name VARCHAR2(100), /* 상영관명 */
	house_row INTEGER, /* 행 */
	house_column INTEGER /* 열 */
);

CREATE UNIQUE INDEX PK_house
	ON house (
		thr_no ASC
	);

ALTER TABLE house
	ADD
		CONSTRAINT PK_house
		PRIMARY KEY (
			thr_no
		);

/* 상영영화 */
CREATE TABLE screen (
	screen_cd VARCHAR2(20) NOT NULL, /* 상영영화코드 */
	thr_no INTEGER, /* 상영관번호 */
	movie_cd VARCHAR2(20), /* 영화코드 */
	startdate DATE, /* 상영시작시간 */
	gb_jojo VARCHAR2(1) /* 조조여부 */
);

CREATE UNIQUE INDEX PK_screen
	ON screen (
		screen_cd ASC
	);

ALTER TABLE screen
	ADD
		CONSTRAINT PK_screen
		PRIMARY KEY (
			screen_cd
		);

/* 영화상영타입 */
CREATE TABLE movie_type (
	movie_type_cd VARCHAR2(20) NOT NULL, /* 상영타입코드 */
	movie_type_des VARCHAR2(200) /* 코드설명 */
);

CREATE UNIQUE INDEX PK_movie_type
	ON movie_type (
		movie_type_cd ASC
	);

ALTER TABLE movie_type
	ADD
		CONSTRAINT PK_movie_type
		PRIMARY KEY (
			movie_type_cd
		);

/* 공통코드 */
CREATE TABLE code (
	cd_name VARCHAR2(20) NOT NULL, /* 코드 */
	cd_des VARCHAR2(1000), /* 코드설명 */
	cd_val VARCHAR2(1000) /* 코드값 */
);

CREATE UNIQUE INDEX PK_code
	ON code (
		cd_name ASC
	);

ALTER TABLE code
	ADD
		CONSTRAINT PK_code
		PRIMARY KEY (
			cd_name
		);

/* 해당영화상영타입 */
CREATE TABLE movie_type_c (
	movie_cd VARCHAR2(20), /* 영화코드 */
	movie_type_cd VARCHAR2(20) /* 상영타입코드 */
);

/* 예매 */
CREATE TABLE reservation (
	res_cd VARCHAR2(20) NOT NULL, /* 예매코드 */
	res_no INTEGER NOT NULL, /* 예매번호 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	screen_cd VARCHAR2(20), /* 상영영화코드 */
	mem_cat VARCHAR2(10), /* 회원유형 */
	res_seat VARCHAR2(10), /* 좌석 */
	resdate DATE /* 예매날짜 */
);

CREATE UNIQUE INDEX PK_reservation
	ON reservation (
		res_cd ASC
	);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			res_cd
		);

/* 관람료 */
CREATE TABLE movie_price (
	mem_cat VARCHAR2(10) NOT NULL, /* 회원유형 */
	price INTEGER /* 관람료 */
);

CREATE UNIQUE INDEX PK_movie_price
	ON movie_price (
		mem_cat ASC
	);

ALTER TABLE movie_price
	ADD
		CONSTRAINT PK_movie_price
		PRIMARY KEY (
			mem_cat
		);

/* 장르 */
CREATE TABLE genre (
	genre_cd VARCHAR2(20) NOT NULL, /* 장르코드 */
	genre_name VARCHAR2(200) /* 장르명 */
);

CREATE UNIQUE INDEX PK_genre
	ON genre (
		genre_cd ASC
	);

ALTER TABLE genre
	ADD
		CONSTRAINT PK_genre
		PRIMARY KEY (
			genre_cd
		);

/* 관람평추천 */
CREATE TABLE review_like (
	mem_cd VARCHAR2(20), /* 회원코드 */
	review_no INTEGER /* 관람평번호 */
);

/* 무비포스트 추천 */
CREATE TABLE mp_like (
	mpost_no INTEGER, /* 무비포스트번호 */
	mem_cd VARCHAR2(20) /* 회원코드 */
);

/* 이벤트 */
CREATE TABLE event (
	event_no INTEGER NOT NULL, /* 이벤트번호 */
	movie_cd VARCHAR2(20), /* 관련영화코드 */
	event_div VARCHAR2(50), /* 구분 */
	startdate DATE, /* 시작일 */
	enddate DATE, /* 종료일 */
	event_title VARCHAR2(200), /* 제목 */
	event_content VARCHAR2(3000), /* 내용 */
	event_pic_path VARCHAR2(500), /* 이벤트이미지URL */
	regdate DATE, /* 등록일 */
	event_thum_path VARCHAR2(500) /* 썸네일URL */
);

CREATE UNIQUE INDEX PK_event
	ON event (
		event_no ASC
	);

ALTER TABLE event
	ADD
		CONSTRAINT PK_event
		PRIMARY KEY (
			event_no
		);

/* 이벤트응모자 */
CREATE TABLE applicant (
	mem_cd VARCHAR2(20) NOT NULL, /* 회원코드 */
	event_no INTEGER NOT NULL, /* 이벤트번호 */
	enterdate DATE /* 응모날짜 */
);

CREATE UNIQUE INDEX PK_applicant
	ON applicant (
		mem_cd ASC,
		event_no ASC
	);

ALTER TABLE applicant
	ADD
		CONSTRAINT PK_applicant
		PRIMARY KEY (
			mem_cd,
			event_no
		);

/* 이벤트당첨자 */
CREATE TABLE winner (
	mem_cd VARCHAR2(20), /* 회원코드 */
	event_no INTEGER /* 이벤트번호 */
);

/* 상품 */
CREATE TABLE product (
	product_cd VARCHAR2(20) NOT NULL, /* 상품코드 */
	product_name VARCHAR2(200), /* 상품명 */
	product_content VARCHAR2(3000), /* 상품내용 */
	product_price INTEGER, /* 가격 */
	product_div VARCHAR2(50), /* 상품구분 */
	product_period INTEGER, /* 유효기간 */
	product_info VARCHAR2(4000), /* 이용안내 */
	product_pic_path VARCHAR2(500) /* 사진URL */
);

CREATE UNIQUE INDEX PK_product
	ON product (
		product_cd ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT PK_product
		PRIMARY KEY (
			product_cd
		);

/* 회원상품 */
CREATE TABLE mem_product (
	mem_product_cd VARCHAR2(20) NOT NULL, /* 회원상품코드 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	product_cd VARCHAR2(20), /* 상품코드 */
	gb_use VARCHAR2(1), /* 사용여부 */
	enddate DATE /* 유효기한날짜 */
);

CREATE UNIQUE INDEX PK_mem_product
	ON mem_product (
		mem_product_cd ASC
	);

ALTER TABLE mem_product
	ADD
		CONSTRAINT PK_mem_product
		PRIMARY KEY (
			mem_product_cd
		);

/* 쿠폰 */
CREATE TABLE coupon (
	coupon_cd VARCHAR2(20) NOT NULL, /* 쿠폰코드 */
	coupon_name VARCHAR2(50), /* 쿠폰명 */
	discount VARCHAR2(10), /* 할인 */
	coupon_period INTEGER /* 유효기간 */
);

CREATE UNIQUE INDEX PK_coupon
	ON coupon (
		coupon_cd ASC
	);

ALTER TABLE coupon
	ADD
		CONSTRAINT PK_coupon
		PRIMARY KEY (
			coupon_cd
		);

/* 무비포스트신고 */
CREATE TABLE mp_report (
	mpost_no INTEGER, /* 무비포스트번호 */
	mem_cd VARCHAR2(20) /* 회원코드 */
);

/* 무비포스트댓글 */
CREATE TABLE reply (
	reply_no INTEGER NOT NULL, /* 댓글번호 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	mpost_no INTEGER, /* 무비포스트번호 */
	reply_content VARCHAR2(500), /* 댓글내용 */
	regdate DATE, /* 등록일 */
	updatedate DATE, /* 수정일 */
	gb_del VARCHAR2(1) /* 삭제여부 */
);

CREATE UNIQUE INDEX PK_reply
	ON reply (
		reply_no ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_no
		);

/* 댓글신고 */
CREATE TABLE reply_report (
	reply_no INTEGER, /* 댓글번호 */
	mem_cd VARCHAR2(20) /* 회원코드 */
);

/* 관람평신고 */
CREATE TABLE review_report (
	review_no INTEGER, /* 관람평번호 */
	mem_cd VARCHAR2(20) /* 회원코드 */
);

/* 공지사항 */
CREATE TABLE notice (
	notice_no INTEGER NOT NULL, /* 공지사항번호 */
	admin_cd VARCHAR2(20), /* 관리자코드 */
	notice_title VARCHAR2(500), /* 제목 */
	notice_content VARCHAR2(4000), /* 내용 */
	notice_thr VARCHAR2(100), /* 극장 */
	regdate DATE, /* 등록일 */
	updatedate DATE, /* 수정일 */
	gd_del VARCHAR2(1) /* 삭제여부 */
);

CREATE UNIQUE INDEX PK_notice
	ON notice (
		notice_no ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			notice_no
		);

/* 관리자 */
CREATE TABLE admin (
	admin_cd VARCHAR2(20) NOT NULL, /* 관리자코드 */
	thr_name VARCHAR2(100), /* 영화관명 */
	admin_id VARCHAR2(20), /* 아이디 */
	admin_pwd VARCHAR2(255) /* 비밀번호 */
);

CREATE UNIQUE INDEX PK_admin
	ON admin (
		admin_cd ASC
	);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			admin_cd
		);

/* FAQ */
CREATE TABLE faq (
	faq_no INTEGER NOT NULL, /* FAQ번호 */
	faq_title VARCHAR2(500), /* 제목 */
	faq_content VARCHAR2(4000), /* 내용 */
	regdate DATE, /* 등록일 */
	updatedate DATE, /* 수정일 */
	gb_del VARCHAR2(1) /* 삭제여부 */
);

CREATE UNIQUE INDEX PK_faq
	ON faq (
		faq_no ASC
	);

ALTER TABLE faq
	ADD
		CONSTRAINT PK_faq
		PRIMARY KEY (
			faq_no
		);

/* 1대1문의 */
CREATE TABLE question (
	que_no INTEGER NOT NULL, /* 문의번호 */
	que_title VARCHAR2(500), /* 문의제목 */
	que_content VARCHAR2(4000), /* 문의내용 */
	mem_cd INTEGER, /* 회원코드 */
	writer_name VARCHAR2(50), /* 이름 */
	writer_email VARCHAR2(50), /* 이메일 */
	que_sel VARCHAR2(50), /* 문의선택 */
	que_type VARCHAR2(50), /* 문의유형 */
	gb_mem VARCHAR2(1), /* 회원여부 */
	writer_pwd VARCHAR2(255) /* 비밀번호 */
);

CREATE UNIQUE INDEX PK_question
	ON question (
		que_no ASC
	);

ALTER TABLE question
	ADD
		CONSTRAINT PK_question
		PRIMARY KEY (
			que_no
		);

/* 비회원 */
CREATE TABLE non_member (
	non_mem_cd VARCHAR2(20) NOT NULL, /* 비회원코드 */
	non_mem_name VARCHAR2(50), /* 이름 */
	non_mem_bir DATE, /* 생년월일 */
	non_mem_phone VARCHAR2(20), /* 휴대폰번호 */
	non_mem_pwd VARCHAR2(255) /* 비밀번호 */
);

CREATE UNIQUE INDEX PK_non_member
	ON non_member (
		non_mem_cd ASC
	);

ALTER TABLE non_member
	ADD
		CONSTRAINT PK_non_member
		PRIMARY KEY (
			non_mem_cd
		);

/* 1대1문의답변 */
CREATE TABLE answer (
	que_no INTEGER, /* 문의번호 */
	admin_cd VARCHAR2(20), /* 관리자코드 */
	ans_content VARCHAR2(4000), /* 답변내용 */
	regdate DATE /* 등록일 */
);

/* 문의유형 */
CREATE TABLE question_type (
	que_type VARCHAR2(50) NOT NULL, /* 문의유형 */
	que_sel VARCHAR2(50) NOT NULL /* 문의선택 */
);

CREATE UNIQUE INDEX PK_question_type
	ON question_type (
		que_type ASC,
		que_sel ASC
	);

ALTER TABLE question_type
	ADD
		CONSTRAINT PK_question_type
		PRIMARY KEY (
			que_type,
			que_sel
		);

/* 1대1문의첨부파일 */
CREATE TABLE question_attach (
	attach_no INTEGER NOT NULL, /* 첨부파일번호 */
	que_no INTEGER, /* 문의번호 */
	attach_path VARCHAR2(500), /* URL */
	attach_type VARCHAR2(50) /* 파일타입 */
);

CREATE UNIQUE INDEX PK_question_attach
	ON question_attach (
		attach_no ASC
	);

ALTER TABLE question_attach
	ADD
		CONSTRAINT PK_question_attach
		PRIMARY KEY (
			attach_no
		);

/* 포인트 */
CREATE TABLE point (
	point_cd VARCHAR2(20) NOT NULL, /* 포인트코드 */
	mem_cd VARCHAR2(20), /* 회원코드 */
	mem_buy_no INTEGER, /* 회원구매번호 */
	point INTEGER, /* 포인트금액 */
	regdate DATE /* 적용일 */
);

CREATE UNIQUE INDEX PK_point
	ON point (
		point_cd ASC
	);

ALTER TABLE point
	ADD
		CONSTRAINT PK_point
		PRIMARY KEY (
			point_cd
		);

/* 결제상세 */
CREATE TABLE pay_detail (
	imp_uid VARCHAR2(50) NOT NULL, /* 결제고유UID */
	apply_num INTEGER, /* 승인번호 */
	card_name VARCHAR2(100), /* 카드이름 */
	card_number VARCHAR2(100), /* 카드번호 */
	pay_method VARCHAR2(100), /* 결제수단 */
	merchant_uid INTEGER, /* 회원구매번호 */
	card_quota INTEGER, /* 할부개월수 */
	status VARCHAR2(50), /* 결제상태 */
	paid_amount INTEGER, /* 결제금액 */
	receipt_url VARCHAR2(500), /* 매출전표URL */
	refunddate DATE /* 취소날짜 */
);

CREATE UNIQUE INDEX PK_pay_detail
	ON pay_detail (
		imp_uid ASC
	);

ALTER TABLE pay_detail
	ADD
		CONSTRAINT PK_pay_detail
		PRIMARY KEY (
			imp_uid
		);

/* 소셜로그인 */
CREATE TABLE social (
	mem_email VARCHAR2(50) NOT NULL, /* 이메일 */
	access_token VARCHAR2(50) NOT NULL, /* 사용자 액세스 토큰 */
	refresh_token VARCHAR2(50), /* 사용자 리프레시 토큰 */
	mem_name VARCHAR2(50), /* 이름 */
	birthyear VARCHAR2(50), /* 출생년도 */
	birthday VARCHAR2(50), /* 생일 */
	mem_phone VARCHAR2(20), /* 휴대폰번호 */
	gb_sl VARCHAR2(1) /* 카카오/네이버 구분 */
);

CREATE UNIQUE INDEX PK_social
	ON social (
		mem_email ASC
	);

ALTER TABLE social
	ADD
		CONSTRAINT PK_social
		PRIMARY KEY (
			mem_email
		);

/* 영화장르 */
CREATE TABLE genre_c (
	genre_cd VARCHAR2(20), /* 장르코드 */
	movie_cd VARCHAR2(20) /* 영화코드 */
);

ALTER TABLE mem_sns_login
	ADD
		CONSTRAINT FK_member_TO_mem_sns_login
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE mem_like_theater
	ADD
		CONSTRAINT FK_member_TO_mem_like_theater
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE mem_like_theater
	ADD
		CONSTRAINT FK_theater_TO_mem_like_theater
		FOREIGN KEY (
			thr_name
		)
		REFERENCES theater (
			thr_name
		);

ALTER TABLE mem_like_genre
	ADD
		CONSTRAINT FK_member_TO_mem_like_genre
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE mem_like_genre
	ADD
		CONSTRAINT FK_genre_TO_mem_like_genre
		FOREIGN KEY (
			genre_cd
		)
		REFERENCES genre (
			genre_cd
		);

ALTER TABLE mem_buy
	ADD
		CONSTRAINT FK_product_TO_mem_buy
		FOREIGN KEY (
			product_cd
		)
		REFERENCES product (
			product_cd
		);

ALTER TABLE mem_buy
	ADD
		CONSTRAINT FK_member_TO_mem_buy
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE mem_buy
	ADD
		CONSTRAINT FK_mem_coupon_TO_mem_buy
		FOREIGN KEY (
			mem_coupon_no
		)
		REFERENCES mem_coupon (
			mem_coupon_no
		);

ALTER TABLE mem_coupon
	ADD
		CONSTRAINT FK_member_TO_mem_coupon
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE mem_coupon
	ADD
		CONSTRAINT FK_coupon_TO_mem_coupon
		FOREIGN KEY (
			coupon_cd
		)
		REFERENCES coupon (
			coupon_cd
		);

ALTER TABLE movie
	ADD
		CONSTRAINT FK_movie_grade_TO_movie
		FOREIGN KEY (
			movie_grade
		)
		REFERENCES movie_grade (
			movie_grade
		);

ALTER TABLE movie_like
	ADD
		CONSTRAINT FK_member_TO_movie_like
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE movie_like
	ADD
		CONSTRAINT FK_movie_TO_movie_like
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE movie_picture
	ADD
		CONSTRAINT FK_movie_TO_movie_picture
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE movie_preview
	ADD
		CONSTRAINT FK_movie_TO_movie_preview
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_movie_TO_review
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE moviepost
	ADD
		CONSTRAINT FK_member_TO_moviepost
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE moviepost
	ADD
		CONSTRAINT FK_movie_TO_moviepost
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE moviepost
	ADD
		CONSTRAINT FK_movie_picture_TO_moviepost
		FOREIGN KEY (
			movie_pic_no
		)
		REFERENCES movie_picture (
			movie_pic_no
		);

ALTER TABLE house
	ADD
		CONSTRAINT FK_theater_TO_house
		FOREIGN KEY (
			thr_name
		)
		REFERENCES theater (
			thr_name
		);

ALTER TABLE screen
	ADD
		CONSTRAINT FK_house_TO_screen
		FOREIGN KEY (
			thr_no
		)
		REFERENCES house (
			thr_no
		);

ALTER TABLE screen
	ADD
		CONSTRAINT FK_movie_TO_screen
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE movie_type_c
	ADD
		CONSTRAINT FK_movie_TO_movie_type_c
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);

ALTER TABLE movie_type_c
	ADD
		CONSTRAINT FK_movie_type_TO_movie_type_c
		FOREIGN KEY (
			movie_type_cd
		)
		REFERENCES movie_type (
			movie_type_cd
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_screen_TO_reservation
		FOREIGN KEY (
			screen_cd
		)
		REFERENCES screen (
			screen_cd
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_movie_price_TO_reservation
		FOREIGN KEY (
			mem_cat
		)
		REFERENCES movie_price (
			mem_cat
		);

ALTER TABLE review_like
	ADD
		CONSTRAINT FK_member_TO_review_like
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE review_like
	ADD
		CONSTRAINT FK_review_TO_review_like
		FOREIGN KEY (
			review_no
		)
		REFERENCES review (
			review_no
		);

ALTER TABLE mp_like
	ADD
		CONSTRAINT FK_moviepost_TO_mp_like
		FOREIGN KEY (
			mpost_no
		)
		REFERENCES moviepost (
			mpost_no
		);

ALTER TABLE mp_like
	ADD
		CONSTRAINT FK_member_TO_mp_like
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE applicant
	ADD
		CONSTRAINT FK_member_TO_applicant
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE applicant
	ADD
		CONSTRAINT FK_event_TO_applicant
		FOREIGN KEY (
			event_no
		)
		REFERENCES event (
			event_no
		);

ALTER TABLE winner
	ADD
		CONSTRAINT FK_applicant_TO_winner
		FOREIGN KEY (
			mem_cd,
			event_no
		)
		REFERENCES applicant (
			mem_cd,
			event_no
		);

ALTER TABLE mem_product
	ADD
		CONSTRAINT FK_product_TO_mem_product
		FOREIGN KEY (
			product_cd
		)
		REFERENCES product (
			product_cd
		);

ALTER TABLE mem_product
	ADD
		CONSTRAINT FK_member_TO_mem_product
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE mp_report
	ADD
		CONSTRAINT FK_moviepost_TO_mp_report
		FOREIGN KEY (
			mpost_no
		)
		REFERENCES moviepost (
			mpost_no
		);

ALTER TABLE mp_report
	ADD
		CONSTRAINT FK_member_TO_mp_report
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_member_TO_reply
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_moviepost_TO_reply
		FOREIGN KEY (
			mpost_no
		)
		REFERENCES moviepost (
			mpost_no
		);

ALTER TABLE reply_report
	ADD
		CONSTRAINT FK_reply_TO_reply_report
		FOREIGN KEY (
			reply_no
		)
		REFERENCES reply (
			reply_no
		);

ALTER TABLE reply_report
	ADD
		CONSTRAINT FK_member_TO_reply_report
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE review_report
	ADD
		CONSTRAINT FK_review_TO_review_report
		FOREIGN KEY (
			review_no
		)
		REFERENCES review (
			review_no
		);

ALTER TABLE review_report
	ADD
		CONSTRAINT FK_member_TO_review_report
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_admin_TO_notice
		FOREIGN KEY (
			admin_cd
		)
		REFERENCES admin (
			admin_cd
		);

ALTER TABLE question
	ADD
		CONSTRAINT FK_question_type_TO_question
		FOREIGN KEY (
			que_type,
			que_sel
		)
		REFERENCES question_type (
			que_type,
			que_sel
		);

ALTER TABLE answer
	ADD
		CONSTRAINT FK_question_TO_answer
		FOREIGN KEY (
			que_no
		)
		REFERENCES question (
			que_no
		);

ALTER TABLE answer
	ADD
		CONSTRAINT FK_admin_TO_answer
		FOREIGN KEY (
			admin_cd
		)
		REFERENCES admin (
			admin_cd
		);

ALTER TABLE question_attach
	ADD
		CONSTRAINT FK_question_TO_question_attach
		FOREIGN KEY (
			que_no
		)
		REFERENCES question (
			que_no
		);

ALTER TABLE point
	ADD
		CONSTRAINT FK_member_TO_point
		FOREIGN KEY (
			mem_cd
		)
		REFERENCES member (
			mem_cd
		);

ALTER TABLE pay_detail
	ADD
		CONSTRAINT FK_mem_buy_TO_pay_detail
		FOREIGN KEY (
			merchant_uid
		)
		REFERENCES mem_buy (
			merchant_uid
		);

ALTER TABLE genre_c
	ADD
		CONSTRAINT FK_genre_TO_genre_c
		FOREIGN KEY (
			genre_cd
		)
		REFERENCES genre (
			genre_cd
		);

ALTER TABLE genre_c
	ADD
		CONSTRAINT FK_movie_TO_genre_c
		FOREIGN KEY (
			movie_cd
		)
		REFERENCES movie (
			movie_cd
		);
		
/* 지역구분 */
CREATE TABLE loc (
	thr_loc VARCHAR2(50) NOT NULL /* 지역구분 */
);

CREATE UNIQUE INDEX PK_loc
	ON loc (
		thr_loc ASC
	);

ALTER TABLE loc
	ADD
		CONSTRAINT PK_loc
		PRIMARY KEY (
			thr_loc
		);