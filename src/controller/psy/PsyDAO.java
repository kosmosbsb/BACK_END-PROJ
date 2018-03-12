package controller.psy;

import java.sql.Connection;
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

import model.BbsDTO;

public class PsyDAO {
	// 멤버 변수]
		private Connection conn;
		private ResultSet rs;
		private PreparedStatement psmt;
	
	// 생성자
		public PsyDAO(ServletContext context) {
			try {
				InitialContext ctx = new InitialContext();
				DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT") + "/jdbc/jsp");
				conn = source.getConnection();
			}catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//PsyDAO()기본생성자
		
	// 자원 반납용
		public void close() {
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}//close()
		
	// 전체 목록 가져오기
		public List<PsyDTO> selectList(/*Map<String,Object> map*/){
			List<PsyDTO> list = new Vector<PsyDTO>();
			// 페이징 적용 - 구간 쿼리로 변경
			String sql = "select N.id, name, h_nickname, gender, age\r\n" + 
					"from USER_NORMAL N INNER JOIN USER_HOST H\r\n" + 
					"ON N.id = H.id\r\n" + 
					"WHERE rownum between ? and ?;";
			
			try {
				psmt = conn.prepareStatement(sql);
				// 1. 전체목록 쿼리를 구간 쿼리로 변경
				psmt.setString(1, "1");//원래 map.get("start").toString()
				psmt.setString(2, "10");//원래 map.get("end").toString()
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					PsyDTO dto = new PsyDTO();
					dto.setId(rs.getString(2));
					dto.setName(rs.getString(1));
					dto.setH_nickname(rs.getString(6));
					dto.setGender(rs.getString(3));
					dto.setAge(rs.getString(5));
					list.add(dto);
				}/////////////while
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}///////////////selectList()
}
