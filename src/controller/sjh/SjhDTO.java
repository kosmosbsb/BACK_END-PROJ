package controller.sjh;

import java.util.Date;

public class SjhDTO {

	
	private String no;
	private String content;
	private String category;	
	private String title;
	private String name;
	private Date postdate;
	
	public SjhDTO() {}

	
	public SjhDTO(String no, String category, String content, String title, String name, Date postdate) {
		super();
		this.no = no;
		this.category = category;
		this.content = content;
		this.title = title;
		this.name = name;
		this.postdate = postdate;
	}


	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	
	
	
	
	
}
