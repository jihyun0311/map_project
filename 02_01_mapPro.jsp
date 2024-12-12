<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
System.out.println(name);
String location = "";
if(name.equals("종로구") || name.equals("중구") || name.equals("용산구")){
	location = "종로/중구/용산";
}else if(name.equals("은평구") || name.equals("서대문구") || name.equals("마포구")){
	location = "은평/서대문/마포";
}else if(name.equals("성북구") || name.equals("강북구") || name.equals("도봉구") || name.equals("노원구")){
	location = "성북/강북/도봉/노원";
}else if(name.equals("강남구") || name.equals("서초구") || name.equals("송파구") || name.equals("강동구")){
	location = "강남/서초/송파/강동";
}else if(name.equals("관악구") || name.equals("동작구") || name.equals("금천구") || name.equals("영등포구")){
	location = "관악/동작/금천/영등포";
}else if(name.equals("강서구") || name.equals("구로구") || name.equals("양천구")){
	location = "강서/구로/양천";
}else {location = "중랑/동대문/광진/성동";}

response.sendRedirect("03_00_category.jsp?location="+URLEncoder.encode(location, "UTF-8"));
%>
</body>
</html>