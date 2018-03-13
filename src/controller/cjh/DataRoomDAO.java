package controller.cjh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import controller.cjh.DataRoomDTO;


public class DataRoomDAO {
	//멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public DataRoomDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT") + "/jdbc/jsp");
			conn = source.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			// 커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
	}////////////////////////////
	
	public List<DataRoomDTO> selectList(int start, int end) {
		List list = new Vector();
		
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT * FROM USER_NORMAL) T)WHERE R BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataRoomDTO dto = new DataRoomDTO();
				dto.setMileage(rs.getString(11));
				dto.setGrade(rs.getString(12));
				dto.setAge(rs.getString(7));
				dto.setGender(rs.getString(6));
				dto.setName(rs.getString(4));
				dto.setId(rs.getString(1));
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		
		return list;
	}////////////////////////////
	
	
	// 전체 레코드수 얻기용]
	public int getTotalRecordCount() {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM USER_NORMAL";
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
	
	
	public int[] ageDataArray() {
		int[] agedata = {0,0,0,0,0,0,0,0,0};
		
		String sql = "select count(*) from USER_NORMAL where age between 10 and 19";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[0]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 20 and 29";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[1]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 30 and 39";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[2]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 40 and 49";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[3]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 50 and 59";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[4]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 60 and 69";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[5]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 70 and 79";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[6]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 80 and 89";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[7]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where age between 90 and 99";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				agedata[8]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return agedata;
	}
	
	public String[] genderDataArray() {
		String[] genderArray = {null,null};
		
		String sql = "select count(*) from USER_NORMAL where gender = 'm'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				genderArray[0]=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 sql = "select count(*) from USER_NORMAL where gender = 'f'";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					genderArray[1]=rs.getString(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return genderArray;
	}
	
	
	public String[] gradeDataArray() {
		String[] gradeArray = {null,null,null,null,null};
		String sql = "select count(*) from USER_NORMAL where grade = '브론즈'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				gradeArray[0]=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where grade = '실버'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				gradeArray[1]=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from USER_NORMAL where grade = '골드'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				gradeArray[2]=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = "select count(*) from USER_NORMAL where grade = '플레티넘'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				gradeArray[3]=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sql = "select count(*) from USER_NORMAL where grade = 'VIP'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				gradeArray[4]=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return gradeArray;
	}
	
	
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
