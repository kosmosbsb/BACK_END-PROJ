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
			String sql = "SELECT N.id, NAME, H_NICKNAME, GENDER, AGE FROM USER_NORMAL N INNER JOIN USER_HOST H ON N.ID = H.ID WHERE ROWNUM BETWEEN ? and ? ";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "1");
				psmt.setString(2, "10");
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					PsyDTO dto = new PsyDTO();
					//System.out.println(rs.getString(1)+rs.getString(2)+rs.getString(3)+rs.getString(4)+rs.getString(5));
					dto.setId(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setH_nickname(rs.getString(3));
					dto.setGender(rs.getString(4));
					dto.setAge(rs.getString(5));
					list.add(dto);
				}/////////////while
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}///////////////selectList()
		
		//차트에 카운트 세팅
		public int[] chartDataArray(){
			int[] chardatar = {0,0,0,0,0,0};
			
			//일반유저중 호스트유저 비율(
			String sql = "select count(id) from user_normal";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				//System.out.println(Integer.parseInt(rs.getString(1)));
				chardatar[0]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			sql = "select count(id) from user_host";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[1]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//일반유저중 호스트유저 비율)//
			
			//일반 회원 성별 비율(
			sql = "select count(id) from user_normal where gender='m'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[2]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			sql = "select count(id) from user_normal where gender='f'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[3]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//일반 회원 성별 비율)//
			
			//호스트 회원 성별 비율
			sql = "select count(H.id) from user_host H inner join user_normal N on H.id=N.id where gender='m'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[4]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			sql = "select count(H.id) from user_host H inner join user_normal N on H.id=N.id where gender='f'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[5]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//호스트 회원 성별 비율//
			
			
			
			return chardatar;
		}
}
