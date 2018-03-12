package controller.cjh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import controller.cjh.DataRoomDTO;


public class DataRoomDAO {
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public DataRoomDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT") + "/jdbc/jsp");
			conn = source.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			// 커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}////////////////////////////
	
	public List<DataRoomDTO> selectList() {
		List list = new Vector();
		
		String sql="SELECT * FROM NORMALMEMBER";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataRoomDTO dto = new DataRoomDTO();
				dto.setReservation(rs.getString(7));
				dto.setMileage(rs.getString(6));
				dto.setGrade(rs.getString(5));
				dto.setAge(rs.getString(4));
				dto.setGender(rs.getString(3));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(1));
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
	}////////////////////////////
	
	
	// 전체 레코드수 얻기용]
	public int getTotalRecordCount() {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM NORMALMEMBER";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return total;
	}////////////
	
	
	
		
}
