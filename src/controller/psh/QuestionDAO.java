package controller.psh;

import java.sql.Connection;
import java.sql.Date;
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

import controller.cjh.DataRoomDTO;
import controller.psy.PsyDTO;
import model.BbsDTO;

public class QuestionDAO {

	// 멤버 변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자
	public QuestionDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT") + "/jdbc/jsp");
			conn = source.getConnection();
		}
		catch (NamingException e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 자원 반납용
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} 
		catch (Exception e) {}
	}// close()
	
///////////////////////////////////////////////////////////////////////current.jsp
	
	public List<QuestionDTO> selectList_A(){
		List<QuestionDTO> list = new Vector<QuestionDTO>();
		//System.out.println(list);
		String sql ="select UQ.question_type, UQ.question_title, UN.n_nickname, UQ.regidate, AA.answer_date, SA.id, UQ.state, UQ.no, UN.id " + 
				"from " + 
				"USER_NORMAL UN " + 
				"INNER JOIN USER_QUESTION UQ on UN.id=UQ.id " + 
				"INNER JOIN ADMIN_ANSWER AA on UQ.no=AA.no " + 
				"INNER JOIN SC_ADMIN SA on AA.id=SA.id ";
		//System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			//System.out.println(sql);
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				//System.out.println(
				//		rs.getString(1)+"\r\n"+
				//		rs.getString(2)+"\r\n"+
				//		rs.getString(3)+"\r\n"+
				//		rs.getDate(4)+"\r\n"+
				//		rs.getDate(5)+"\r\n"+
				//		rs.getString(6)+"\r\n"+
				//		rs.getString(7)+"\r\n"
				//		);
				//System.out.println(rs.getInt(8));
				//System.out.println(rs.getString(9));
				dto.setQuestion_type(rs.getString(1));
				dto.setQuestion_title(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setState(rs.getString(7));
				dto.setAnswer_date(rs.getDate(5));
				dto.setAdmin_id(rs.getString(6));
				dto.setNo(rs.getInt(8));
				dto.setRealid(rs.getString(9));
				list.add(dto);
			}/////////////while
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<QuestionDTO> selectList_N(){
		List<QuestionDTO> list = new Vector<QuestionDTO>();
		//System.out.println(list);
		String sql ="SELECT UQ.NO,QUESTION_TYPE,QUESTION_TITLE,N_NICKNAME,REGIDATE, UQ.state, UN.id " + 
				"FROM USER_NORMAL UN " + 
				"inner JOIN USER_QUESTION UQ ON UN.ID=UQ.ID " + 
				"where UQ.state is null ";
		//System.out.println(sql);
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			//System.out.println(sql);
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				//System.out.println(
				//		rs.getString(1)+"\r\n"+
				//		rs.getString(2)+"\r\n"+
				//		rs.getString(3)+"\r\n"+
				//		rs.getString(4)+"\r\n"+
				//		rs.getDate(5)+"\r\n"+
				//		rs.getString(6)+"\r\n"
				//		);
				//System.out.println(rs.getInt(1));
				//System.out.println(rs.getString(7));
				dto.setNo(rs.getInt(1));
				dto.setQuestion_type(rs.getString(2));
				dto.setQuestion_title(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setRegidate(rs.getDate(5));
				dto.setState(rs.getString(6));
				dto.setRealid(rs.getString(7));
				list.add(dto);
			}/////////////while
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<QuestionDTO> viewQinfo(String no) {
		//System.out.println(no);
		List<QuestionDTO> list = new Vector<QuestionDTO>();
		String sql ="select UQ.state, UQ.question_type, UQ.Question_title, UQ.regidate, UQ.Question_content, UN.img, UN.id, UN.n_nickname, UN.grade, UN.gender, UN.age, UN.mail, UN.phone, UN.n_alarm_sms, UN.n_alarm_mail " + 
				"from User_Question UQ " + 
				"inner join User_Normal UN on UQ.id=UN.id " + 
				"where UQ.no=? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			//System.out.println(sql);
			while(rs.next()) {
				QuestionDTO dto = new QuestionDTO();
				//System.out.println(
				//		rs.getInt(1)+"\r\n" +
				//		rs.getString(2)+"\r\n"
				//		rs.getString(3)+"\r\n"+
				//		rs.getString(4)+"\r\n"+
				//		rs.getDate(5)+"\r\n"+
				//		rs.getString(6)+"\r\n"
				//		);
				//System.out.println(rs.getInt(1));
				//System.out.println(rs.getString(7));
				dto.setState(String.valueOf(rs.getInt(1)));
				dto.setQuestion_type(rs.getString(2));
				dto.setQuestion_title(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setQuestion_content(rs.getString(5));//
				dto.setImg(rs.getString(6));
				dto.setRealid(rs.getString(7));
				dto.setId(rs.getString(8));
				dto.setGrade(rs.getString(9));
				dto.setGender(rs.getString(10));
				dto.setAge(rs.getString(11));//
				dto.setMail(rs.getString(12));
				dto.setPhone(String.valueOf(rs.getLong(13)));
				dto.setN_alarm_sms(rs.getString(14));
				dto.setN_alarm_mail(rs.getString(15));
				
				list.add(dto);
			}/////////////while
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public QuestionDTO reply(String no,String content,String admin_id){
		QuestionDTO dto=new QuestionDTO();
		/*System.out.println(no+"번호");
		System.out.println(content+"내용");
		System.out.println(admin_id+"아이디");*/
		String sql="UPDATE USER_QUESTION SET STATE=1 WHERE NO='"+no+"'";
		int updateAffected=0;
		int insertAffected=0;
		
		try {
			psmt = conn.prepareStatement(sql);
			updateAffected = psmt.executeUpdate();
			//System.out.println(updateAffected);
			
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		sql="INSERT INTO ADMIN_ANSWER (NO,ANSWER_DATE,CONTENT,ID) VALUES (?,SYSDATE,?,?) ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(no));
			psmt.setString(2,content);
			psmt.setString(3,admin_id);
			
			insertAffected=psmt.executeUpdate();
			//System.out.println(insertAffected);
			
			dto.setNo(Integer.parseInt(no));
			dto.setContent(content);
			dto.setAdmin_id(admin_id);
			
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		
		sql="SELECT ANSWER_DATE FROM ADMIN_ANSWER WHERE NO='"+no+"'";
		try {
			psmt = conn.prepareStatement(sql);
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				dto.setAnswer_date(rs.getDate(1));
			}
			
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		return dto;
	}
	
	public String content(String no) {
		String sql="SELECT CONTENT FROM ADMIN_ANSWER WHERE NO='"+no+"'";
		String content=null;
		try {
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while(rs.next()) {
				content=rs.getString(1);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		return content;
	}
///////////////////////////////////////////////////////////////////////history.jsp

	public int[] getlineChartUser_month() {
		int[] userArray = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }; // 1월~12월

		for (int i = 1; i <= 12; i++) {
			String sql = "SELECT COUNT(*) " + 
					" FROM (SELECT * " + 
					" FROM (SELECT UN.ID FROM USER_NORMAL UN LEFT OUTER JOIN USER_HOST UH ON UN.ID=UH.ID " + 
					" WHERE UH.ID IS NULL) A " + 
					" JOIN USER_QUESTION B ON A.ID=B.ID) " + 
					" WHERE TO_CHAR(REGIDATE,'MM')="+(i<10?"0"+i:i);
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while (rs.next()) {
					userArray[i - 1] = Integer.parseInt(rs.getString(1));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userArray;
	}

	public int[] getlineChartHost_month() {
		int[] hostArray = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }; // 1월~12월

		for (int i = 1; i <= 12; i++) {
			String sql = "SELECT COUNT(*) " + 
					" FROM (SELECT * " + 
					" FROM (SELECT UN.ID FROM USER_NORMAL UN LEFT OUTER JOIN USER_HOST UH ON UN.ID=UH.ID " + 
					" WHERE UH.ID IS NOT NULL) A " + 
					" JOIN USER_QUESTION B ON A.ID=B.ID) " + 
					" WHERE TO_CHAR(REGIDATE,'MM')="+(i<10?"0"+i:i);
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while (rs.next()) {
					hostArray[i - 1] = Integer.parseInt(rs.getString(1));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return hostArray;
	}

	public int[] getPieChartResult_type() {
		int []pieArray= {0,0,0};
		//공간
		String sql = "select COUNT(*) FROM USER_QUESTION WHERE QUESTION_TYPE='공간'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				pieArray[0]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//결제
		sql = "select COUNT(*) FROM USER_QUESTION WHERE QUESTION_TYPE='결제'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				pieArray[1]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//예약
		sql = "select COUNT(*) FROM USER_QUESTION WHERE QUESTION_TYPE='예약'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				pieArray[2] = Integer.parseInt(rs.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pieArray;
	}

	
	
	
}
