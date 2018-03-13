package model.analysis;

import java.sql.Date;

public class AnalysisDTO {
	
	/*공간 통계에 필요한 space 데이터*/
	private int heart;
	private String space_type; //space_detail 테이블의 type 또는 space_office 테이블의 타입
	private String address;
	private String space_tag;
	
	/*이용 통계에 필요한 reserve 데이터*/
	private String status;
	private String gender;
	private String age;
	private Date regidate;
	
	
	public AnalysisDTO() {}

	public AnalysisDTO(int heart, String space_type, String address, String space_tag, String status, String gender,
			String age, Date regidate) {
		super();
		this.heart = heart;
		this.space_type = space_type;
		this.address = address;
		this.space_tag = space_tag;
		this.status = status;
		this.gender = gender;
		this.age = age;
		this.regidate = regidate;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public String getSpace_type() {
		return space_type;
	}

	public void setSpace_type(String space_type) {
		this.space_type = space_type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSpace_tag() {
		return space_tag;
	}

	public void setSpace_tag(String space_tag) {
		this.space_tag = space_tag;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Date getRegidate() {
		return regidate;
	}

	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
}
