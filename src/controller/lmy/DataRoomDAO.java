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

				dto.setNo(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}////////////////////////////

 	public DataRoomDTO selectOne(String key) {
		DataRoomDTO dto = null;
		String sql="select * from NOTICE where no=? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new DataRoomDTO();
			
				dto.setNo(rs.getString(1));
				dto.setName(rs.getString(2));			
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return dto;
	}//////////////////////////////
	//입력용
	public int insert(DataRoomDTO dto) {
		int affected=0;
		String sql="INSERT INTO NOTICE(no,name,title,content) VALUES(noticeseq.NEXTVAL,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			
		
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
	}///////////////////////
	
	//이전글/다음글 얻기
	public Map<String,DataRoomDTO> prevNNext(String key){
		Map<String,DataRoomDTO> map = new HashMap<String,DataRoomDTO>();		
		try {
			//이전글 얻기
			String sql="SELECT no,title FROM NOTICE WHERE no=(SELECT min(no) FROM NOTICE WHERE no > ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();			
			if(rs.next()) {//이전글이 있는 경우
				DataRoomDTO dto= new DataRoomDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("PREV",dto);
			}
			//다음글 얻기
			sql="SELECT no,title FROM NOTICE WHERE no=(SELECT max(no) FROM NOTICE WHERE no < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();			
			if(rs.next()) {//다음글이 있는 경우
				DataRoomDTO dto= new DataRoomDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("NEXT",dto);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}		
		return map;
	}/////////////////////////////
	


 	//삭제
	public int delete(String key) {
		int affected =0;
		String sql="DELETE FROM NOTICE WHERE no=?";
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
		String sql="UPDATE NOTICE SET NAME=?,TITLE=?,CONTENT=?, WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
		
			psmt.setString(1,dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getNo());
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {	e.printStackTrace();}
		return affected;
		
	}

}
