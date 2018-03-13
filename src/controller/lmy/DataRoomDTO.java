package controller.lmy;

import java.util.Date;

public class DataRoomDTO {

	
	
	private String no;
	private String name;
	private String title;
	private String content;
	private Date postdate;
	
	public DataRoomDTO() {}
	
	public DataRoomDTO(String no,String name,String title,String content,Date postdate) {
		super();
		this.no = no;
		this.name = name;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	
	
	
	
}
