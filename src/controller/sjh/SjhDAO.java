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
		
		String sql="select no, category, title, name, postdate from SERVICEINFO_NORMALINFO ";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				SjhDTO dto = new SjhDTO();			
				
				dto.setNo(rs.getString(1));
				dto.setCategory(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}////////////////////////////
	
	public SjhDTO selectOne(String no) {
		
		SjhDTO dto=null;
		String sql="SELECT * from SERVICEINFO_NORMALINFO WHERE no =?";
		try {			
			//no,category,content,title,name,postdate,id
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new SjhDTO();
				dto.setNo(rs.getString(1));
				dto.setCategory(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setPostdate(rs.getDate(5));				
				dto.setContent(rs.getString(7));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}//////////////////////////////
	
	//입력용]
	public int insert(SjhDTO dto) {//no,category,content,title,name,postdate,id
		int affected=0;
		String sql="INSERT INTO SERVICEINFO_NORMALINFO(no,category,title,name,postdate,content) VALUES(info_deptno.NEXTVAL,?,?,?,sysdate,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());			
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getContent());
						
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}////////////////////////
	
	
	public int update(SjhDTO dto) {//no,category,content,title,name,sysdate,id	
		
		int affected=0;
		String sql="UPDATE SERVICEINFO_NORMALINFO SET category=?,title=?,name=?,postdate=sysdate ,content=? WHERE no=?";
		//"UPDATE SERVICEINFO_NORMALINFO SET category=?,content=?,title=?,name=? WHERE no=?"
		try {
			psmt = conn.prepareStatement(sql);
					
			psmt.setString(1, dto.getCategory());			
			psmt.setString(2, dto.getTitle());						
			psmt.setString(3, dto.getName());			
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getNo());
									
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////////////////////
	
	public int delete(String key) {
		int affected=0;
		String sql="DELETE FROM SERVICEINFO_NORMALINFO WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,key);			
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////////////////


}
