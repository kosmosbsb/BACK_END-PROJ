package model;

import java.sql.Date;

/*
 * DTO(Data transfer object): 데이타를 전송하는 객체로 테이블의 레코드 하나를 저장할 수 있는 자료구조
 */

public class BbsDTO {
	// 속성 혹은 멤버변수
	private String no;
	private String id;
	private String pwd;
	private String title;
	private String content;
	private String visitcount;
	private Date postdate;
	
	// 프로그램의 효율성을 위한 속성 추가
	private String name;
	
	// 기본 생성자
	public BbsDTO() {
	}

	// 인자 생성자
	public BbsDTO(String no, String id, String title, String content, String visitcount, Date postdate) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.visitcount = visitcount;
		this.postdate = postdate;
	}
	
	// 게터 세터
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	
	
	
	
	
}
