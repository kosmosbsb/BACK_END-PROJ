package model;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class AdminDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public AdminDAO(ServletContext context) {
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
	
	public int createAdmin(String id, String pwd, String admin_name, String admin_level) {
		
		if(id.trim().equals("") || pwd.trim().equals("") || admin_name.trim().equals("") || admin_level.trim().equals(""))
			return 4; //필수 입력항목 널체크
		
		String sql = "SELECT COUNT(*) FROM SC_ADMIN WHERE ID=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getString(1).equals("1")) {
				return 1; //아이디 중복
			}
		}catch(SQLException e) {
				return 3; //에러
			}
		sql = "INSERT INTO SC_ADMIN(ID,PWD,ADMIN_NAME,ADMIN_LEVEL,REGIDATE) VALUES(?,?,?,?,DEFAULT)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			try {
				psmt.setString(2, PBKDF2.createHash(pwd));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}
			psmt.setString(3, admin_name);
			psmt.setString(4, admin_level);
			psmt.execute();
			return 2; //회원가입 성공
		}catch(SQLException e) {
			return 3; //에러
		}
	}
	
	public boolean isMember(String id, String pwd) {
		String sql = "SELECT PWD FROM SC_ADMIN WHERE ID=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				String hashCode = rs.getString(1);
				if(PBKDF2.validatePassword(pwd, hashCode)) {
					return true;
				}
				else { //비밀번호가 틀렸어
					return false;
				}
			}
			else{ //아이디가 틀렸어
				return false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<AdminDTO> selectList() {
		List list = new Vector();
		
		String sql="SELECT ADMIN_LEVEL, ID, ADMIN_NAME, REGIDATE FROM SC_ADMIN ORDER BY ADMIN_LEVEL DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				AdminDTO dto = new AdminDTO();
				dto.setAdmin_level(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setAdmin_name(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				
				list.add(dto);				
			}			
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}////////////////////////////
	
	public String getAdminLevel(String id) {
		String sql = "SELECT ADMIN_LEVEL FROM SC_ADMIN WHERE ID=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			else{
				return "잘못된처리!";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "잘못된처리!";
		}
	}
	
	public int deleteAdmin(String id) {
		
		int affected=0;
		String sql = "DELETE FROM SC_ADMIN WHERE ID=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			affected = psmt.executeUpdate();
			if(affected==1)
				return 1;//1개 삭제 성공
			else
				return 2;//0개 또는 2개 이상 삭제됨
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return 3; //에러
		}
	}
	
}
