package model.analysis;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class AnalysisDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public AnalysisDAO(ServletContext context) {
		try {
			InitialContext ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jdbc/jsp");
			try {
				conn = source.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {}
	}
	
	/*이용 통계에 필요한 reserve 데이터*/
	private String status;
	private String gender;
	private String age;
	private Date regidate;

	public int[] getBarChartResult_month(){
		int[] chardatar = {0,0,0,0,0,0,0,0,0,0,0,0}; //1월~12월
		
		for(int i=1 ; i <= 12 ; i++) {
			String sql = "select count(*) from reserve where TO_CHAR(regidate, 'MM')="+(i<10?"0"+i:i);
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					chardatar[i-1]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return chardatar;
	}

	public int[] getBarChartResult_age() {
		int[] chardatar = {0,0,0,0,0,0,0,0,0}; //10대~90대 이상
		
		for(int i=1 ; i <= 9 ; i++) {
			String sql = "select count(*) from reserve R join user_normal U on R.ID=U.ID where length(U.age)=2 and substr(U.age,1,1)="+i;
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					chardatar[i-1]=Integer.parseInt(rs.getString(1));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return chardatar;
	}
	
	public int[] getPieChartResult_gender() {
		int[] chardatar = {0,0}; //남자, 여자
		
		String sql = "select count(*) from reserve R join user_normal U on U.id=R.id where U.gender='m'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				chardatar[0]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "select count(*) from reserve R join user_normal U on U.id=R.id where U.gender='f'";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				chardatar[1]=Integer.parseInt(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chardatar;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
