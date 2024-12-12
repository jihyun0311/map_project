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
<%
	request.setCharacterEncoding("UTF-8");
	String sort = request.getParameter("sort");
	String location = request.getParameter("location");
	String category = request.getParameter("category");
	int category_id = boardDAO.getInstance().getCategoryId(location, category);
	
	response.sendRedirect("04_00_board.jsp?sort=" + URLEncoder.encode(sort, "UTF-8") + "&category=" + URLEncoder.encode(category, "UTF-8") + "&location=" + URLEncoder.encode(location, "UTF-8") + "&category_id=" + category_id);
%>
</body>
</html>