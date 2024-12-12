<%@page import="project.categoryDAO"%>
<%@page import="project.category"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="03_00_category.css" rel="stylesheet">
</head>
<body>
<%
	String location = request.getParameter("location");
	ArrayList<category> list = categoryDAO.getInstance().getCategoryList(location);
 %>
  <div class="main">
    <div class="main-padd">
      <div class="location"><h3><%=location %></h3></div>
      <br><br>
      <form action="03_02_categoryPro.jsp">
        <div class="board-list">
           <table width="100%">
              <%for(int i = 0; i<list.size(); i++){%>
              <%if(i%3==0){ %>
              	<tr class="category-tr">
              <%} %>
                  <td class="category-item">
                  <button class="category-btn" name="category" value="<%=list.get(i).getCategoryName() %>">
                  <img src="<%=list.get(i).getCategoryImg().trim() %>" width="250px" height="180px" class="item-img"><br>
                  <p class="item-name"><%=list.get(i).getCategoryName() %></p></button></td>
              <%if(i%3==2 || list.size()-1==i){ %>
                 </tr>
               <%} %>
          <%}%>
          </table>
        </div>
        <input type="hidden" value="<%=location %>" name="location">
       <%--  <input type="hidden" value="<%=list.get(i).getCategoryName() %>" name="category"> --%>
      </form>
    </div>
  </div>
</body>
</html>