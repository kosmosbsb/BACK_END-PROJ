package controller.sjh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;
import controller.lmy.DataRoomDTO;
import model.BbsDTO;


public class SjhDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public SjhDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/jsp");
			conn = source.getConnection();
		} 
		catch (NamingException e) {e.printStackTrace();} 
		catch (SQLException e) {e.printStackTrace();}
	
	}///DataRoomDAO
	
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			// 커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}////////////////////////////
	
	//list
	public List<SjhDTO> selectList() {
		List <SjhDTO> list= new Vector<SjhDTO>();
		
		String sql="select category, title, name, postdate from SERVICEINFO_NORMALINFO ";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				SjhDTO dto = new SjhDTO();				
//				System.out.println(rs.getString(1));
//				System.out.println(rs.getString(2));
//				System.out.println(rs.getString(3));
//				System.out.println(rs.getDate(4));
				dto.setCategory(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPostdate(rs.getDate(4));						
				
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}////////////////////////////
	
	public SjhDTO selectOne(String key) {
		SjhDTO dto=null;
		String sql="SELECT * FROM serviceinfo_nomalinfo WHERE no =?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new SjhDTO();								
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));				
				dto.setPostdate(rs.getDate(2));							
				dto.setName(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}//////////////////////////////


}
