CREATE TABLE users ( -- 사용자 
user_number NUMBER PRIMARY KEY, -- 사용자 고유번호
user_id VARCHAR2(255) NOT NULL,
user_password VARCHAR2(255) NOT NULL,
user_confirm_password VARCHAR2(255) NOT NULL, --비밀번호 확인
user_email VARCHAR2(255),
user_name VARCHAR2(255),
user_birth VARCHAR2(255), --생년월일
user_zipcode VARCHAR2(255), --우편번호
user_address VARCHAR2(255), -- 주소
user_detail_address VARCHAR2(255), --상세주소 --!!user_detailAddress -> user_detail_addres 변경했습니다!!
is_member NUMBER NOT NULL CHECK (is_member IN (0, 1, 2)) -- 0:탈퇴 1:회원 2:관리자
);

CREATE TABLE menu ( -- 메뉴
menu_number NUMBER PRIMARY KEY, --메뉴(음료, 푸드) 고유번호 //1~82: 음료 1001~1054: 푸드
menu_type NUMBER, -- 1: 콜드 브루 2: 에스프레소 3: 프라푸치노 4: 티 5: 기타 6: 브레드 7: 케이크 8: 샌드위치 
menu_name VARCHAR2(100) NOT NULL, --메뉴 이름
menu_description VARCHAR2(1000), --메뉴 설명
menu_size NUMBER, --음료: oz 푸드: g       
menu_calories NUMBER, --칼로리      
menu_allergy_info NUMBER, --1: 우유 2: 대두 3: 우유 및 대두 4: 없음
menu_saturated_fat NUMBER, --포화지방
menu_sugars NUMBER, --당류                
menu_sodium NUMBER, --나트륨    
menu_protein NUMBER, --단백질              
menu_caffeine NUMBER, --카페인       
file_id NUMBER
);

CREATE TABLE product ( -- 상품
product_number NUMBER PRIMARY KEY,
product_type NUMBER, --1: 머그 2: 텀블러 3: 원두 4: 악세사리
product_name VARCHAR2(255) NOT NULL,
product_description VARCHAR2(1000),
product_price NUMBER(10),
product_size NUMBER, --텀블러,머그: ml 원두,악세서리: g
product_stock_quantity NUMBER, -- 재고 수량
product_status NUMBER, -- 1: 판매중 2: 품절 3: 판매종료
file_id NUMBER
);

CREATE TABLE FILE_INFO (
file_id number primary key,
file_name varchar2(256) NOT NULL, --저장되는 이름(파일명+확장자) --랜덤이름
original_file_name varchar2(256) NOT NULL, --원래이름
file_path varchar2(256), --/fileStorage/
file_extension varchar2(64),
file_size number --long: 큰 숫자까지 표현가능!
);

CREATE TABLE shopping_cart ( -- 장바구니
user_id VARCHAR2(255),
product_number NUMBER,
cart_quantity NUMBER,
PRIMARY KEY (user_id, product_number) --하나의 장바구니에는 여러개의 상품을 담을 수 있다
);

CREATE TABLE orders ( -- 주문
order_number NUMBER PRIMARY KEY,
user_id VARCHAR2(255),
order_date DATE,
total_price NUMBER(10),
delivery_address VARCHAR2(500), --배송지
shipping_fee NUMBER(10), --배송비 고정(2500원)
courier_name VARCHAR2(255), --택배회사 고정(CJ대한통운)
tracking_number VARCHAR2(255), --운송장번호(11112222):8자리
order_status NUMBER --1:상품준비중 2:배송준비중 3:배송중 4:배송완료 5:주문취소 6:구매확정-> 처음엔 0으로 시작 (결제완료니까 상품준비중)
);

CREATE TABLE order_detail ( -- 주문 상세
order_detail_number NUMBER,
order_number NUMBER,
product_number NUMBER,
price NUMBER(10),
order_quantity NUMBER,
PRIMARY KEY (order_detail_number, order_number) --주문번호1: 주문상세1,2 /주문번호2: 주문상세1 /주문번호3: 주문상세1,2,3
);

CREATE TABLE payment ( -- 결제
payment_number NUMBER PRIMARY KEY,
order_number NUMBER,
payment_method NUMBER, --결제 방법 : 1:신용카드, 2:휴대폰결제, 3:무통장입금? 
payment_date DATE
);

CREATE TABLE announcement ( -- 공지사항
announcement_number NUMBER PRIMARY KEY,
user_id VARCHAR2(255),  --admin(관리자도 어차피 사용자테이블에 있으니까?)
title VARCHAR2(255),
content VARCHAR2(2000),
post_date DATE,
announcements_count NUMBER --조회수
);

CREATE TABLE faq ( -- 자주 하는 질문
faq_number NUMBER PRIMARY KEY,
user_id VARCHAR2(255),  --admin
question VARCHAR2(2000),
answer VARCHAR2(2000),
post_date DATE,
faqs_count NUMBER --조회수
);

CREATE TABLE customer_feedback ( -- 1:1 상담
feedback_number NUMBER PRIMARY KEY,
user_id VARCHAR2(255),
title VARCHAR2(255),
content VARCHAR2(2000),
feedback_date DATE,
feedback_count NUMBER --조회수
);

CREATE TABLE feedback_response ( -- 댓글
response_number NUMBER PRIMARY KEY,
feedback_number NUMBER,
user_id VARCHAR2(255), --admin
response_content VARCHAR2(2000),
response_date DATE
);

CREATE SEQUENCE SEQ_USERS_PK --사용자 고유번호 (user_number)
start with 6
INCREMENT BY 1
NOCYCLE;

CREATE SEQUENCE file_info_seq
START WITH 156
INCREMENT BY 1
NOCYCLE;

CREATE SEQUENCE announcement_seq
START WITH 5
INCREMENT BY 1;

CREATE SEQUENCE faq_seq
START WITH 5
INCREMENT BY 1;

CREATE SEQUENCE response_seq --댓글
START WITH 4
INCREMENT BY 1;

CREATE SEQUENCE drink_number_seq  --음료
START WITH 83 
INCREMENT BY 1 
MAXVALUE 1000 
NOCYCLE;

CREATE SEQUENCE food_number_seq --푸드
START WITH 1055 
INCREMENT BY 1 
NOCYCLE;

CREATE SEQUENCE product_number_seq --상품
START WITH 20
INCREMENT BY 1 
NOCYCLE;

CREATE SEQUENCE SEQ_FEEDBACK_PK --1:1상담
start with 6
INCREMENT BY 1
NOCYCLE;


--Insert
--MENU
INSERT INTO MENU VALUES(1,1,'나이트로 바닐라 크림','부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!',12,80,1,2,10,40,1,232,1);
INSERT INTO MENU VALUES(2,1,'나이트로 콜드 브루','나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마! 부드러운 목 넘김과 완벽한 밸런스에 커피 본연의 단맛을 경험할 수 있습니다.',12,5,4,0,0,5,0,245,2);
INSERT INTO MENU VALUES(3,1,'돌체 콜드 브루','무더운 여름철, 동남아 휴가지에서 즐기는 커피를 떠오르게 하는 커피나무 음료의 베스트 x 베스트 조합인 돌체 콜드 브루를 만나보세요!',12,265,1,9,29,130,8,155,3);
INSERT INTO MENU VALUES(4,1,'바닐라 크림 콜드 브루','콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.',12,125,1,6,11,58,3,155,4);
INSERT INTO MENU VALUES(5,1,'여수 윤슬 헤이즐넛 콜드 브루','햇빛이나 달빛에 비치어 반짝이는 잔물결이라는 윤슬을 형상화한 헤이즐넛 콜드브루',12,245,1,9,27,85,5,53,5);
INSERT INTO MENU VALUES(6,1,'오트 콜드 브루','콜드 브루의 풍미와 깔끔한 오트음료(식물성 대체유)가 어우러진 달콤 고소한 라떼. 식물성 대체유를 사용해 모든 고객이 부담없이 즐길 수 있는 콜드 브루 음료',12,120,4,0,14,95,1,65,6);
INSERT INTO MENU VALUES(7,1,'제주 비자림 콜드 브루','제주 천년의 숲 비자림을 연상시키는 음료로 제주 유기농 말차와 콜드 브루가 조화로운 제주 특화 콜드 브루 음료',16,360,1,8,39,140,11,305,7);
INSERT INTO MENU VALUES(8,1,'콜드 브루','커피나무 바리스타의 정성으로 탄생한 콜드 브루! 콜드 브루 전용 원두를 차가운 물로 추출하여 한정된 양만 제공됩니다. 깊은 풍미의 새로운 커피 경험을 즐겨보세요.',12,5,4,0,0,11,0,155,8);
INSERT INTO MENU VALUES(9,2,'에스프레소 콘 파나','신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료',1,30,1,2,1,0,0,75,9);
INSERT INTO MENU VALUES(10,2,'에스프레소 마키아또','신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로써, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료',1,10,1,0,0,0,1,75,10);
INSERT INTO MENU VALUES(11,2,'아이스 카페 아메리카노','진한 에스프레소에 시원한 정수물과 얼음을 더하여 커피나무의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피',12,10,4,0,0,5,1,150,11);
INSERT INTO MENU VALUES(12,2,'카페 아메리카노','진한 에스프레소와 뜨거운 물을 섞어 커피나무의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피',12,10,4,0,0,5,1,150,12);
INSERT INTO MENU VALUES(13,2,'아이스 카라멜 마키아또','향긋한 바닐라 시럽과 시원한 우유와 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료',12,190,3,5,22,110,6,75,13);
INSERT INTO MENU VALUES(14,2,'카라멜 마키아또','향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료',12,200,3,5,22,130,8,75,14);
INSERT INTO MENU VALUES(15,2,'아이스 카푸치노','풍부하고 진한 에스프레소에 신선한 우유와 우유 거품이 얼음과 함께 들어간 시원하고 부드러운 커피 음료',12,110,1,4,9,90,6,75,15);
INSERT INTO MENU VALUES(16,2,'카푸치노','풍부하고 진한 에스프레소에 따뜻한 우유와 벨벳 같은 우유 거품이 1:1 비율로 어우러져 마무리된 커피 음료',12,110,1,3,8,70,6,75,16);
INSERT INTO MENU VALUES(17,2,'커피나무 돌체 라떼','커피나무의 다른 커피 음료보다 더욱 깊은 커피의 맛과 향에 깔끔한 무지방 우유와 부드러운 돌체 시럽이 들어간 음료로 달콤하고 진한 커피 라떼',12,225,1,3,39,190,12,150,17);
INSERT INTO MENU VALUES(18,2,'아이스 커피나무 돌체 라떼','커피나무의 다른 커피 음료보다 더욱 깊은 커피의 맛과 향에 깔끔한 무지방 우유와 부드러운 돌체 시럽이 들어간 음료로 달콤하고 진한 커피 라떼',12,230,1,3,35,145,10,150,18);
INSERT INTO MENU VALUES(19,2,'아이스 카페 라떼','풍부하고 진한 농도의 에스프레소가 시원한 우유와 얼음을 만나 고소함과 시원함을 즐길 수 있는 대표적인 커피 라떼',12,110,1,4,8,75,6,75,19);
INSERT INTO MENU VALUES(20,2,'카페 라떼','풍부하고 진한 에스프레소가 신선한 스팀 밀크를 만나 부드러워진 커피 위에 우유 거품을 살짝 얹은 대표적인 커피 라떼',12,180,1,5,13,115,10,75,20);
INSERT INTO MENU VALUES(21,2,'아이스 카페 모카','진한 초콜릿 모카 시럽과 풍부한 에스프레소를 신선한 우유 그리고 얼음과 섞어 휘핑크림으로 마무리한 음료로 진한 에스프레소와 초콜릿 맛이 어우러진 커피',12,250,1,8,21,70,7,95,21);
INSERT INTO MENU VALUES(22,2,'아이스 화이트 초콜릿 모카','달콤하고 부드러운 화이트 초콜릿 시럽과 에스프레소를 신선한 우유 그리고 얼음과 섞어 휘핑크림으로 마무리한 음료로 달콤함과 강렬한 에스프레소가 부드럽게 어우러진 커피',12,335,1,8,41,160,8,75,22);
INSERT INTO MENU VALUES(23,2,'카페 모카','진한 초콜릿 모카 시럽과 풍부한 에스프레소를 스팀 밀크와 섞어 휘핑크림으로 마무리한 음료로 진한 에스프레소와 초콜릿 맛이 어우러진 커피',12,290,1,9,25,105,10,95,23);
INSERT INTO MENU VALUES(24,2,'화이트 초콜릿 모카','달콤하고 부드러운 화이트 초콜릿 시럽과 에스프레소를 스팀 밀크와 섞어 휘핑크림으로 마무리한 음료로 달콤함과 강렬한 에스프레소가 부드럽게 어우러진 커피',12,405,1,11,47,230,12,75,24);
INSERT INTO MENU VALUES(25,2,'바닐라 플랫 화이트','바닐라 플랫 화이트는 진하고 고소한 리스트레토 샷과 바닐라 시럽 그리고 스팀 밀크로 즐기는 진한 커피 라떼 입니다.',12,220,1,5,23,130,9,260,25);
INSERT INTO MENU VALUES(26,2,'커피나무 더블 샷','신선하게 제조된 더블 샷 믹스에 클래식 시럽을 넣고 에스프레소 샷, 얼음이 어우러져 핸드 쉐이킹한 음료',7,125,1,5,14,29,3,150,26);
INSERT INTO MENU VALUES(27,2,'블론드 바닐라 더블 샷 마키아또','블론드 에스프레소 2샷에 흑당 시럽과 바닐라 크림이 부드럽고 달콤하게 어우러진 마키아또 타입의 음료를 즐겨 보세요!',12,315,1,12,31,130,8,170,27);
INSERT INTO MENU VALUES(28,2,'아이스 블론드 바닐라 더블 샷 마키아또','블론드 에스프레소 2샷에 흑당 시럽과 바닐라 크림이 부드럽고 달콤하게 어우러진 마키아또 타입의 음료를 즐겨 보세요!',12,195,1,6,22,65,5,170,28);
INSERT INTO MENU VALUES(29,2,'에스프레소','커피나무 에스프레소는 향기로운 크레마 층과 바디 층, 하트 층으로 이루어져 있으며, 입안 가득히 커피와 달콤한 카라멜 향이 느껴지는 커피 음료입니다.',1,5,4,0,0,0,0,75,29);
INSERT INTO MENU VALUES(30,3,'에스프레소 프라푸치노','에스프레소 샷의 강렬함과 약간의 단맛이 어우러진 프라푸치노',12,145,1,1,29,115,2,120,30);
INSERT INTO MENU VALUES(31,3,'자바 칩 프라푸치노','커피, 모카 소스, 진한 초콜릿 칩이 입안 가득 느껴지는 커피나무에서만 맛볼 수 있는 프라푸치노',12,340,3,9,42,180,6,100,31);
INSERT INTO MENU VALUES(32,3,'카라멜 프라푸치노','카라멜과 커피가 어우러진 프라푸치노',12,300,3,7,39,190,4,85,32);
INSERT INTO MENU VALUES(33,3,'화이트 초콜릿 모카 프라푸치노','화이트 초콜릿, 커피와 우유가 조화로운 프라푸치노',12,265,1,6,43,160,4,85,33);
INSERT INTO MENU VALUES(34,3,'제주 까망 크림 프라푸치노','제주 까망 라떼의 프라푸치노 버전으로 쫄깃한 흑임자 떡과 블랙 소보로 토핑으로 컵빙수처럼 먹는 음료.',16,600,3,7,79,330,9,0,34);
INSERT INTO MENU VALUES(35,3,'제주 쑥떡 크림 프라푸치노','제주 쑥쑥 라떼의 시원한 버전으로 쫄깃쫄깃한 흑임자 떡으로 씹는 재미를 즐길 수 있는 음료.',16,460,3,10,57,250,8,0,35);
INSERT INTO MENU VALUES(36,3,'제주 유기농 말차로 만든 크림 프라푸치노','깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 프라푸치노',12,230,1,7,28,150,5,60,36);
INSERT INTO MENU VALUES(37,3,'초콜릿 크림 칩 프라푸치노','모카 소스와 진한 초콜릿 칩, 초콜릿 드리즐이 올라간 달콤한 크림 프라푸치노',12,300,3,7,40,160,6,10,37);
INSERT INTO MENU VALUES(38,3,'피스타치오 아보카도 초콜릿 프라푸치노','고소한 피스타치오와 달콤한 초콜릿, 아보카도 텍스쳐의 완벽한 조화.',12,295,3,1,36,170,3,5,38);
INSERT INTO MENU VALUES(39,3,'화이트 타이거 프라푸치노','밀크 쉐이크 같은 부드럽고 달콤한 바닐라 크림 프라푸치노에 깊은 풍미의 단맛을 가진 흑당시럽이 어우러져 백호의 줄무늬를 형상화한 부드럽고 달콤한 프라푸치노',16,410,1,14,57,220,5,0,39);
INSERT INTO MENU VALUES(40,4,'민트 블렌드 티','스피어민트, 페퍼민트, 레몬머틀이 블렌딩된 상쾌한 허브 티',12,0,4,0,0,0,0,0,40);
INSERT INTO MENU VALUES(41,4,'아이스 민트 블렌드 티','스피어민트, 페퍼민트, 레몬머틀이 블렌딩된 상쾌한 허브 티',12,0,4,0,0,0,0,0,41);
INSERT INTO MENU VALUES(42,4,'아이스 얼 그레이 티','꽃향 가득한 라벤더와 베르가못 향이 진한 홍차와 블렌딩된 향긋한 블랙 티',12,0,4,0,0,0,0,50,42);
INSERT INTO MENU VALUES(43,4,'아이스 유스베리 티','제주산 찻잎으로 만든 황차에 사과, 망고, 파인애플, 히비스커스, 로즈힙 등이 블렌딩되어 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 옐로우 티',12,0,4,0,0,0,0,20,43);
INSERT INTO MENU VALUES(44,4,'아이스 유자 민트 티','달콤한 국내산 고흥 유자와 알싸하고 은은한 진저와 상쾌한 민트 티가 조화로운 유자 민트 티',12,145,4,0,37,5,0,0,44);
INSERT INTO MENU VALUES(45,4,'아이스 잉글리쉬 브렉퍼스트 티','인도 아삼, 제주도 유기농 홍차가 블렌딩되어 진한 벌꿀향과 그윽한 몰트향이 특징인 블랙 티',12,0,4,0,0,0,0,40,45);
INSERT INTO MENU VALUES(46,4,'아이스 제주 유기 녹차','우수한 품질의 제주도 유기농 녹차로 만든 맑은 수색과 신선한 향, 맛이 뛰어난 녹차',12,0,4,0,0,0,0,16,46);
INSERT INTO MENU VALUES(47,4,'아이스 캐모마일 블렌드 티','캐모마일과 레몬 그라스, 레몬밤, 히비스커스 등 블렌딩되어 은은하고 차분한 향이 기분을 좋게하는 허브 티',12,0,4,0,0,0,0,0,47);
INSERT INTO MENU VALUES(48,4,'아이스 히비스커스 블렌드 티','히비스커스, 사과, 파파야, 망고, 레몬그라스 등이 블렌딩된 상큼한 허브 티',12,0,4,0,0,0,0,0,48);
INSERT INTO MENU VALUES(49,4,'얼 그레이 티','꽃향 가득한 라벤더와 베르가못 향이 진한 홍차와 블렌딩된 향긋한 블랙 티',12,0,4,0,0,0,0,70,49);
INSERT INTO MENU VALUES(50,4,'유스베리 티','제주산 찻잎으로 만든 황차에 사과, 망고, 파인애플, 히비스커스, 로즈힙 등이 블렌딩되어 핑크빛 컬러가 감도는 수색과 베리류의 새콤함을 느낄 수 있는 옐로우 티',12,0,4,0,0,0,0,20,50);
INSERT INTO MENU VALUES(51,4,'유자 민트 티','달콤한 국내산 고흥 유자와 알싸하고 은은한 진저, 우릴 수록 상쾌한 민트 티가 조화로운 유자 민트 티',12,235,4,0,58,10,0,0,51);
INSERT INTO MENU VALUES(52,4,'잉글리쉬 브렉퍼스트 티','인도 아삼, 제주도 유기농 홍차가 블렌딩되어 진한 벌꿀향과 그윽한 몰트향이 특징인 블랙 티',12,0,4,0,0,0,0,70,52);
INSERT INTO MENU VALUES(53,4,'자몽 허니 블랙 티','새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 커피나무 티바나 블랙 티의 조화',12,125,4,0,30,5,0,70,53);
INSERT INTO MENU VALUES(54,4,'제주 유기 녹차','우수한 품질의 제주도 유기농 녹차로 만든 맑은 수색과 신선한 향, 맛이 뛰어난 녹차',12,0,4,0,0,0,0,16,54);
INSERT INTO MENU VALUES(55,4,'캐모마일 블렌드 티','캐모마일과 레몬 그라스, 레몬밤, 히비스커스 등 블렌딩되어 은은하고 차분한 향이 기분을 좋게하는 허브 티',12,0,4,0,0,0,0,0,55);
INSERT INTO MENU VALUES(56,4,'히비스커스 블렌드 티','히비스커스, 사과, 파파야, 망고, 레몬그라스 등이 블렌딩된 상큼한 허브 티',12,0,4,0,0,0,0,0,56);
INSERT INTO MENU VALUES(57,4,'레드 파워 패션 티','딸기와 복숭아의 화사함에 패션 탱고티의 산뜻함을 더해 한 모금 마시면 두근거리는 열정이 다시 떠오르는 리프레싱 티 음료',16,190,4,0,31,40,1,33,57);
INSERT INTO MENU VALUES(58,4,'아이스 자몽 허니 블랙 티','새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 커피나무 티바나 블랙 티의 조화',12,125,4,0,30,5,0,30,58);
INSERT INTO MENU VALUES(59,4,'돌체 블랙 밀크 티','진한 홍차에 부드러운 우유와 연유 시럽으로 향긋하고 달콤하게 맛을 낸 커피나무만의 돌체 블랙 밀크 티',12,250,1,5,34,115,8,60,59);
INSERT INTO MENU VALUES(60,4,'말차 티라미수 라떼','달콤 쌉싸름한 말차크림으로 부드럽게 즐길 수 있는 디저트 타입의 말차 티라미수 음료',12,405,1,15,38,220,11,75,60);
INSERT INTO MENU VALUES(61,4,'커피나무 클래식 밀크 티','커피나무가 선보이는 클래식한 밀크 티로, 진하게 오래 우려낸 티바나 블랙 티의 깊은 풍미와 우유의 조화로움을 담아낸 맛에 집중한 밀크 티',12,299,1,13,31,80,5,190,61);
INSERT INTO MENU VALUES(62,4,'아이스 돌체 블랙 밀크 티','진한 홍차에 부드러운 우유와 연유 시럽으로 향긋하고 달콤하게 맛을 낸 커피나무만의 돌체 블랙 밀크 티',12,210,1,4,31,85,6,35,62);
INSERT INTO MENU VALUES(63,4,'아이스 커피나무 클래식 밀크 티','커피나무가 선보이는 클래식한 밀크 티로, 진하게 오래 우려낸 티바나 블랙 티의 깊은 풍미와 우유의 조화로움을 담아낸 맛에 집중한 밀크 티',12,198,1,9,21,50,3,80,63);
INSERT INTO MENU VALUES(64,4,'아이스 얼 그레이 바닐라 티 라떼','2가지 티(블랙티, 얼 그레이 티)가 조화롭게 어우러지고 얼 그레이 폼과 바닐라의 풍미가 은은하게 퍼져 깔끔하고 부드러운 티 라떼 음료',12,325,1,10,33,115,8,29,64);
INSERT INTO MENU VALUES(65,4,'아이스 제주 유기농 말차로 만든 라떼','차광재배한 어린 녹찻잎을 곱게 갈아 깊고 진한 말차 본연의 맛과 향을 부드럽게 즐길 수 있는 제주 유기농 말차로 만든 라떼',12,155,1,4,16,95,6,60,65);
INSERT INTO MENU VALUES(66,4,'아이스 차이 티 라떼','스파이시한 향과 독특한 계피향, 달콤한 차이로 만든 부드러운 티 라떼',12,190,1,3,31,70,5,70,66);
INSERT INTO MENU VALUES(67,4,'얼 그레이 바닐라 티 라떼','2가지 티(블랙티, 얼 그레이 티)가 조화롭게 어우러지고 얼 그레이 폼과 바닐라의 풍미가 은은하게 퍼져 깔끔하고 부드러운 티 라떼 음료',12,355,1,11,36,130,9,55,67);
INSERT INTO MENU VALUES(68,4,'제주 유기농 말차로 만든 라떼','차광재배한 어린 녹찻잎을 곱게 갈아 깊고 진한 말차 본연의 맛과 향을 부드럽게 즐길 수 있는 제주 유기농 말차로 만든 라떼',12,205,1,5,20,130,9,60,68);
INSERT INTO MENU VALUES(69,4,'차이 티 라떼','스파이시한 향과 독특한 계피향, 달콤한 차이로 만든 부드러운 티 라떼',12,200,1,3,31,70,6,70,69);
INSERT INTO MENU VALUES(70,5,'딸기 콜드폼 초콜릿','딸기 풍미 가득한 커피나무만의 딸기 콜드폼과 은은한 초콜릿의 향으로 남녀노소 즐길 수 있는 음료',12,255,1,2,45,110,7,5,70);
INSERT INTO MENU VALUES(71,5,'시그니처 핫 초콜릿','깊고 진한 초콜릿과 부드러운 휘핑크림이 입안에서 사르르 녹는 초콜릿 음료',12,500,1,9,52,105,15,15,71);
INSERT INTO MENU VALUES(72,5,'아이스 시그니처 초콜릿','깊고 진한 초콜릿과 부드러운 휘핑크림이 입안에서 사르르 녹는 초콜릿 음료',12,325,1,7,32,70,10,15,72);
INSERT INTO MENU VALUES(73,5,'아이스 티라미수 초콜릿','리저브 다크 초콜릿을 활용하여 초콜릿 풍미 가득한 디저트 타입의 티라미수 초콜릿',12,335,1,11,34,130,7,10,73);
INSERT INTO MENU VALUES(74,5,'티라미수 초콜릿','리저브 다크 초콜릿을 활용하여 초콜릿 풍미 가득한 디저트 타입의 티라미수 초콜릿',12,420,1,14,41,200,11,10,74);
INSERT INTO MENU VALUES(75,5,'플러피 판다 아이스 초콜릿','고소한 헤이즐넛과 진한 초콜릿의 만남, 귀여운 판다까지 더해진 플러피 판다 아이스 초콜릿!',16,415,1,16,39,150,11,0,75);
INSERT INTO MENU VALUES(76,5,'플러피 판다 핫 초콜릿','고소한 헤이즐넛과 진한 초콜릿의 만남, 귀여운 판다까지 더해진 플러피 판다 아이스 초콜릿!',16,470,1,17,48,160,12,0,76);
INSERT INTO MENU VALUES(77,5,'딸기 콜드폼 딸기 라떼','딸기 풍미 가득한 커피나무만의 딸기 콜드폼과 딸기 본연의 맛을 즐길 수 있는 음료',16,235,1,2,41,110,6,0,77);
INSERT INTO MENU VALUES(78,5,'커피나무 슬래머','스트로베리와 아사이베리의 상큼, 달콤한 맛이 톡톡! 시원하고 통쾌한 그랜드 슬램을 위한 에너지 부스팅 음료~!',16,235,4,0,55,0,0,0,78);
INSERT INTO MENU VALUES(79,5,'스팀 우유','부드럽고 담백한 따뜻한 우유.',12,215,1,7,18,173,13,0,79);
INSERT INTO MENU VALUES(80,5,'아이스 제주 까망 라떼','제주도의 돌담길과 하르방의 풍경을 느낄 수 있는 음료로 고소한 흑임자와 달콤한 소보로 토핑으로 시원하게 누구나 즐길 수 있는 음료',16,440,3,11,45,210,10,0,80);
INSERT INTO MENU VALUES(81,5,'우유','부드럽고 담백한 신선한 우유.',12,240,1,8,18,200,12,0,81);
INSERT INTO MENU VALUES(82,5,'제주 까망 라떼','제주도의 돌담길과 하르방의 풍경을 느낄 수 있는 음료로 고소한 흑임자와 달콤한 소보로 토핑으로 누구나 즐길 수 있는 음료',16,445,3,7,49,250,13,0,82);
INSERT INTO MENU VALUES(1001,6,'바질 토마토 크림치즈 베이글','바질, 반건조 토마토, 크림치즈의 조합이 이색적인 베이글로 크림치즈가 듬뿍 샌드되어 든든하게 즐길 수 있습니다.',185,517,3,12,17,804,14,0,83);
INSERT INTO MENU VALUES(1002,6,'탕종 블루베리 베이글','달콤한 블루베리와 탕종법으로 반죽한 후 고온에서 데치고, 짧게 구워 내 쫄깃하고 촉촉한 식감이 특징인 블루베리 베이글입니다.',90,240,3,2,9,550,7,0,84);
INSERT INTO MENU VALUES(1003,6,'탕종 파마산 치즈 베이글','파마산 치즈와 탕종법으로 반죽한 후 고온에서 데치고, 짧게 구워 내 쫄깃하고 촉촉한 식감이 특징인 파마산 치즈 베이글입니다.',95,225,3,5,7,660,7,0,85);
INSERT INTO MENU VALUES(1004,6,'탕종 플레인 베이글','탕종법으로 반죽한 후 고온에서 데치고, 짧게 구워 내 쫄깃하고 촉촉한 식감이 특징인 플레인 베이글입니다.',90,600,3,2,6,600,7,0,86);
INSERT INTO MENU VALUES(1005,6,'미니 클래식 스콘','미니 사이즈의 담백한 스콘입니다.',96,456,3,25,12,383,7,0,87);
INSERT INTO MENU VALUES(1006,6,'클래식 스콘','프랑스산 고급 버터로 만든 담백한 스콘입니다.',105,481,1,16,12,448,7,0,88);
INSERT INTO MENU VALUES(1007,6,'피넛 쑥 떡 스콘','쫄깃한 떡을 넣은 쑥 스콘 위에 땅콩을 넣은 소보로를 올린 달콤하고 고소한 스콘입니다.',118,490,3,6,27,540,7,0,89);
INSERT INTO MENU VALUES(1008,6,'거문 오름 크루아상','제주도의 현무암을 크루아상에 오름 모양을 아몬드 페이스트로 형상화하여만든 크루아상입니다.',82,391,3,14,16,367,7,0,90);
INSERT INTO MENU VALUES(1009,6,'미니 리프 파이','버터 풍미가 가득한 나뭇잎 모양의 바삭 바삭한 파이입니다.',42,212,3,5,15,131,2,0,91);
INSERT INTO MENU VALUES(1010,6,'바질 치즈 포카치아','바질 페스토와 모짜렐라, 체다와 고다 치즈가 채워진 촉촉하고 폭신한 식감의 포카치아입니다.',138,360,3,6,3,568,16,0,92);
INSERT INTO MENU VALUES(1011,6,'뺑 오 쇼콜라','바삭하면서도 속은 부드러운 데니쉬 안에 초콜릿 필링을 넣어 담백하면서도 달콤한 맛이 느껴지는 빵입니다.',70,295,2,10,8,380,5,0,93);
INSERT INTO MENU VALUES(1012,6,'스모크드 소시지 브레드','훈제된 도톰한 소시지와 머스타드 그릴드 어니언이 맛의 조화를 이룬 든든한 간식용 소시지 브레드입니다.',170,520,3,5,7,985,14,0,94);
INSERT INTO MENU VALUES(1013,6,'연유 밀크모닝','부드럽고 폭신한 질감의 빵 안에 연유 버터크림이 들어있어 따뜻하게 드시면 크림이 사르르 녹아 더욱 맛있게 드실 수 있습니다.',132,440,3,11,23,540,8,0,95);
INSERT INTO MENU VALUES(1014,6,'오름 치즈 케이츄리','오름을 닮은 미니 치즈 케이크와 달콤한 슈크림을 담은 패스츄리를 한번에 즐길 수 있는 이색적인 브레드입니다.',148,590,1,20,26,600,10,0,96);
INSERT INTO MENU VALUES(1015,6,'올래 미니 크루아상','초콜릿을 입힌 버터풍미 가득한 미니 크루아상 러스크에 제주 한라봉 필, 우도 땅콩을 토핑하여 제주도의 달콤함을 간편하게 즐길 수 있는 스낵형 브레드 입니다.',60,315,3,14,18,230,3,0,97);
INSERT INTO MENU VALUES(1016,6,'주상절리 파이','제주의 주상절리 모양을 표현하여 겹겹이 쌓은 패스츄리를 바삭하게 구운 후 초콜릿을 입혀 달콤하게 즐길 수 있는 제주 전용 파이입니다.',95,505,3,17,24,480,7,0,98);
INSERT INTO MENU VALUES(1017,6,'초콜릿 월넛 브레드','촉촉한 초콜릿 번에 진한 초콜릿 필링을 채운 뒤, 호두와 초콜릿을 코팅하여 달달함과 고소함을 더한 비건 브레드입니다.',140,740,2,22,36,295,11,0,99);
INSERT INTO MENU VALUES(1018,6,'하트 파이','하트 모양의 바삭한 파이입니다.',96,466,1,10,16,501,9,0,100);
INSERT INTO MENU VALUES(1019,6,'한 입에 쏙 치즈 꿀 볼','네 가지의 다양한 치즈가 들어가 짭짤한 맛과 달콤한 아카시아 꿀이 더해져 단짠의 조화가 매력적인 브레드!',98,283,1,5,8,582,13,0,101);
INSERT INTO MENU VALUES(1020,7,'7 레이어 가나슈 케이크','초콜릿, 가나슈, 모카로 만든 시트와 크림이 7개의 층을 이루어 모양부터 매력적인 케이크입니다.',280,1152,3,22,34,163,20,0,102);
INSERT INTO MENU VALUES(1021,7,'The 촉촉 초콜릿 생크림 케이크','달콤한 초콜릿 케이크 시트에 진한 가나슈 생크림을 넣고 측면에 다크 초콜릿을 듬뿍 토핑한 달콤하고 촉촉한 초콜릿 케이크입니다.',120,456,3,16,23,140,7,0,103);
INSERT INTO MENU VALUES(1022,7,'꿀 고구마 생크림 케이크','꿀이 들어간 부드러운 고구마 무스와 조각 형태의 고구마를 화이트 케이크 시트 사이에 샌드하고 생크림을 올린 달콤하고 고소한 케이크입니다.',140,465,3,18,40,190,4,0,104);
INSERT INTO MENU VALUES(1023,7,'마스카포네 티라미수 케이크','고소한 마스카포네 치즈 크림에 촉촉한 커피 시트가 입안을 감싸는 기분 좋은 느낌의 떠먹는 티라미수입니다.',170,472,3,18,25,104,8,0,105);
INSERT INTO MENU VALUES(1024,7,'바스크 치즈 케이크','고온에서 짧게 구워 겉면은 스모키하고 속은 크리미한 것이 특징인 스페인 바스크 지방에서 유래된 바스크 치즈 케이크입니다.',230,665,1,27,46,410,11,0,106);
INSERT INTO MENU VALUES(1025,7,'부드러운 생크림 카스텔라','부드러운 생크림이 듬뿍 들어있는 촉촉한 카스텔라입니다.',340,1150,3,20,30,165,9,0,107);
INSERT INTO MENU VALUES(1026,7,'부드러운 티라미수 롤','달콤한 초코 케이크 시트에 고소한 마스카포네 크림을 듬뿍 넣은 부드러운 롤 케이크입니다.',270,886,3,14,35,162,8,0,108);
INSERT INTO MENU VALUES(1027,7,'새코롬 한라봉 크림 케이크','촉촉한 케이크 시트 사이에 치즈 생크림과 한라봉 크림을 층층이 올린 후 한라봉 제스트로 마무리한 상큼한 케이크입니다.',110,350,3,13,23,140,4,0,109);
INSERT INTO MENU VALUES(1028,7,'슈크림 가득 바움쿠헨','바닐라 빈이 들어간 부드러운 슈크림과 바움쿠헨이 조화로운 바닐라 풍미의 케이크입니다.',171,573,3,18,30,165,8,0,110);
INSERT INTO MENU VALUES(1029,7,'클래식 블루베리 치즈 케이크','크림치즈를 넣은 진한 풍미의 치즈 케이크 위에 달콤, 상큼한 블루베리가 올라간 클래식한 치즈 케이크입니다',250,750,3,33,63,510,10,0,111);
INSERT INTO MENU VALUES(1030,7,'당근 현무암 케이크','현무암을 연상케 하는 오징어 먹물 케이크 시트 사이에 새콤한 당근 크림치즈 무스를 샌드한 컵 케이크입니다.',120,375,3,0,27,140,5,0,112);
INSERT INTO MENU VALUES(1031,7,'제주 녹차 생크림 롤','녹차 롤 케이크 시트에 진한 마스카포네 크림과 달콤 쌉싸름한 제주 녹차 가나슈를 넣은 롤 케이크입니다.',170,590,3,17,22,160,9,0,113);
INSERT INTO MENU VALUES(1032,7,'제주 땅콩 생크림 롤','롤 케이크 시트에 땅콩을 넣은 진한 마스카포네 크림과 고소한 제주산 땅콩 가나슈을 넣은 후 고소한 카라멜 땅콩을 올린 롤 케이크입니다.',170,640,3,15,19,150,11,0,114);
INSERT INTO MENU VALUES(1033,7,'돔 피칸 타르트','타르트 시트에 달콤한 필링과 고소한 피칸을 돔 형태로 듬뿍 올려 구워낸 피칸 타르트 입니다.',100,435,1,7,29,160,6,0,115);
INSERT INTO MENU VALUES(1034,7,'마스카포네 티라미수','진한 마스카포네 치즈 크림에 촉촉한 커피 시트가 입안을 감싸는 기분 좋은 느낌의 떠먹는 티라미수입니다.',100,285,3,11,14,70,4,0,116);
INSERT INTO MENU VALUES(1035,7,'베어리스타 우유 생크림 케이크','달콤하고 고소한 우유 생크림 안에 바삭하게 씹히는 화이트 초콜릿 볼이 쏙쏙 박혀 있는 생크림 케이크입니다.',100,365,3,13,28,180,5,0,117);
INSERT INTO MENU VALUES(1036,7,'블루베리 쿠키 치즈 케이크','달콤한 블루베리를 듬뿍 올린 진한 풍미의 쿠키 치즈 케이크입니다.',100,390,3,7,27,310,4,0,118);
INSERT INTO MENU VALUES(1037,7,'세븐 레이어 가나슈 케이크','초콜릿, 가나슈, 모카로 만든 시트와 크림으로 만든 7개의 층이 특징이며, 가나슈로 감싸 진한 풍미의 초콜릿 케이크입니다.',100,433,3,16,27,112,6,0,119);
INSERT INTO MENU VALUES(1038,7,'청담스타 얼 그레이 밀크 케이크','얼 그레이 케이크 시트 사이에 부드럽고 향긋한 얼 그레이 생크림을 샌드한 케이크입니다.',100,345,3,13,20,60,4,0,120);
INSERT INTO MENU VALUES(1039,7,'청담스타 오 허니 케이크','흑설탕을 넣어 구운 케이크 시트 사이에 향긋한 꿀과 크림치즈를 샌드한 특별한 케이크입니다.',100,348,3,14,28,67,5,0,121);
INSERT INTO MENU VALUES(1040,7,'크레이프 에멘탈 치즈 케이크','부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든 케이크를 한 장 한 장 얇게 구운 크레이프로 감싸 정성스럽게 만든 케이크입니다.',100,330,3,19,18,254,5,0,122);
INSERT INTO MENU VALUES(1041,8,'B.E.L.T.샌드위치','주 재료인 베이컨(Bacon), 계란(Egg), 로메인 상추(Lettuce-Romane), 토마토(Tomato)의 각각의 머리 글자를 따온 이름의 샌드위치 입니다.',235,448,3,7,5,976,20,0,123);
INSERT INTO MENU VALUES(1042,8,'단호박 에그 샐러드 샌드위치','곡물 식빵에 달콤하고 고소한 단호박 에그 샐러드와 신선한 로메인, 양상추를 더해 가볍고 건강하게 즐기는 샌드위치입니다.',220,470,3,7,12,790,13,0,124);
INSERT INTO MENU VALUES(1043,8,'당근 산도롱 샌드위치','당근 식빵 사이에 아삭한 당근 라페와 잠봉 햄, 스크램블 에그를 넣은 샌드위치입니다.',230,460,3,6,9,992,19,0,125);
INSERT INTO MENU VALUES(1044,8,'멜팅 치즈 베이컨 샌드위치','고소한 참깨 사워도우에 베이컨과 콜비잭치즈, 모차렐라, 그라나파다노 등 다섯 가지 치즈를 듬뿍 넣어 풍부한 치즈 풍미가 매력인 샌드위치입니다.',175,478,3,12,2,881,27,0,126);
INSERT INTO MENU VALUES(1045,8,'바비큐 치킨 치즈 치아바타','바삭한 치아바타에 새콤달콤한 바비큐 소스 치킨, 베이컨, 치즈가 어우러진 샌드위치입니다.',155,320,3,5,5,877,19,0,127);
INSERT INTO MENU VALUES(1046,8,'베이컨 치즈 토스트','계란과 우유를 적신 빵에 베이컨과 치즈, 에그 스프레드를 넣어 구운 프렌치 토스트 타입 샌드위치입니다.',110,337,3,8,9,635,14,0,128);
INSERT INTO MENU VALUES(1047,8,'브렉퍼스트 잉글리쉬 머핀','바쁜 아침, 간편하게 즐길 수 있는 잉글리쉬 머핀 샌드위치로 소시지 패티, 달걀 후라이, 본가드 치즈를 넣어 만들었습니다.',150,355,3,6,2,742,17,0,129);
INSERT INTO MENU VALUES(1048,8,'블랙 갈릭 에그 샌드위치','먹물 핫도그번에 스크램블 에그, 베이컨, 치즈, 치킨브레스트햄을 샌드하고 갈릭 소스로 풍미를 더한 샌드위치입니다.',190,524,3,10,13,1007,22,0,130);
INSERT INTO MENU VALUES(1049,8,'에그에그 샌드위치','화이트 식빵 사이에 고소한 에그 스프레드를 넣은 부드러운 샌드위치입니다.',165,364,3,5,5,657,15,0,131);
INSERT INTO MENU VALUES(1050,8,'제주 녹차 베이컨 치즈 베이글','제주 녹차로 만든 베이글에 모짜렐라 치즈와 베이컨을 넣은 베이글 샌드위치입니다.',175,470,3,16,8,999,22,0,132);
INSERT INTO MENU VALUES(1051,8,'제주 돼지 풀드포크 샌드위치','제주 돼지로 만든 풀드 포크와 모짜렐라 치즈, 에멘탈 치즈로 진한 맛을 더한 파니니 샌드위치입니다.',195,565,3,11,6,990,25,0,133);
INSERT INTO MENU VALUES(1052,8,'치즈 포크 커틀릿 샌드위치','겉 테두리가 없는 식빵 사이에 모차렐라 치즈와 국내산 포크 커틀릿을 넣어 만든 샌드위치입니다.',230,729,3,12,11,1412,25,0,134);
INSERT INTO MENU VALUES(1053,8,'치킨 클래식 샌드위치','닭가슴살, 베이컨, 계란, 토마토를 넣어 든든하게 즐길 수 있는 클래식한 샌드위치입니다.',230,411,3,6,2,993,24,0,135);
INSERT INTO MENU VALUES(1054,8,'햄 루꼴라 올리브 샌드위치','햄, 토마토, 모짜렐라 치즈와 루꼴라를 올리브가 콕콕 박힌 치아바타 사이에 넣은 샌드위치입니다.',190,353,3,4,3,781,17,0,136);

--PRODUCT
INSERT INTO PRODUCT VALUES(1,1,'커피나무 하우스 머그 237ml','클래식한 디자인과 커피나무 로고가 매치된 237ml 머그입니다.',10000,237,30,1,137);
INSERT INTO PRODUCT VALUES(2,1,'커피나무 하우스 머그 355ml','클래식한 디자인과 커피나무 로고가 매치된 355ml 머그입니다.',15000,355,30,1,138);
INSERT INTO PRODUCT VALUES(3,1,'커피나무 하우스 머그 473ml','클래식한 디자인과 커피나무 로고가 매치된 473ml 머그입니다.',20000,473,30,1,139);
INSERT INTO PRODUCT VALUES(4,1,'그린 커피나무 도트 머그 237ml','법랑 머그의 쉐입을 한 세라믹 머그로서, 트렌디한 감성의 디자인이 결합된 237ml 상품입니다.',20000,237,30,1,140);
INSERT INTO PRODUCT VALUES(5,1,'그린 커피나무 도트 머그 355ml','법랑 머그의 쉐입을 한 세라믹 머그로서, 트렌디한 감성의 디자인이 결합된 355ml 상품입니다.',25000,355,0,2,141);
INSERT INTO PRODUCT VALUES(6,2,'나수 하우스 텀블러 355ml','심플한 디자인과 크림 컬러 배색으로 시즌에 상관없이 사용할 수 있는 355ml 용량의 스테인리스 스틸 텀블러입니다.',25000,355,30,1,142);
INSERT INTO PRODUCT VALUES(7,2,'우디 하우스 텀블러 591ml','커피나무 헤리티지 컬러로 디자인된 591ml 용량의 스테인리스 스틸 텀블러입니다.',35000,591,30,1,143);
INSERT INTO PRODUCT VALUES(8,2,'콩코드 하우스 텀블러 473ml','커피나무 헤리티지 컬러에 커피나무 로고를 더한 473ml 용량의 스테인리스 스틸 텀블러입니다.',30000,473,30,1,144);
INSERT INTO PRODUCT VALUES(9,2,'콩코드 하우스 텀블러 591ml','심플한 블랙 컬러에 커피나무 로고를 더한 591ml 용량의 스테인리스 스틸 텀블러입니다.',35000,591,30,1,145);
INSERT INTO PRODUCT VALUES(10,3,'에티오피아 250g','다크초콜릿의 벨벳 같은 부드러움과 후추 같은 스파이시함, 달콤한 감귤류의 풍미가 특징인 원두',40000,250,30,1,146);
INSERT INTO PRODUCT VALUES(11,3,'케냐 250g','열대성 과일의 향기와 신비로움으로 깔끔한 주스와 같은 느낌을 가진 커피',40000,250,30,1,147);
INSERT INTO PRODUCT VALUES(12,3,'하우스 블렌드 250g','깔끔하고 균형 잡힌 맛이 특징인 중간 정도 무게감의 커피',40000,250,30,1,148);
INSERT INTO PRODUCT VALUES(13,3,'수마트라 250g','강렬하면서도 가득 찬 풍미, 흙 내음을 전해주는 무게감 있는 커피',40000,250,30,1,149);
INSERT INTO PRODUCT VALUES(14,3,'에스프레소 로스트 250g','풍부하고 조화로운 느낌으로 커피나무 에스프레소 음료의 기본이 되는 커피',40000,250,30,1,150);
INSERT INTO PRODUCT VALUES(15,3,'카페 베로나 250g','따뜻한 로맨스를 상상하게 해 주는 깊고 달콤한 맛의 커피',40000,250,30,1,151);
INSERT INTO PRODUCT VALUES(16,4,'그린 커피나무 모자','커피나무의 다크그린과 아이보리 컬러로 디자인한 그린 커피나무 모자입니다.',25000,55,30,1,152);
INSERT INTO PRODUCT VALUES(17,4,'블랙앤그린 실리콘 코스터 4p','블랙 커피나무 코스터 2개와 그린 커피나무 코스터 2개 그리고 케이스로 구성된 세트 상품입니다.',30000,990,30,1,153);
INSERT INTO PRODUCT VALUES(18,4,'커피나무 카드 키링','커피나무 전용 카드 키링입니다.',30000,30,30,1,154);
INSERT INTO PRODUCT VALUES(19,4,'커피나무 하우스 토트백','커피나무 클래식 컬러로 디자인된 토트백입니다.',40000,900,0,3,155);

--FILE_INFO
INSERT INTO FILE_INFO VALUES(1,'menu_drink_cold_brew_coffee_나이트로_바닐라_크림.jpg','menu_drink_cold_brew_coffee_나이트로_바닐라_크림.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(2,'menu_drink_cold_brew_coffee_나이트로_콜드_브루.jpg','menu_drink_cold_brew_coffee_나이트로_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(3,'menu_drink_cold_brew_coffee_돌체_콜드_브루.jpg','menu_drink_cold_brew_coffee_돌체_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(4,'menu_drink_cold_brew_coffee_바닐라_크림_콜드_브루.jpg','menu_drink_cold_brew_coffee_바닐라_크림_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(5,'menu_drink_cold_brew_coffee_여수_윤슬_헤이즐넛_콜드_브루.jpg','menu_drink_cold_brew_coffee_여수_윤슬_헤이즐넛_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(6,'menu_drink_cold_brew_coffee_오트_콜드_브루.jpg','menu_drink_cold_brew_coffee_오트_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(7,'menu_drink_cold_brew_coffee_제주_비자림_콜드_브루.jpg','menu_drink_cold_brew_coffee_제주_비자림_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(8,'menu_drink_cold_brew_coffee_콜드_브루.jpg','menu_drink_cold_brew_coffee_콜드_브루.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(9,'menu_drink_espresso_에스프레소_콘_파나.jpg','menu_drink_espresso_에스프레소_콘_파나.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(10,'menu_drink_espresso_에스프레소_마키아또.jpg','menu_drink_espresso_에스프레소_마키아또.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(11,'menu_drink_espresso_아이스_카페_아메리카노.jpg','menu_drink_espresso_아이스_카페_아메리카노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(12,'menu_drink_espresso_카페_아메리카노.jpg','menu_drink_espresso_카페_아메리카노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(13,'menu_drink_espresso_아이스_카라멜_마키아또.jpg','menu_drink_espresso_아이스_카라멜_마키아또.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(14,'menu_drink_espresso_카라멜_마키아또.jpg','menu_drink_espresso_카라멜_마키아또.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(15,'menu_drink_espresso_아이스_카푸치노.jpg','menu_drink_espresso_아이스_카푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(16,'menu_drink_espresso_카푸치노.jpg','menu_drink_espresso_카푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(17,'menu_drink_espresso_커피나무_돌체_라떼.jpg','menu_drink_espresso_커피나무_돌체_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(18,'menu_drink_espresso_아이스_커피나무_돌체_라떼.jpg','menu_drink_espresso_아이스_커피나무_돌체_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(19,'menu_drink_espresso_아이스_카페_라떼.jpg','menu_drink_espresso_아이스_카페_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(20,'menu_drink_espresso_카페_라떼.jpg','menu_drink_espresso_카페_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(21,'menu_drink_espresso_아이스_카페_모카.jpg','menu_drink_espresso_아이스_카페_모카.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(22,'menu_drink_espresso_아이스_화이트_초콜릿_모카.jpg','menu_drink_espresso_아이스_화이트_초콜릿_모카.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(23,'menu_drink_espresso_카페_모카.jpg','menu_drink_espresso_카페_모카.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(24,'menu_drink_espresso_화이트_초콜릿_모카.jpg','menu_drink_espresso_화이트_초콜릿_모카.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(25,'menu_drink_espresso_바닐라_플랫_화이트.jpg','menu_drink_espresso_바닐라_플랫_화이트.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(26,'menu_drink_espresso_커피나무_더블_샷.jpg','menu_drink_espresso_커피나무_더블_샷.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(27,'menu_drink_espresso_블론드_바닐라_더블_샷_마키아또.jpg','menu_drink_espresso_블론드_바닐라_더블_샷_마키아또.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(28,'menu_drink_espresso_아이스_블론드_바닐라_더블_샷_마키아또.jpg','menu_drink_espresso_아이스_블론드_바닐라_더블_샷_마키아또.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(29,'menu_drink_espresso_에스프레소.jpg','menu_drink_espresso_에스프레소.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(30,'menu_drink_frappuccino_에스프레소_프라푸치노.jpg','menu_drink_frappuccino_에스프레소_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(31,'menu_drink_frappuccino_자바_칩_프라푸치노.jpg','menu_drink_frappuccino_자바_칩_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(32,'menu_drink_frappuccino_카라멜_프라푸치노.jpg','menu_drink_frappuccino_카라멜_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(33,'menu_drink_frappuccino_화이트_초콜릿_모카_프라푸치노.jpg','menu_drink_frappuccino_화이트_초콜릿_모카_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(34,'menu_drink_frappuccino_제주_까망_크림_프라푸치노.jpg','menu_drink_frappuccino_제주_까망_크림_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(35,'menu_drink_frappuccino_제주_쑥떡_크림_프라푸치노.jpg','menu_drink_frappuccino_제주_쑥떡_크림_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(36,'menu_drink_frappuccino_제주_유기농_말차로_만든_크림_프라푸치노.jpg','menu_drink_frappuccino_제주_유기농_말차로_만든_크림_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(37,'menu_drink_frappuccino_초콜릿_크림_칩_프라푸치노.jpg','menu_drink_frappuccino_초콜릿_크림_칩_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(38,'menu_drink_frappuccino_피스타치오_아보카도_초콜릿_프라푸치노.jpg','menu_drink_frappuccino_피스타치오_아보카도_초콜릿_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(39,'menu_drink_frappuccino_화이트_타이거_프라푸치노.jpg','menu_drink_frappuccino_화이트_타이거_프라푸치노.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(40,'menu_drink_tea_민트_블렌드_티.jpg','menu_drink_tea_민트_블렌드_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(41,'menu_drink_tea_아이스_민트_블렌드_티.jpg','menu_drink_tea_아이스_민트_블렌드_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(42,'menu_drink_tea_아이스_얼_그레이_티.jpg','menu_drink_tea_아이스_얼_그레이_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(43,'menu_drink_tea_아이스_유스베리_티.jpg','menu_drink_tea_아이스_유스베리_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(44,'menu_drink_tea_아이스_유자_민트_티.jpg','menu_drink_tea_아이스_유자_민트_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(45,'menu_drink_tea_아이스_잉글리쉬_브렉퍼스트_티.jpg','menu_drink_tea_아이스_잉글리쉬_브렉퍼스트_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(46,'menu_drink_tea_아이스_제주_유기_녹차.jpg','menu_drink_tea_아이스_제주_유기_녹차.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(47,'menu_drink_tea_아이스_캐모마일_블렌드_티.jpg','menu_drink_tea_아이스_캐모마일_블렌드_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(48,'menu_drink_tea_아이스_히비스커스_블렌드_티.jpg','menu_drink_tea_아이스_히비스커스_블렌드_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(49,'menu_drink_tea_얼_그레이_티.jpg','menu_drink_tea_얼_그레이_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(50,'menu_drink_tea_유스베리_티.jpg','menu_drink_tea_유스베리_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(51,'menu_drink_tea_유자_민트_티.jpg','menu_drink_tea_유자_민트_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(52,'menu_drink_tea_잉글리쉬_브렉퍼스트_티.jpg','menu_drink_tea_잉글리쉬_브렉퍼스트_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(53,'menu_drink_tea_자몽_허니_블랙_티.jpg','menu_drink_tea_자몽_허니_블랙_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(54,'menu_drink_tea_제주_유기_녹차.jpg','menu_drink_tea_제주_유기_녹차.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(55,'menu_drink_tea_캐모마일_블렌드_티.jpg','menu_drink_tea_캐모마일_블렌드_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(56,'menu_drink_tea_히비스커스_블렌드_티.jpg','menu_drink_tea_히비스커스_블렌드_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(57,'menu_drink_tea_레드_파워_패션_티.jpg','menu_drink_tea_레드_파워_패션_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(58,'menu_drink_tea_아이스_자몽_허니_블랙_티.jpg','menu_drink_tea_아이스_자몽_허니_블랙_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(59,'menu_drink_tea_돌체_블랙_밀크_티.jpg','menu_drink_tea_돌체_블랙_밀크_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(60,'menu_drink_tea_말차_티라미수_라떼.jpg','menu_drink_tea_말차_티라미수_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(61,'menu_drink_tea_커피나무_클래식_밀크_티.jpg','menu_drink_tea_커피나무_클래식_밀크_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(62,'menu_drink_tea_아이스_돌체_블랙_밀크_티.jpg','menu_drink_tea_아이스_돌체_블랙_밀크_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(63,'menu_drink_tea_아이스_커피나무_클래식_밀크_티.jpg','menu_drink_tea_아이스_커피나무_클래식_밀크_티.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(64,'menu_drink_tea_아이스_얼_그레이_바닐라_티_라떼.jpg','menu_drink_tea_아이스_얼_그레이_바닐라_티_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(65,'menu_drink_tea_아이스_제주_유기농_말차로_만든_라떼.jpg','menu_drink_tea_아이스_제주_유기농_말차로_만든_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(66,'menu_drink_tea_아이스_차이_티_라떼.jpg','menu_drink_tea_아이스_차이_티_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(67,'menu_drink_tea_얼_그레이_바닐라_티_라떼.jpg','menu_drink_tea_얼_그레이_바닐라_티_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(68,'menu_drink_tea_제주_유기농_말차로_만든_라떼.jpg','menu_drink_tea_제주_유기농_말차로_만든_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(69,'menu_drink_tea_차이_티_라떼.jpg','menu_drink_tea_차이_티_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(70,'menu_drink_etc_drink_딸기_콜드폼_초콜릿.jpg','menu_drink_etc_drink_딸기_콜드폼_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(71,'menu_drink_etc_drink_시그니처_핫_초콜릿.jpg','menu_drink_etc_drink_시그니처_핫_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(72,'menu_drink_etc_drink_아이스_시그니처_초콜릿.jpg','menu_drink_etc_drink_아이스_시그니처_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(73,'menu_drink_etc_drink_아이스_티라미수_초콜릿.jpg','menu_drink_etc_drink_아이스_티라미수_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(74,'menu_drink_etc_drink_티라미수_초콜릿.jpg','menu_drink_etc_drink_티라미수_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(75,'menu_drink_etc_drink_플러피_판다_아이스_초콜릿.jpg','menu_drink_etc_drink_플러피_판다_아이스_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(76,'menu_drink_etc_drink_플러피_판다_핫_초콜릿.jpg','menu_drink_etc_drink_플러피_판다_핫_초콜릿.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(77,'menu_drink_etc_drink_딸기_콜드폼_딸기_라떼.jpg','menu_drink_etc_drink_딸기_콜드폼_딸기_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(78,'menu_drink_etc_drink_커피나무_슬래머.jpg','menu_drink_etc_drink_커피나무_슬래머.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(79,'menu_drink_etc_drink_스팀_우유.jpg','menu_drink_etc_drink_스팀_우유.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(80,'menu_drink_etc_drink_아이스_제주_까망_라떼.jpg','menu_drink_etc_drink_아이스_제주_까망_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(81,'menu_drink_etc_drink_우유.jpg','menu_drink_etc_drink_우유.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(82,'menu_drink_etc_drink_제주_까망_라떼.jpg','menu_drink_etc_drink_제주_까망_라떼.jpg','/fileStorage/drink/','jpg',null);
INSERT INTO FILE_INFO VALUES(83,'menu_food_bread_바질_토마토_크림치즈_베이글.jpg','menu_food_bread_바질_토마토_크림치즈_베이글.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(84,'menu_food_bread_탕종_블루베리_베이글.jpg','menu_food_bread_탕종_블루베리_베이글.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(85,'menu_food_bread_탕종_파마산_치즈_베이글.jpg','menu_food_bread_탕종_파마산_치즈_베이글.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(86,'menu_food_bread_탕종_플레인_베이글.jpg','menu_food_bread_탕종_플레인_베이글.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(87,'menu_food_bread_미니_클래식_스콘.jpg','menu_food_bread_미니_클래식_스콘.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(88,'menu_food_bread_클래식_스콘.jpg','menu_food_bread_클래식_스콘.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(89,'menu_food_bread_피넛_쑥_떡_스콘.jpg','menu_food_bread_피넛_쑥_떡_스콘.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(90,'menu_food_bread_거문_오름_크루아상.jpg','menu_food_bread_거문_오름_크루아상.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(91,'menu_food_bread_미니_리프_파이.jpg','menu_food_bread_미니_리프_파이.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(92,'menu_food_bread_바질_치즈_포카치아.jpg','menu_food_bread_바질_치즈_포카치아.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(93,'menu_food_bread_뺑_오_쇼콜라.jpg','menu_food_bread_뺑_오_쇼콜라.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(94,'menu_food_bread_스모크드_소시지_브레드.jpg','menu_food_bread_스모크드_소시지_브레드.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(95,'menu_food_bread_연유_밀크모닝.jpg','menu_food_bread_연유_밀크모닝.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(96,'menu_food_bread_오름_치즈_케이츄리.jpg','menu_food_bread_오름_치즈_케이츄리.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(97,'menu_food_bread_올래_미니_크루아상.jpg','menu_food_bread_올래_미니_크루아상.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(98,'menu_food_bread_주상절리_파이.jpg','menu_food_bread_주상절리_파이.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(99,'menu_food_bread_초콜릿_월넛_브레드.jpg','menu_food_bread_초콜릿_월넛_브레드.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(100,'menu_food_bread_하트_파이.jpg','menu_food_bread_하트_파이.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(101,'menu_food_bread_한_입에_쏙_치즈_꿀_볼.jpg','menu_food_bread_한_입에_쏙_치즈_꿀_볼.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(102,'menu_food_cake_7_레이어_가나슈_케이크.jpg','menu_food_cake_7_레이어_가나슈_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(103,'menu_food_cake_the_촉촉_초콜릿_생크림_케이크.jpg','menu_food_cake_the_촉촉_초콜릿_생크림_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(104,'menu_food_cake_꿀_고구마_생크림_케이크.jpg','menu_food_cake_꿀_고구마_생크림_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(105,'menu_food_cake_마스카포네_티라미수_케이크.jpg','menu_food_cake_마스카포네_티라미수_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(106,'menu_food_cake_바스크_치즈_케이크.jpg','menu_food_cake_바스크_치즈_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(107,'menu_food_cake_부드러운_생크림_카스텔라.jpg','menu_food_cake_부드러운_생크림_카스텔라.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(108,'menu_food_cake_부드러운_티라미수_롤.jpg','menu_food_cake_부드러운_티라미수_롤.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(109,'menu_food_cake_새코롬_한라봉_크림_케이크.jpg','menu_food_cake_새코롬_한라봉_크림_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(110,'menu_food_cake_슈크림_가득_바움쿠헨.jpg','menu_food_cake_슈크림_가득_바움쿠헨.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(111,'menu_food_cake_클래식_블루베리_치즈_케이크.jpg','menu_food_cake_클래식_블루베리_치즈_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(112,'menu_food_cake_당근_현무암_케이크.jpg','menu_food_cake_당근_현무암_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(113,'menu_food_cake_제주_녹차_생크림_롤.jpg','menu_food_cake_제주_녹차_생크림_롤.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(114,'menu_food_cake_제주_땅콩_생크림_롤.jpg','menu_food_cake_제주_땅콩_생크림_롤.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(115,'menu_food_cake_돔_피칸_타르트.jpg','menu_food_cake_돔_피칸_타르트.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(116,'menu_food_cake_마스카포네_티라미수.jpg','menu_food_cake_마스카포네_티라미수.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(117,'menu_food_cake_베어리스타_우유_생크림_케이크.jpg','menu_food_cake_베어리스타_우유_생크림_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(118,'menu_food_cake_블루베리_쿠키_치즈_케이크.jpg','menu_food_cake_블루베리_쿠키_치즈_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(119,'menu_food_cake_세븐_레이어_가나슈_케이크.jpg','menu_food_cake_세븐_레이어_가나슈_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(120,'menu_food_cake_청담스타_얼_그레이_밀크_케이크.jpg','menu_food_cake_청담스타_얼_그레이_밀크_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(121,'menu_food_cake_청담스타_오_허니_케이크.jpg','menu_food_cake_청담스타_오_허니_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(122,'menu_food_cake_크레이프_에멘탈_치즈_케이크.jpg','menu_food_cake_크레이프_에멘탈_치즈_케이크.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(123,'menu_food_sandwich_B.E.L.T.샌드위치.jpg','menu_food_sandwich_B.E.L.T.샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(124,'menu_food_sandwich_단호박_에그_샐러드_샌드위치.jpg','menu_food_sandwich_단호박_에그_샐러드_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(125,'menu_food_sandwich_당근_산도롱_샌드위치.jpg','menu_food_sandwich_당근_산도롱_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(126,'menu_food_sandwich_멜팅_치즈_베이컨_샌드위치.jpg','menu_food_sandwich_멜팅_치즈_베이컨_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(127,'menu_food_sandwich_바비큐_치킨_치즈_치아바타.jpg','menu_food_sandwich_바비큐_치킨_치즈_치아바타.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(128,'menu_food_sandwich_베이컨_치즈_토스트.jpg','menu_food_sandwich_베이컨_치즈_토스트.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(129,'menu_food_sandwich_브렉퍼스트_잉글리쉬_머핀.jpg','menu_food_sandwich_브렉퍼스트_잉글리쉬_머핀.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(130,'menu_food_sandwich_블랙_갈릭_에그_샌드위치.jpg','menu_food_sandwich_블랙_갈릭_에그_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(131,'menu_food_sandwich_에그에그_샌드위치.jpg','menu_food_sandwich_에그에그_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(132,'menu_food_sandwich_제주_녹차_베이컨_치즈_베이글.jpg','menu_food_sandwich_제주_녹차_베이컨_치즈_베이글.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(133,'menu_food_sandwich_제주_돼지_풀드포크_샌드위치.jpg','menu_food_sandwich_제주_돼지_풀드포크_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(134,'menu_food_sandwich_치즈_포크_커틀릿_샌드위치.jpg','menu_food_sandwich_치즈_포크_커틀릿_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(135,'menu_food_sandwich_치킨_클래식_샌드위치.jpg','menu_food_sandwich_치킨_클래식_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(136,'menu_food_sandwich_햄_루꼴라_올리브_샌드위치.jpg','menu_food_sandwich_햄_루꼴라_올리브_샌드위치.jpg','/fileStorage/food/','jpg',null);
INSERT INTO FILE_INFO VALUES(137,'product_mug_커피나무_하우스_머그_237ml.jpg','product_mug_커피나무_하우스_머그_237ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(138,'product_mug_커피나무_하우스_머그_355ml.jpg','product_mug_커피나무_하우스_머그_355ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(139,'product_mug_커피나무_하우스_머그_473ml.jpg','product_mug_커피나무_하우스_머그_473ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(140,'product_mug_그린_커피나무_도트_머그_237ml.jpg','product_mug_그린_커피나무_도트_머그_237ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(141,'product_mug_그린_커피나무_도트_머그_355ml.jpg','product_mug_그린_커피나무_도트_머그_355ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(142,'product_tumbler_나수_하우스_텀블러_355ml.jpg','product_tumbler_나수_하우스_텀블러_355ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(143,'product_tumbler_우디_하우스_텀블러_591ml.jpg','product_tumbler_우디_하우스_텀블러_591ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(144,'product_tumbler_콩코드_하우스_텀블러_473ml.jpg','product_tumbler_콩코드_하우스_텀블러_473ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(145,'product_tumbler_콩코드_하우스_텀블러_591ml.jpg','product_tumbler_콩코드_하우스_텀블러_591ml.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(146,'product_roasted_bean_에티오피아_250g.jpg','product_roasted_bean_에티오피아_250g.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(147,'product_roasted_bean_케냐_250g.jpg','product_roasted_bean_케냐_250g.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(148,'product_roasted_bean_하우스_블렌드_250g.jpg','product_roasted_bean_하우스_블렌드_250g.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(149,'product_roasted_bean_수마트라_250g.jpg','product_roasted_bean_수마트라_250g.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(150,'product_roasted_bean_에스프레소_로스트_250g.jpg','product_roasted_bean_에스프레소_로스트_250g.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(151,'product_roasted_bean_카페_베로나_250g.jpg','product_roasted_bean_카페_베로나_250g.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(152,'product_accessory_그린_커피나무_모자.jpg','product_accessory_그린_커피나무_모자.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(153,'product_accessory_블랙앤그린_실리콘_코스터_4p.jpg','product_accessory_블랙앤그린_실리콘_코스터_4p.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(154,'product_accessory_커피나무_카드_키링.jpg','product_accessory_커피나무_카드_키링.jpg','/fileStorage/product/','jpg',null);
INSERT INTO FILE_INFO VALUES(155,'product_accessory_커피나무_하우스_토트백.jpg','product_accessory_커피나무_하우스_토트백.jpg','/fileStorage/product/','jpg',null);


--사용자
INSERT INTO users (user_number, user_id, user_password, user_confirm_password, user_email, user_name, user_birth, user_zipcode, user_address, user_detail_address, is_member) VALUES (1, 'admin', 'admin', 'admin', null, '관리자', null, null, null, null, 2);
INSERT INTO users (user_number, user_id, user_password, user_confirm_password, user_email, user_name, user_birth, user_zipcode, user_address, user_detail_address, is_member) VALUES (2, 'user2', 'pass2', 'pass2', 'user2@email.com', '김태현', '19910202', '23456', '충청남도 천안시', '신부동', 0);
INSERT INTO users (user_number, user_id, user_password, user_confirm_password, user_email, user_name, user_birth, user_zipcode, user_address, user_detail_address, is_member) VALUES (3, 'user3', 'pass3', 'pass3', 'user3@email.com', '박상은', '19920303', '34567', '경기도 안성시', '공도읍', 1);
INSERT INTO users (user_number, user_id, user_password, user_confirm_password, user_email, user_name, user_birth, user_zipcode, user_address, user_detail_address, is_member) VALUES (4, 'user4', 'pass4', 'pass4', 'user4@email.com', '신현우', '19930404', '45678', '충청남도 천안시', '대흥동', 1);
INSERT INTO users (user_number, user_id, user_password, user_confirm_password, user_email, user_name, user_birth, user_zipcode, user_address, user_detail_address, is_member) VALUES (5, 'user5', 'pass5', 'pass5', 'user5@email.com', '오승헌', '19940505', '56789', '충청남도 천안시', '봉명동', 0);

--공지사항
INSERT INTO announcement (announcement_number, user_id, title, content, post_date, announcements_count) 
VALUES (1, 'admin', '새로운 기능 업데이트 안내', '우리 서비스의 새로운 기능에 대해 안내드립니다...', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 21);

INSERT INTO announcement (announcement_number, user_id, title, content, post_date, announcements_count) 
VALUES (2, 'admin', '시스템 점검 안내', '오는 주말 시스템 점검을 진행할 예정입니다...', TO_DATE('2024-01-03', 'YYYY-MM-DD'), 34);

INSERT INTO announcement (announcement_number, user_id, title, content, post_date, announcements_count) 
VALUES (3, 'admin', '휴무 안내', '다가오는 공휴일에는 서비스 운영을 중단합니다...', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 13);

INSERT INTO announcement (announcement_number, user_id, title, content, post_date, announcements_count) 
VALUES (4, 'admin', '신규 이벤트 시작', '신규 이벤트가 시작되었습니다. 많은 참여 부탁드립니다...', TO_DATE('2024-01-07', 'YYYY-MM-DD'), 25);

--faq
INSERT INTO faq (faq_number, user_id, question, answer, post_date, faqs_count)
VALUES (1, 'admin', '디지털 데이트 구매는 어떻게 하나요?', '디지털 데이트 구매 방법은 다음 링크를 참조해주세요 [구매 링크].', TO_DATE('2024-02-01', 'YYYY-MM-DD'), 0);

INSERT INTO faq (faq_number, user_id, question, answer, post_date, faqs_count)
VALUES (2, 'admin',  '쿠폰 코드 유지기간 만료 전 온라인을 방문할 수 있나요?', '쿠폰 코드의 유지기간이 만료되기 전에 온라인 방문이 가능합니다. 자세한 사항은 고객 서비스 센터에 문의해 주세요.', TO_DATE('2024-02-02', 'YYYY-MM-DD'), 15);

INSERT INTO faq (faq_number, user_id, question, answer, post_date, faqs_count)
VALUES (3, 'admin', '스토어 쿠폰이 발행된 지 얼마나 되었나요?', '스토어 쿠폰 발행일로부터 현재까지 X개월이 지났습니다. 유효기간은 발행일로부터 Y개월입니다.', TO_DATE('2024-02-03', 'YYYY-MM-DD'), 25);

INSERT INTO faq (faq_number, user_id, question, answer, post_date, faqs_count)
VALUES (4, 'admin', '어떻게 쿠폰 사용을 거부당했습니다. 사용 가능한가요?', '쿠폰 사용 거부 사항에 대해선 고객 서비스 센터로 문의를 주시면 상황을 확인 후 도와드리겠습니다.', TO_DATE('2024-02-04', 'YYYY-MM-DD'), 5);

--1:1상담
INSERT INTO customer_feedback (feedback_number, user_id, title, content, feedback_date, feedback_count)
VALUES (1, 'user1', '문의드립니다', '상품에 대해 문의가 있습니다', TO_DATE('2024-02-01', 'YYYY-MM-DD'), 0);

INSERT INTO customer_feedback (feedback_number, user_id, title, content, feedback_date, feedback_count)
VALUES (2, 'user3', '배송 지연', '주문한 상품이 아직 도착하지 않았습니다', TO_DATE('2024-02-02', 'YYYY-MM-DD'), 0);

INSERT INTO customer_feedback (feedback_number, user_id, title, content, feedback_date, feedback_count)
VALUES (3, 'user4', '환불 요청', '제품에 하자가 있어 환불을 요청합니다', TO_DATE('2024-02-03', 'YYYY-MM-DD'), 0);

INSERT INTO customer_feedback (feedback_number, user_id, title, content, feedback_date, feedback_count)
VALUES (4, 'user3', '배송 지연', '주문한 상품이 아직 도착하지 않았습니다', TO_DATE('2024-02-02', 'YYYY-MM-DD'), 0);

INSERT INTO customer_feedback (feedback_number, user_id, title, content, feedback_date, feedback_count)
VALUES (5, 'user4', '환불 언제', '환불 언제해주시는거에요?', TO_DATE('2024-02-03', 'YYYY-MM-DD'), 0);

--댓글
INSERT INTO feedback_response (response_number, feedback_number, user_id, response_content, response_date)
VALUES (1, 1, 'admin', '문의하신 내용에 대해 답변드립니다', TO_DATE('2024-02-01', 'YYYY-MM-DD'));

INSERT INTO feedback_response (response_number, feedback_number, user_id, response_content, response_date)
VALUES (2, 2, 'admin', '배송 지연에 대해 사과드립니다', TO_DATE('2024-02-02', 'YYYY-MM-DD'));

INSERT INTO feedback_response (response_number, feedback_number, user_id, response_content, response_date)
VALUES (3, 3, 'admin', '환불 절차를 안내드립니다', TO_DATE('2024-02-03', 'YYYY-MM-DD'));

--주문
INSERT INTO orders (order_number, user_id, order_date, total_price, delivery_address, shipping_fee, courier_name, tracking_number, order_status) 
VALUES (1, 'user3', TO_DATE('2024-02-01', 'YYYY-MM-DD'), 60000, '경기도 안성시', 2500, 'CJ대한통운', '', 1);

INSERT INTO orders (order_number, user_id, order_date, total_price, delivery_address, shipping_fee, courier_name, tracking_number, order_status) 
VALUES (2, 'user4', TO_DATE('2024-02-02', 'YYYY-MM-DD'), 30000, '충청남도 천안시', 2500, 'CJ대한통운', '', 1);

INSERT INTO orders (order_number, user_id, order_date, total_price, delivery_address, shipping_fee, courier_name, tracking_number, order_status) 
VALUES (3, 'user3', TO_DATE('2024-02-03', 'YYYY-MM-DD'), 170000, '경기도 수원시', 2500, 'CJ대한통운', '', 1);

INSERT INTO orders (order_number, user_id, order_date, total_price, delivery_address, shipping_fee, courier_name, tracking_number, order_status) 
VALUES (4, 'user4', TO_DATE('2024-02-04', 'YYYY-MM-DD'), 170000, '충청남도 천안시', 2500, 'CJ대한통운', '', 1);

-- 주문번호 1에 대한 주문 상세
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (1, 1, 1, 10000, 2);
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (2, 1, 12, 40000, 1);

-- 주문번호 2에 대한 주문 상세
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (1, 2, 18, 30000, 1);

-- 주문번호 3에 대한 주문 상세
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (1, 3, 10, 40000, 3);
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (2, 3, 3, 20000, 1);
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (3, 3, 17, 30000, 1);

-- 주문번호 4에 대한 주문 상세
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (1, 4, 5, 25000, 2);
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (2, 4, 11, 40000, 1);
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (3, 4, 19, 40000, 1);
INSERT INTO order_detail (order_detail_number, order_number, product_number, price, order_quantity) VALUES (4, 4, 14, 40000, 1);

--결제  1(신용카드), 2(휴대폰 결제), 3(무통장 입금)
INSERT INTO payment (payment_number, order_number, payment_method, payment_date) 
VALUES (1, 1, 1, TO_DATE('2024-02-01', 'YYYY-MM-DD'));

INSERT INTO payment (payment_number, order_number, payment_method, payment_date) 
VALUES (2, 2, 2, TO_DATE('2024-02-02', 'YYYY-MM-DD'));

INSERT INTO payment (payment_number, order_number, payment_method, payment_date) 
VALUES (3, 3, 3, TO_DATE('2024-02-03', 'YYYY-MM-DD'));

INSERT INTO payment (payment_number, order_number, payment_method, payment_date) 
VALUES (4, 4, 1, TO_DATE('2024-02-04', 'YYYY-MM-DD'));