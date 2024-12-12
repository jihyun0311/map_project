<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.boardDAO"%>
<%@page import="project.board"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="04_00_board.css" rel="stylesheet">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String location = request.getParameter("location");
	String category = request.getParameter("category");
	String sort = request.getParameter("sort");
	ArrayList<board> list;
	int category_id = boardDAO.getInstance().getCategoryId(location, category);
	int totalItem = boardDAO.getInstance().getAllCount(location, category); //전체몇개?
	int currentPage = request.getParameter("currentPage")!= null ? currentPage = Integer.parseInt(request.getParameter("currentPage")) : 1; //현재페이지
	int onePageItem = 10; //한 페이지에 몇개?
	int startIndex = ((currentPage-1)*onePageItem); //페이지 시작인덱스(0)
	int endIndex = Math.min(startIndex + onePageItem -1, totalItem); //페이지 마지막인덱스(9)
	int totalPage = (int)Math.ceil((double)totalItem/onePageItem); //총 몇페이지?
	int showPageNum = 5; //한페이지에 보여줄 번호개수
	int startPageNum = ((currentPage-1)/showPageNum)*showPageNum+1; //시작페이지번호
	int endPageNum = Math.min(startPageNum+showPageNum-1, totalPage);//마지막페이지번호

	if(sort!=null){
		board board = new board();
		list = boardDAO.getInstance().getSortList(sort, category_id, startIndex, onePageItem);
	}else{
		board board = new board();
		list = boardDAO.getInstance().getBoardList(location, category, startIndex, onePageItem);
	}
	System.out.println(location + " " + category);
%>
  <div class="main">
    <div class="main-padd">
      <div class="top">
        <div class="location"><%=location%> &nbsp; &nbsp; 
        <a href="03_00_category.jsp">카테고리 이동</a></div>
		
		<form action="04_02_boardPro.jsp" method="post" id="boardForm">
        <div class="sort-div">
          <select id="selec">
            <option class="sort-opt" value="date"<%= "date".equals(request.getParameter("sort")) ? "selected" : "" %>>최근순</option>
            <option class="sort-opt" value="view"<%= "view".equals(request.getParameter("sort")) ? "selected" : "" %>>조회수</option>
            <option class="sort-opt" value="comment"<%= "comment".equals(request.getParameter("sort")) ? "selected" : "" %>>댓글수</option>
            <option class="sort-opt" value="like"<%= "like".equals(request.getParameter("sort")) ? "selected" : "" %>>좋아요수</option>
          </select>
        </div>
        <input type="hidden" name="sort" id="sort">
        	<input type="hidden" name="category_id" value="<%=category_id %>">
      	<input type="hidden" name="category" value="<%=category %>">
      	<input type="hidden" name="location" value="<%=location %>">
      </form>
      </div>
      <div class="table">
          <table border="1" width="100%">
            <tr align="center">
              <th width="80px">번호</th>
              <th class="table-title">제목</th>
              <th width="150px">아이디</th>
              <th width="150px">작성일</th>
              <th width="80px">조회수</th>
              <th width="80px">댓글수</th>
              <th width="80px">좋아요수</th>
            </tr>
            <%for(int i = 0; i<list.size(); i++){%>
              <tr align="center">
                <td width="80px"><%=i+1%></td>
                <td class="table-title"><a href="#"><%=list.get(i).getTitle()%></a></td>
                <td width="150px"><%=list.get(i).getMemId()%></td>
                <td width="150px"><%=list.get(i).getWriteDay()%></td>
                <td width="80px"><%=list.get(i).getView()%></td>
                <td width="80px"><%=list.get(i).getComment()%></td>
                <td width="80px"><%=list.get(i).getLikes()%></td>
              </tr>
            <%}%>
          </table>
      </div>
      <div class="paging">
      <%
      	if(startPageNum > showPageNum){%>
      		[<a href="04_00_board.jsp?currentPage=<%=startPageNum-showPageNum %>&sort=<%= sort %>&location=<%= URLEncoder.encode(location, "UTF-8") %>
      		&category=<%= URLEncoder.encode(category, "UTF-8") %>&category_id=<%= category_id %>">이전</a>]
      <%} %>
      <%
      	for(int i = startPageNum; i<=endPageNum; i++){%>
      		 [<a href="04_00_board.jsp?currentPage=<%= i %>&sort=<%= sort %>&location=<%= URLEncoder.encode(location, "UTF-8") %>
      		 &category=<%= URLEncoder.encode(category, "UTF-8") %>&category_id=<%= category_id %>"><%= i %></a>]
      <%} %>
      <%
      	if(endPageNum < totalPage){%>
      		[<a href="04_00_board.jsp?currentPage=<%=endPageNum + 1 %>&sort=<%= sort %>&location=<%= URLEncoder.encode(location, "UTF-8") %>
      		&category=<%= URLEncoder.encode(category, "UTF-8") %>&category_id=<%= category_id %>">다음</a>]
      <%}System.out.println(currentPage); %>
      </div>
    </div>
  </div>
  <script src="04_01_board.js"></script>
</body>
</html>