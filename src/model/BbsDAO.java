package model;

import java.sql.Connection;
import java.sql.DriverManager;
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

/*
 * DAO(Data Access Object): 데이타에 접근해서 CRUD작업을 수행하는 업무처리 로직
 */

public class BbsDAO {
	// 멤버 변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	// 생성자
	public BbsDAO(ServletContext context) {
		// 커넥션 풀 미 사용 - 
		/*
		try {
			// 드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			// 데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"), "JSP", "JSP");
		}
		catch(Exception e) {
			e.printStackTrace();
		}*/
		// 커넥션 풀 사용: 톰켓이 생성해 놓은 커넥션 객체 풀에서 가져다 쓰기
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT") + "/jdbc/jsp");
			conn = source.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//////////////BbsDAO()
	// 자원 반납용]
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {}
	}/////////////close()
	
	// 회원여부 판단용]
	public boolean isMember(String id, String pwd) {
		String sql="SELECT pwd FROM member WHERE id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);			
			rs = psmt.executeQuery();
			if(rs.next()) {
				String hashValue=rs.getString(1);
				if(PBKDF2.validatePassword(pwd, hashValue))
					return true;
				else return false;
			}
			return false;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false; 
		}
		
	}////////////////isMember
	
	// 전체 목록 가져오기]
	/*
	 * 페이지 로직 추가하기
	 * DAO에서 할일
	 * 1. 전체목록 쿼리를 구간 쿼리로 변경
	 * 2. 총 레코드수 구하는 메소드 추가
	 * 
	 */
	public List<BbsDTO> selectList(Map<String,Object> map){
		List<BbsDTO> list = new Vector<BbsDTO>();
		// 페이징 미 적용
		// String sql = "SELECT b.*,name FROM bbs b JOIN MEMBER m on b.id = m.id ";
		// sql+= " ORDER BY postdate DESC";
		
		// 페이징 적용 - 구간 쿼리로 변경
		String sql = "SELECT * FROM(SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM bbs b JOIN MEMBER m on b.id = m.id ";
		// 검색용 쿼리 추가
		if(map.get("searchColumn") != null) {
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
		}
		sql+= " ORDER BY postdate DESC) T) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			// 1. 전체목록 쿼리를 구간 쿼리로 변경
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostdate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitcount(rs.getString(5));
				dto.setName(rs.getString(7));
				list.add(dto);
			}/////////////while
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}///////////////selectList()
	
	// 전체 레코드 수 얻기용]
	public int getTotalRecordCount(Map<String,Object> map) {
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM bbs b JOIN member m ON b.id=m.id";
			// 검색용 쿼리 추가
			if(map.get("searchColumn") != null) {
				sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
			}
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}//////////////////////getTotalRecordCount()
	
	// 입력용]
	public int insert(BbsDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO bbs(no,id,title,content) VALUES(SEQ_BBS.NEXTVAL,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			affected = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}////////////////////
	
	public int createUser(BbsDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO member(id,pwd,name) VALUES(?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, PBKDF2.createHash(dto.getPwd()));
			psmt.setString(3, dto.getPwd());
			
			affected = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}////////////////////
	
	// 조회수 업데이트]
	public void updateVisitCount(String key) {
		String sql = "UPDATE bbs SET visitcount=visitcount+1 WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}////////////////////////////
	
	// 상세보기용]
	public BbsDTO selectOne(String key) {
		BbsDTO dto = null;
		String sql = "SELECT b.*,name FROM bbs b JOIN MEMBER m on b.id = m.id ";
		sql+= " WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPostdate(rs.getDate(6));
				dto.setTitle(rs.getString(3));
				dto.setVisitcount(rs.getString(5));
				dto.setName(rs.getString(7));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
		
	}////////////////////////////
	
	// 이전글/다음글 얻기]
	public Map<String,BbsDTO> prevNnext(String key){
		Map<String,BbsDTO> map = new HashMap<String, BbsDTO>();
		try {
			// 이전글 얻기
			String sql = "SELECT no,title FROM bbs WHERE no=(SELECT min(no) FROM bbs WHERE no > ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();
			
			if(rs.next()) { // 이전글이 있는 경우
				BbsDTO dto = new BbsDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("PREV", dto);
			}
			// 다음글 얻기
			sql = "SELECT no,title FROM bbs WHERE no=(SELECT max(no) FROM bbs WHERE no < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
			rs = psmt.executeQuery();

			if (rs.next()) { // 다음글이 있는 경우
				BbsDTO dto = new BbsDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				map.put("NEXT", dto);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}///////////////////////////
	
	// 수정용
	public int update(BbsDTO dto) {
		int affected = 0;
		String sql = "UPDATE bbs SET title=?,content=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNo());
			
			affected = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}////////////////////
	
	// 삭제용
	public int delete(String key) {
		int affected = 0;
		String sql = "DELETE bbs  WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, key);
				
			affected = psmt.executeUpdate();
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}////////////////////
	
}
