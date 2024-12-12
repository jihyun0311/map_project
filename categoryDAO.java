package project;
import java.sql.*;
import java.util.*;

public class categoryDAO {
	private categoryDAO() {};
	private static categoryDAO instance = new categoryDAO();
	public static categoryDAO getInstance() {return instance;}
	
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
	
	//내가 선택한 지역의 카테고리들 담은 배열
	public ArrayList<category> getCategoryList(String location){
		ArrayList<category> categoryList = new ArrayList<category>();
		try {
			conn = getConnection();
			String sql = " select * from location_category where location=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			rs = ps.executeQuery();

			while(rs.next()) {
				category list = new category();
				list.setCategoryName(rs.getString("category_name"));
				list.setLocatioId(rs.getInt("location_id"));
				list.setLocation(location);
				list.setCategoryImg(rs.getString("category_img"));
				categoryList.add(list);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		    if(conn != null) {try{conn.close();}catch(Exception e){}}
		    if(ps != null) {try{ps.close();}catch(Exception e){}}
		    if(rs != null) {try{rs.close();}catch(Exception e){}}
		}
		return categoryList;
	}
}
