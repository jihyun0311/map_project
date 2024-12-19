CREATE DATABASE PROJECT01;
use PROJECT01;

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
('종로/중구/용산', '밥집', 'img/food.jpeg'),
('종로/중구/용산', '카페', 'img/cafe.jpg'),
('종로/중구/용산', '공원', 'img/park.jpeg'),
('종로/중구/용산', '반려동물카페', 'img/petcafe.png'),
('종로/중구/용산', '백화점', 'img/store.jpg'),
('종로/중구/용산', '영화관', 'img/movie.jpg'),
('종로/중구/용산', '헬스장', 'img/fitness.jpg'),
('종로/중구/용산', '병원', 'img/hospital.jpg'),
('은평/서대문/마포', '밥집', 'img/food.jpeg'),
('성북/강북/도봉/노원', '밥집', 'img/food.jpeg'),
('강남/서초/송파/강동', '밥집', 'img/food.jpeg'),
('관악/동작/금천/영등포', '밥집', 'img/food.jpeg'),
('강서/구로/양천', '밥집', 'img/food.jpeg'),
('중랑/동대문/광진/성동', '밥집', 'img/food.jpeg');

insert into member values
('지현', 1, '지현', '여', '2000-10-02', 25, '동작구 30-1', '010-1111-1111', '111@111.com'),
('시녕', 2, '시녕', '여', '2001-05-21', 24, '서초구 27-31', '010-2222-2222', '222@222.com'),
('형남', 3, '형남', '남', '2002-01-23', 23, '부평구 31-8', '010-3333-3333', '333@333.com'),
('4', 4, '김땡떙', '남', '1999-12-18', 26, '영등포구 70-11', '010-4444-4444', '444@444.com');

insert into board (title, mem_id, content, img, category_id) values
('당곡역 쿠우쿠우를 가보았습니다', '지현', '음~ 구슬아이스크림 존맛^^~~ 휴무는 없엉', null, 12),
('종로역 불타는 곱창', '시녕', '느끼... 위생이 좀 별루인듯.....', '불타는곱창.jpeg', 1),
('안국역 - 인사동마늘보쌈!!!!!', '형남', '보쌈의 맛을 마늘이 잡아줘서 좋아요. 주차장은 x', '인사동마늘보쌈.jpeg', 1),
('마포-바다회사랑', '4', '회사와 함께 아닙니다. 회 사랑 맞습니다 하핫', '회사.jpeg', 9),
('빌라 더 다이닝', '4', '첫 다이닝 성공적. 가격도 오만원 정도라 괜춘한듯', '더빌라.jpeg', 9),
('경복식당 후기', '형남', '정겨운 밥집을 먹고싶다면 공릉역 경복식당 가보세요. 골목식당도 나왔어요. 백반 제육 맛있고 월요일 휴무, 8시까지래요.', 'img/경복식당.jpeg', 10),
('성복 횟집은 남해바다마차로', '시녕', '회는 무조건 여가가세요!!!!! 존맛입니다 휴무x', '남해바다.jpeg', 10),
('서초 돈까스는 앞으로 긴자료코', '지현', '두툼한 연어보세요 대박임', '긴자.jpeg', 11),
('순남시래기', '시녕', '시래기 맛집 찾았따!!!!!! 강남 시래기는 앞으로 여깁니다! 월욜은 휴무~!', null	, 11),
('항동-유메카츠', '형남', '연중무휴, 11:00~20:30(20:00 라시트오더), 맛은 쏘쏘', '유메카츠.png', 13),
('마곡 맛집 추천', '지현', '쌀국수는 에머이 가세요오오오오ㅇ오ㅗ옹오 마곡나루역 바로 앞! 12시까지 해요', '에머이.jpeg', 13),
('요즘 핫플 도톰!!!!', '4', '사가정역 도보2분 돼지구이집 도톰 쉬는날 없다! 밤 11시까지 영업!!', '도톰.png', 14),
('건대 양꼬치집 추천', '시녕', '건대 양꼬치는 다른 곳 보지도 말고 해란 양꼬치', '해란.jpeg', 14),
('신림 십원집...', '지현', '상추먹다가 달팽이 나와써용.... 신선한가바요.....', '십원.jpeg', 12),
('노량진은 수산시장~(이레상회)', '지현', '회가 살아있써요...!!!', '이레.jpeg', 12),
('몽탄 방송 출연 다수 맛집.', '시녕', '삼각지역 도보1분, 맛있는 녀석들, 전참시, 줄서는 식당 등 출연한 우대갈비 맛집', null, 1),
('용산역 예쁘고 맛있는 레스토랑 추천', '시녕', '독채가 있는 식당. 메종루블랑 추천합니다', '메종루블랑.jpeg', 1),
('~~아이오유~~ 믿고 가보세요오오오오오오오오', '지현', '맛있어용', null, 1),
('한남 방앗간', '시녕', '맛있따', null, 1),
('삼각지주식', '형남', '굳', null, 1),
('원효굴찜', '지현', '굳', null, 1),
('디라이프스타일키친 광화문', '지현', '굳', null, 1),
('닥터로빈', '시녕', '굳', null, 1),
('은성한정식', '4', '굳', null, 1),
('살롱순라 서순라길점', '형남', '굳', null, 1),
('양연화로 종로직영점', '4', '굳', null, 1),
('종로3가 장군굴보쌈', '4', '굳', null, 1),
('게장 추천 - 순미네 행복게장 동대문점', '4', '굳', null, 1),
('pasta ta ta', '지현', '굳', null, 1),
('고매식당', '시녕', '굳', null, 1),
('콸콸', '형남', '굳', null, 1),
('이름부터 믿음직한 예성회관한우곰탕', '4', '굳', null, 1),
('디핀', '지현', '굳', null, 1),
('을지다락', '시녕', '굳', null, 1),
('명동교자 본점', '형남', '굳', null, 1),
('정원레스토랑 어반가든', '4', '굳', null, 1),
('란주칼면', '시녕', '굳', null, 1),
('덕수정', '지현', '굳', null, 1),
('화포식당 한남점 추천 후기!', '형남', '굳', null, 1),
('쌤쌤쌤', '지현', '굳', null, 1),
('시옥 삼각지점', '4', '굳', null, 1),
('화로 이태원점', '4', '굳', null, 1),
('미토', '시녕', '굳', null, 1),
('열정도고깃집', '시녕', '굳', null, 1),
('먼치', '형남', '굳', null, 1),
('파운드그라운드', '4', '굳', null, 1),
('고청담 광화문 디타워점', '지현', '굳', null, 1),
('육랩 종로점', '지현', '굳', null, 1),
('부촌육회 본점', '시녕', '굳', null, 1),
('하얀고래 종각', '4', '굳', null, 1),
('놉스 서울역점', '형남', '굳', null, 1),
('황산 종로점', '4', '굳', null, 1);

update board set view=10, likes=3, comment=1 where board_id=3;
update board set view=5, likes=1 where board_id=17;
update board set view=16, likes=9, comment=5 where board_id=18;
update board set view=13, likes=3, comment=9 where board_id=2;
update board set view=9, likes=5, comment=2 where board_id=16;
update board set view=15, likes=11, comment=3 where board_id=28;
update board set view=8, likes=1, comment=4 where board_id=32;
update board set view=11, likes=7, comment=4 where board_id=33;
update board set view=3, likes=1 where board_id=39;
insert into board (title, mem_id, content, view, likes, comment, category_id) values
('미트볼라운지 한남본점', '형남', '굳', 5, 1, 2, 1),
('샤브샤브 맛집 마제스키야키~', '지현', '굳', 3, 0, 0, 1),
('종각역 돼지고기 비추 후기 ㅠㅠ', '4','굳', 11, 2, 7, 1),
('양복점 용산점', '지현', '굳', 6, 2, 2, 1);
insert into board (title, mem_id, content, view, likes, comment, category_id) values
('고기는 언제나 "녹지" 종로직영점에서', '형남', '굳', 5, 1, 2, 1),
('기러기둥지 익선동', '지현', '굳', 3, 0, 0, 1),
('17년 동안 사랑받은 히말라야 종각점^^', '4','굳', 11, 2, 7, 1),
('반기다', '시녕', '굳', 2, 1, 0, 1),
('은성 한정식', '지현', '굳', 1, 0, 0, 1),
('특이한 튀김족발이 있는 국찌족발!', '4', '굳', 6, 1, 1, 1),
('온천집(미나리육전 들어보셨나요??)', '시녕', '굳', 13, 9, 2, 1),
('춘배가 구워주는 "고기꾼김춘배 종로직영점"', '형남', '굳', 3, 2, 0, 1),
('충무로역 맛있는 식당 top10!!', '지현', '굳', 14, 5, 9, 1),
('대청마루', '4', '굳', 4, 0, 0, 1);
create table admin (
	admin_id varchar(50),
    admin_pw varchar(50),
    log_check boolean
);
insert into admin values("admin" , "admin1234" , true); 

CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    board_id INT NOT NULL,
    mem_id INT NOT NULL
);

INSERT INTO likes (board_id, mem_id) VALUES (2, 1);
INSERT INTO likes (board_id, mem_id) VALUES (3, 1);

create table message(
	sender varchar(10),
    receiver varchar(10),
    content varchar(200),
    subject varchar(50),
    send_date datetime,
    num int primary key AUTO_INCREMENT
);
insert into message(sender, receiver, content, subject, send_date) values
('1', '2' , '잘부탁드립니다', '안녕하세요', '2024-12-12 09:34:21'),
('2', '3' , '아우배불러', '내일도시락은?',   '2024-12-15 09:34:21'),
('3', '1' , '잠좀자고싶다', '밤12시',  '2024-12-16 09:34:21');

select * from message;
select * from likes;
select * from member;
select * from LOCATION_CATEGORY;
select * from board;
select * from admin;