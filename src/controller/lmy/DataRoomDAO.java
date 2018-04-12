package controller.lmy;

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
import javax.xml.transform.Source;

import controller.lmy.DataRoomDTO;
import model.BbsDTO;


public class DataRoomDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public DataRoomDAO(ServletContext context) {
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
	public List<DataRoomDTO> selectList() {
		List <DataRoomDTO> list= new Vector<DataRoomDTO>();
		
		String sql="SELECT * FROM NOTICE ";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataRoomDTO dto = new DataRoomDTO();

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

 	public DataRoomDTO selectOne(String key) {
		DataRoomDTO dto = null;
		String sql="select * from NOTICE where notice_no=? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new DataRoomDTO();
			

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
	public int insert(DataRoomDTO dto) {
		int affected=0;
		String sql="insert into notice(NOTICE_NO,TITLE,CONTENT,NORMAL_OR_HOST,CATEGORY,ID) values(notice_seq.nextval,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNormal_or_host());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5, dto.getId());
			
			affected = psmt.executeUpdate();
			
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////
	
	//이전글/다음글 얻기
	

 	//삭제
	public int delete(String key) {
		int affected =0;
		String sql="DELETE FROM NOTICE WHERE Notice_no=?";
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
	public int update(DataRoomDTO dto) {
		int affected=0;
		String sql="UPDATE NOTICE SET CATEGORY =?,TITLE=?, CONTENT=?,NORMAL_OR_HOST=? WHERE Notice_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCategory());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getNormal_or_host());
			psmt.setString(5, dto.getNotice_no());
			affected = psmt.executeUpdate();
			System.out.println(dto.getCategory()+"dd");
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
		
	}

}
