CREATE DATABASE dsaghjff;
use dsaghjff;

CREATE TABLE LOCATION_CATEGORY (
LOCATION_ID INT AUTO_INCREMENT PRIMARY KEY,
LOCATION VARCHAR(50),
CATEGORY_NAME VARCHAR(50),
CATEGORY_IMG VARCHAR(50));

CREATE TABLE BOARD (
BOARD_ID INT AUTO_INCREMENT PRIMARY KEY,
TITLE VARCHAR(200),
mem_id varchar(10),
CONTENT TEXT,
VIEW INT DEFAULT 0,
LIKES INT DEFAULT 0,
COMMENT INT DEFAULT 0,
WRITE_DAY DATETIME DEFAULT NOW(),
img varchar(50) null,
CATEGORY_ID INT,
FOREIGN KEY (CATEGORY_ID) REFERENCES LOCATION_CATEGORY(LOCATION_ID) ON DELETE CASCADE);

create table member (
id varchar(10),
pw varchar(30),
name varchar(10),
gender varchar(10),
birth date,
age int(3),
address varchar(30),
phone varchar(20),
email varchar(30));

insert into location_category (location, category_name, category_img) value
('종로/중구/용산', '밥집', '#'),
('은평/서대문/마포', '밥집', '#'),
('성북/강북/도봉/노원', '밥집', '#'),
('강남/서초/송파/강동', '밥집', '#'),
('관악/동작/금천/영등포', '밥집', '#'),
('강서/구로/양천', '밥집', '#'),
('중랑/동대문/광진/성동', '밥집', '#');

insert into member values
(1, 1, '지현', '여', '2000-10-02', 25, '동작구 30-1', '010-1111-1111', '111@111.com'),
(2, 2, '시녕', '여', '2001-05-21', 24, '서초구 27-31', '010-2222-2222', '222@222.com'),
(3, 3, '형남', '남', '2002-01-23', 23, '부평구 31-8', '010-3333-3333', '333@333.com'),
(4, 4, '김땡떙', '남', '1999-12-18', 26, '영등포구 70-11', '010-4444-4444', '444@444.com');

insert into board (title, mem_id, content, img, category_id) values
('당곡역 쿠우쿠우를 가보았습니다', '1', '음~ 구슬아이스크림 존맛^^~~ 휴무는 없엉', null, 5),
('종로역 불타는 곱창', '2', '느끼... 위생이 좀 별루인듯.....', '불타는곱창.jpeg', 1),
('안국역 - 인사동마늘보쌈', '3', '보쌈의 맛을 마늘이 잡아줘서 좋아요. 주차장은 x', '인사동마늘보쌈.jpeg', 1),
('마포-바다회사랑', '4', '회사와 함께 아닙니다. 회 사랑 맞습니다 하핫', '회사.jpeg', 2),
('빌라 더 다이닝', '4', '첫 다이닝 성공적. 가격도 오만원 정도라 괜춘한듯', '더빌라.jpeg', 2),
('경복식당 후기', '3', '정겨운 밥집을 먹고싶다면 공릉역 경복식당 가보세요. 골목식당도 나왔어요. 백반 제육 맛있고 월요일 휴무, 8시까지래요.', '경복식당.jpeg', 3),
('성복 횟집은 남해바다마차로', '2', '회는 무조건 여가가세요!!!!! 존맛입니다 휴무x', '남해바다.jpeg', 3),
('서초 돈까스는 앞으로 긴자료코', '1', '두툼한 연어보세요 대박임', '긴자.jpeg', 4),
('순남시래기', '2', '시래기 맛집 찾았따!!!!!! 강남 시래기는 앞으로 여깁니다! 월욜은 휴무~!', null	, 4),
('항동-유메카츠', '3', '연중무휴, 11:00~20:30(20:00 라시트오더), 맛은 쏘쏘', '유메카츠.png', 6),
('마곡 맛집 추천', '1', '쌀국수는 에머이 가세요오오오오ㅇ오ㅗ옹오 마곡나루역 바로 앞! 12시까지 해요', '에머이.jpeg', 6),
('요즘 핫플 도톰!!!!', '4', '사가정역 도보2분 돼지구이집 도톰 쉬는날 없다! 밤 11시까지 영업!!', '도톰.png', 7),
('건대 양꼬치집 추천', '2', '건대 양꼬치는 다른 곳 보지도 말고 해란 양꼬치', '해란.jpeg', 7),
('신림 십원집...', '1', '상추먹다가 달팽이 나와써용.... 신선한가바요.....', '십원.jpeg', 5),
('노량진은 수산시장~(이레상회)', '3', '회가 살아있써요...!!!', '이레.jpeg', 5);

select * from member;
select * from LOCATION_CATEGORY;
select * from board;