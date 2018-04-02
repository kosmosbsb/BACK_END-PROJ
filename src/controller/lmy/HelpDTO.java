package controller.lmy;

public class HelpDTO {

	
	private String notice_no;
	private String title;
	private String content;
	private String normal_or_host;
	private String category;
	private String id;
	

	public HelpDTO() {}


	public HelpDTO(String notice_no, String title, String content, String normal_host, String category, String id) {
		super();
		this.notice_no = notice_no;
		this.title = title;
		this.content = content;
		this.normal_or_host = normal_or_host;
		this.category = category;
		this.id = id;
	}


	public String getNotice_no() {
		return notice_no;
	}


	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
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


	public String getNormal_or_host() {
		return normal_or_host;
	}


	public void setNormal_or_host(String normal_or_host) {
		this.normal_or_host = normal_or_host;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
