<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="01_00_main.css" rel="stylesheet">
</head>
<body>
<%
	String log_id = (String)session.getAttribute("log_id");
	log_id = null;
%>
  <div class="main_container">
    <div class="top">
      <a href="01_00_main.jsp"><img src="#" alt="미니로고" class="top-logo"></a>
      <%if(log_id == null){%>
        <ul class="header-top-list">
          <li><a href="로그인페이지" class="top-list">로그인</a></li>
          <li><a href="회원가입페이지" class="top-list">회원가입</a></li>
          <li><a href="고객센터페이지" class="top-list">고객센터</a></li>
        </ul>
        <%}else{%>
          <ul class="header-top-list">
            <li><p class="top-list"><%=log_id%>님</p></li>
            <li><a href="마이페이지" class="top-list">마이페이지</a></li>
            <li><a href="고객센터페이지" class="top-list">고객센터</a></li>
          </ul>
        <%}%>
    </div>

    <form action="03_02_categoryPro.jsp">
      <div class="main-mid">
        <button class="area" id="areaBtn" type="button">지역 선택</button>
        <ul id="area-list" style="display: none;">
          <li class="area-item" data-short="종/중/용" value="종로/중구/용산">종로구, 중구, 용산구</li>
          <li class="area-item" data-short="은/서/마" value="은평/서대문/마포">은평구, 서대문구, 마포구</li>
          <li class="area-item" data-short="성/강/도/노" value="성북/강북/도봉/노원">성북구, 강북구, 도봉구, 노원구</li>
          <li class="area-item" data-short="강/서/송/강" value="강남/서초/송파/강동">강남구, 서초구, 송파구, 강동구</li>
          <li class="area-item" data-short="관/동/금/영" value="관악/동작/금천/영등포">관악구, 동작구, 금천구, 영등포구</li>
          <li class="area-item" data-short="강/구/양" value="강서/구로/양천">강서구, 구로구, 양천구</li>
          <li class="area-item" data-short="중/동/광/성" value="중랑/동대문/광진/성동">중랑구, 동대문구, 광진구, 성동구</li>
        </ul>
        <input type="hidden" name="location" id="location-input">
        <div class="search-container">
          <input type="text" placeholder="카테고리를 입력해주세요!" id="search-box" name="category">
          <button type="submit" class="search-btn">검색</button>
        </div>
      </div>
    </form>

    <div class="container main-bottom">
      <p style="color: white;">
        인기 검색어
      </p>
      <ul class="recommend">
        <li><a href="#" class="recommend-item">밥집</a></li>
        <li><a href="#" class="recommend-item">카페</a></li>
        <li><a href="#" class="recommend-item">헬스장</a></li>
        <li><a href="#" class="recommend-item">병원</a></li>
        <li><a href="#" class="recommend-item">애견미용</a></li>
        <li><a href="#" class="recommend-item">학교</a></li>
      </ul>
    </div>
	<div class="map-btn-con">
  	<button class="map-btn" onclick="location='02_00_map.jsp'">지도보기</button>
	</div>
  </div>

  <script src="01_00_main.js"></script>
</body>
</html>