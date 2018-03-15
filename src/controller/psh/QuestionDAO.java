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
	
	public List<QuestionDTO> selectList_A(){
		List<QuestionDTO> list = new Vector<QuestionDTO>();
		//System.out.println(list);
		String sql ="select UQ.question_type, UQ.question_title, UN.n_nickname, UQ.regidate, AA.answer_date, SA.id, UQ.state " + 
				"from " + 
				"USER_NORMAL UN " + 
				"INNER JOIN USER_QUESTION UQ on UN.id=UQ.id " + 
				"INNER JOIN ADMIN_ANSWER AA on UQ.no=AA.no " + 
				"INNER JOIN SC_ADMIN SA on AA.id=SA.id ";
		System.out.println(sql);
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
				dto.setQuestion_type(rs.getString(1));
				dto.setQuestion_title(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setState(rs.getString(7));
				dto.setAnswer_date(rs.getDate(5));
				dto.setAdmin_id(rs.getString(6));
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
		String sql ="SELECT UQ.NO,QUESTION_TYPE,QUESTION_TITLE,N_NICKNAME,REGIDATE, UQ.state " + 
				"FROM USER_NORMAL UN " + 
				"inner JOIN USER_QUESTION UQ ON UN.ID=UQ.ID " + 
				"where UQ.state is null ";
		System.out.println(sql);
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
				dto.setNo(rs.getInt(1));
				dto.setQuestion_type(rs.getString(2));
				dto.setQuestion_title(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setRegidate(rs.getDate(5));
				dto.setState(rs.getString(6));
				list.add(dto);
			}/////////////while
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}
