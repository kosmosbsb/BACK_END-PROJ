package controller.psh;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import controller.cjh.DataRoomDTO;
import controller.psy.PsyDTO;
import model.BbsDTO;

public class FCMTokenDAO {

	// 멤버 변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자
	public FCMTokenDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT") + "/jdbc/jsp");
			conn = source.getConnection();
		}
		catch (NamingException e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 자원 반납용
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} 
		catch (Exception e) {}
	}// close()
	
	public String getUserToken(String id) {
		
		String userToken = null;
		String sql = "SELECT TOKEN FROM FCM_TOKEN WHERE ID=? ORDER BY TOKEN_INDEX DESC";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			rs.next(); // ORDER BY TOKEN_INDEX DESC 요렇게 정렬된 것 중에서 첫번째 것이 가장 최신 토큰!
			userToken = rs.getString(1);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return userToken;
	}
	
}
