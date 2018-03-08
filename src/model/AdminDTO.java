package model;

import java.sql.Date;

public class AdminDTO {
	private String id;
	private String pwd;
	private String admin_name;
	private String admin_level;
	private Date regidate;
	
	public AdminDTO() {}

	public AdminDTO(String id, String pwd, String admin_name, String admin_level, Date regidate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.admin_name = admin_name;
		this.admin_level = admin_level;
		this.regidate = regidate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_level() {
		return admin_level;
	}

	public void setAdmin_level(String admin_level) {
		this.admin_level = admin_level;
	}

	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}

	@Override
	public String toString() {
		return String.format("[아이디:%s 비번:%s 이름:%s 등급:%s]", id,pwd,admin_name,admin_level);
	}
	
	
}
