package project;
import java.sql.*;
import java.util.*;

public class boardDAO {
	private boardDAO() {};
	private static boardDAO instance = new boardDAO();
	public static boardDAO getInstance() {return instance;}
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Connection getConnection()throws Exception{
		String jdbcUrl = "jdbc:mysql://localhost:3306/project01?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "rootroot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		return conn;
	}
	
	//내가 선택한 지역 + 검색한 카테고리
	public ArrayList<board> getBoardList(String location, String seach, int startIndex, int onePageItem){
		ArrayList<board> boardList = new ArrayList<board>();
		try {
			conn = getConnection();
			String sql = " select b.* from board b join location_category l on b.category_id=l.location_id where l.location=? and l.category_name=? limit ?, ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			ps.setString(2, seach);
			ps.setInt(3, startIndex);
			ps.setInt(4, onePageItem);
			rs = ps.executeQuery();
			while(rs.next()) {
				board list = new board();
				list.setTitle(rs.getString("title"));
				list.setMemId(rs.getString("mem_id"));
				list.setContent(rs.getString("content"));
				list.setView(rs.getInt("view"));
				list.setLikes(rs.getInt("likes"));
				list.setComment(rs.getInt("comment"));
				list.setWriteDay(rs.getString("write_day"));
				list.setImg(rs.getString("img"));
				boardList.add(list);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			 if(conn != null) {try{conn.close();}catch(Exception e){}}
		    if(ps != null) {try{ps.close();}catch(Exception e){}}
		    if(rs != null) {try{rs.close();}catch(Exception e){}}
		}
		return boardList;
	}
	
	//정렬
	public ArrayList<board> getSortList(String howSort, int category_id, int startIndex, int onePageItem){
		ArrayList<board> sortList = new ArrayList<board>();
		try {
			conn = getConnection();
			String sql = "";
			if(howSort.equals("view")) {
				sql=" select * from board where category_id=? order by view desc limit ?, ? ";
			}else if(howSort.equals("like")) {
				sql=" select * from board where category_id=? order by likes desc limit ?, ?";
			}else if(howSort.equals("comment")) {
				sql=" select * from board where category_id=? order by comment desc limit ?, ?";
			}else{
				sql=" select * from board where category_id=? order by write_day desc limit ?, ?";
			}
			ps = conn.prepareStatement(sql);
			ps.setInt(1, category_id);
			ps.setInt(2, startIndex);
			ps.setInt(3, onePageItem);
			rs = ps.executeQuery();
			while(rs.next()) {
				board list = new board();
				list.setTitle(rs.getString("title"));
				list.setMemId(rs.getString("mem_id"));
				list.setContent(rs.getString("content"));
				list.setView(rs.getInt("view"));
				list.setLikes(rs.getInt("likes"));
				list.setComment(rs.getInt("comment"));
				list.setWriteDay(rs.getString("write_day"));
				list.setImg(rs.getString("img"));
				sortList.add(list);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			 if(conn != null) {try{conn.close();}catch(Exception e){}}
		    if(ps != null) {try{ps.close();}catch(Exception e){}}
		    if(rs != null) {try{rs.close();}catch(Exception e){}}		}
		return sortList;
	}
	
	//id가져오기
	public int getCategoryId(String location, String category) {
		int categoryId = 0;
		try {
			conn = getConnection();
			String sql = " select location_id from location_category where location=? and category_name=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			ps.setString(2, category);
			rs = ps.executeQuery();
			if(rs.next()) {
				categoryId = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			 if(conn != null) {try{conn.close();}catch(Exception e){}}
		    if(ps != null) {try{ps.close();}catch(Exception e){}}
		    if(rs != null) {try{rs.close();}catch(Exception e){}}		}
		return categoryId;
	}
	
	//전체 개수
	public int getAllCount(String location, String category){
		int co = 0;
		try {
			conn = getConnection();
			String sql = " select location_id from location_category where location=? and category_name=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			ps.setString(2, category);
			rs = ps.executeQuery();
			int num = 0;
			if(rs.next()) {
				num = rs.getInt(1);
			}
			if(num!=0) {
				sql = " select count(*) from board where category_id=? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, num);
				rs = ps.executeQuery();
				if(rs.next()) {
					co = rs.getInt(1);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			 if(conn != null) {try{conn.close();}catch(Exception e){}}
		    if(ps != null) {try{ps.close();}catch(Exception e){}}
		    if(rs != null) {try{rs.close();}catch(Exception e){}}
		}
		return co;
	}
}
