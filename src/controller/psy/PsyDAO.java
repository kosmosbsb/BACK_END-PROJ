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
			//[0]~[5]는 count 상수 구하기
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
			sql = "select count(id) from user_normal where gender='M'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[2]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			sql = "select count(id) from user_normal where gender='F'";
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
			sql = "select count(H.id) from user_host H inner join user_normal N on H.id=N.id where gender='M'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
				chardatar[4]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			sql = "select count(H.id) from user_host H inner join user_normal N on H.id=N.id where gender='F'";
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
		
		//세로그래프 호스트(
		public int[] chartDataArray2() {
			int[] chardatar2 = {0,0,0,0,0,0,0,0,0};
			String j="10";
			String k="19";
			for(int i = 0;i<=8;i++) {
				String sql = "select count(H.id) from user_host H inner join user_normal N on H.id=N.id where age =\'"+j+"-"+k+"\' ";
					if(i==0) {//10대 쿼리문이 적용됨 (j,k 초기화값이 적용됨)
						j="20";k="29";}//다음 쿼리문에 쓸 j,k를 적용해줌
					else if(i==1) {//20대 / j20 k29가 적용됨
						j="30";k="39";}//다음 쿼리문에 쓸 j,k를 적용해줌
					else if(i==2) {//30대
						j="40";k="59";}
					else if(i==3) {//40대
						j="50";k="59";}
					else if(i==4) {//50대
						j="60";k="69";}
					else if(i==5) {//60대
						j="70";k="79";}
					else if(i==6) {//70대
						j="80";k="89";}
					else if(i==7) {//80대
						j="90";k="99";}
					else if(i==8) {//90대
						}
					
					try {
						
						psmt = conn.prepareStatement(sql);
						rs = psmt.executeQuery();
						while(rs.next()) {
						chardatar2[i]=Integer.parseInt(rs.getString(1));
						//System.out.println(sql);
						//System.out.println(j+k);
						//System.out.println(chardatar2[i]);
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				}//for
					
			return chardatar2;	
					
		}//세로그래프 호스트)//
		
		//세로그래프 노멀(
		public int[] chartDataArray3() {
			int[] chardatar3 = {0,0,0,0,0,0,0,0,0};
			String j="10";
			String k="19";
			for(int i = 0;i<=8;i++) {
				String sql = "select count(id) from user_normal where age =\'"+j+"-"+k+"\' ";
					if(i==0) {//10대
						j="20";k="29";}
					else if(i==1) {//20대
						j="30";k="39";}
					else if(i==2) {//30대
						j="40";k="59";}
					else if(i==3) {//40대
						j="50";k="59";}
					else if(i==4) {//50대
						j="60";k="69";}
					else if(i==5) {//60대
						j="70";k="79";}
					else if(i==6) {//70대
						j="80";k="89";}
					else if(i==7) {//80대
						j="90";k="99";}
					else if(i==8) {//90대
						}
					try {
						psmt = conn.prepareStatement(sql);
						rs = psmt.executeQuery();
						while(rs.next()) {
						chardatar3[i]=Integer.parseInt(rs.getString(1));
						//System.out.println(sql);
						//System.out.println(j+k);
						//System.out.println(chardatar3[i]);
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
			}//for
			return chardatar3;
		}//세로그래프 노멀)//

		//상세보기용(
		public List<PsyDTO> selectOne(String id) {
			List<PsyDTO> list = new Vector<PsyDTO>();
			// 페이징 적용 - 구간 쿼리로 변경
			String sql = "select N.IMG, H.ID, H.H_NICKNAME, N.MAIL, H.INTRODUCE, H.H_ALARM_MAIL, H.H_ALARM_SMS, N.gender, N.age, N.phone from USER_HOST H INNER JOIN USER_NORMAL N on H.ID=N.ID where H.id = ? ";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					PsyDTO dto = new PsyDTO();
					//System.out.println(rs.getString(1)+rs.getString(2)+rs.getString(3)+rs.getString(4)+rs.getString(5)+rs.getString(6)+rs.getString(7));
					dto.setImg(rs.getString(1));
					dto.setId(rs.getString(2));
					dto.setH_nickname(rs.getString(3));
					dto.setMail(rs.getString(4));
					dto.setIntroduce(rs.getString(5));
					dto.setH_alarm_mail(rs.getString(6));
					dto.setH_alarm_sns(rs.getString(7));
					dto.setGender(rs.getString(8));
					dto.setAge(rs.getString(9));
					dto.setPhone(rs.getString(10));
					list.add(dto);
				}/////////////while
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}//상세보기용)//
		
		public int getTotalRecordCount() {
			int total = 0;
			String sql = "SELECT COUNT(*) FROM USER_HOST";
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
