package controller.psy;

public class PsyDTO {

	//멤버노말
	private String id;
	private String img;
	private String n_nickname;
	private String name;
	private String mail;
	private String gender;
	private String age;
	private String phone;
	private String n_alarm_sns;
	private String n_alarm_mail;

	//멤버호스트
	private String h_nickname;
	private String introduce;
	private String h_alarm_sns;
	private String h_alarm_mail;
	
	//게터세터
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getN_nickname() {
		return n_nickname;
	}
	public void setN_nickname(String n_nickname) {
		this.n_nickname = n_nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getN_alarm_sns() {
		return n_alarm_sns;
	}
	public void setN_alarm_sns(String n_alarm_sns) {
		this.n_alarm_sns = n_alarm_sns;
	}
	public String getN_alarm_mail() {
		return n_alarm_mail;
	}
	public void setN_alarm_mail(String n_alarm_mail) {
		this.n_alarm_mail = n_alarm_mail;
	}
	public String getH_nickname() {
		return h_nickname;
	}
	public void setH_nickname(String h_nickname) {
		this.h_nickname = h_nickname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getH_alarm_sns() {
		return h_alarm_sns;
	}
	public void setH_alarm_sns(String h_alarm_sns) {
		this.h_alarm_sns = h_alarm_sns;
	}
	public String getH_alarm_mail() {
		return h_alarm_mail;
	}
	public void setH_alarm_mail(String h_alarm_mail) {
		this.h_alarm_mail = h_alarm_mail;
	}

}
