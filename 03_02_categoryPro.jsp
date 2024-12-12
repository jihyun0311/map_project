<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.boardDAO"%>
<%@page import="project.board"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	request.setCharacterEncoding("UTF-8");
	String location = request.getParameter("location");
	String category = request.getParameter("category");
	int currentPage = 1;
	String sort = "date";
	response.sendRedirect("04_00_board.jsp?location=" + URLEncoder.encode(location, "UTF-8") + 
			"&category=" + URLEncoder.encode(category, "UTF-8") + "&currentPage=" + currentPage + 
			"&sort=" + URLEncoder.encode(sort, "UTF-8"));
%>
</body>
</html>