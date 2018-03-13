package controller.cjh;

public class DataRoomDTO {
	private String id;
	private String N_NICKNAME;
	private String name;
	private String MAIL;
	private String gender;
	private String age;
	private String PHONE;
	private String N_ALARM_SMS;
	private String N_ALARM_MAIL;
	private String grade;
	private String mileage;
	
	public String getN_NICKNAME() {
		return N_NICKNAME;
	}
	public void setN_NICKNAME(String n_NICKNAME) {
		N_NICKNAME = n_NICKNAME;
	}
	public String getMAIL() {
		return MAIL;
	}
	public void setMAIL(String mAIL) {
		MAIL = mAIL;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getN_ALARM_SMS() {
		return N_ALARM_SMS;
	}
	public void setN_ALARM_SMS(String n_ALARM_SMS) {
		N_ALARM_SMS = n_ALARM_SMS;
	}
	public String getN_ALARM_MAIL() {
		return N_ALARM_MAIL;
	}
	public void setN_ALARM_MAIL(String n_ALARM_MAIL) {
		N_ALARM_MAIL = n_ALARM_MAIL;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	

}
