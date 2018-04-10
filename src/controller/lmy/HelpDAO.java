package controller.lmy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class HelpDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public HelpDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/jsp");
			conn = source.getConnection();		
		} 
		catch (NamingException e) {e.printStackTrace();} 
		catch (SQLException e) {e.printStackTrace();}
	
	}///HelpDAO
	
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
	public List<HelpDTO> selectList() {
		List<HelpDTO> list = new Vector<HelpDTO>();
		
		String sql="select notice_no,title,content,regidate,normal_or_host,category,id from help  ";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				HelpDTO dto = new HelpDTO();

				dto.setNotice_no(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setNormal_or_host(rs.getString(5));
				dto.setCategory(rs.getString(6));
				dto.setId(rs.getString(7));
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}////////////////////////////

 	public HelpDTO selectOne(String key) {
 		HelpDTO dto= null;
		String sql="select * from help where notice_no=? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new HelpDTO();
				
				dto.setNotice_no(rs.getString(1));
				
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setNormal_or_host(rs.getString(5));
				dto.setCategory(rs.getString(6));
				dto.setId(rs.getString(7));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return dto;
	}//////////////////////////////
	//입력용
	public int insert(HelpDTO dto) {
		
		int affected=0;
		String sql="INSERT INTO HELP(NOTICE_NO,TITLE,CONTENT,REGIDATE,NORMAL_OR_HOST,CATEGORY,ID)VALUES(help_seq.nextval,?,?,sysdate,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNormal_or_host());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5,dto.getId());
			
			affected = psmt.executeUpdate();
			
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////
	
	


 	//삭제
	public int delete(String key) {
		int affected =0;
		String sql="DELETE FROM help WHERE Notice_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);		
			affected = psmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	//업데이트
	public int update(HelpDTO dto) {
		int affected=0;
		String sql="UPDATE HELP SET TITLE=?, CONTENT=?,NORMAL_OR_HOST=?,CATEGORY =?,ID=? WHERE NOTICE_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			System.out.println("받아온 글번호11: "+dto.getCategory());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3,dto.getNormal_or_host());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5, dto.getId());
			psmt.setString(6,dto.getNotice_no());
		
			
			affected = psmt.executeUpdate();
			
			
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
		
	}
	
	
}
