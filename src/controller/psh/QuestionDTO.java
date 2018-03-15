package controller.psh;

import java.sql.Date;

public class QuestionDTO {
	//처리 현황
	private int no;
	private String question_type;
	private String question_title;
	private String question_content;
	private Date regidate;
	//작성자 닉넴
	private String id;
	//작성자 진짜 아이디 ㅋㅋ
	private String realid;
	//담당자
	private String admin_id;
	//답변날짜
	private Date answer_date;
	//처리여부
	private String state;
	//이미지
	private String Img;
	//성별 등급 나이 기타 조인문에 필요함
	private String grade;
	private String gender;
	private String age;
	private String mail;
	private String phone;
	private String n_alarm_sms;
	private String n_alarm_mail;
	private String h_nickname;
	private String h_alarm_sms;
	private String h_alarm_mail;
	
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getN_alarm_sms() {
		return n_alarm_sms;
	}
	public void setN_alarm_sms(String n_alarm_sms) {
		this.n_alarm_sms = n_alarm_sms;
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
	public String getH_alarm_sms() {
		return h_alarm_sms;
	}
	public void setH_alarm_sms(String h_alarm_sms) {
		this.h_alarm_sms = h_alarm_sms;
	}
	public String getH_alarm_mail() {
		return h_alarm_mail;
	}
	public void setH_alarm_mail(String h_alarm_mail) {
		this.h_alarm_mail = h_alarm_mail;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
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
	public String getRealid() {
		return realid;
	}
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	public void setRealid(String realid) {
		this.realid = realid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
