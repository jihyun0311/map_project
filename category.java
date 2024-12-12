package project;

public class category {
	public category () {};
	private int locatioId;
	private String location;
	private String categoryName;
	private String categoryImg;
	
	public int getLocatioId() {
		return locatioId;
	}
	public void setLocatioId(int locatioId) {
		this.locatioId = locatioId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryImg() {
		return categoryImg;
	}
	public void setCategoryImg(String categoryImg) {
		this.categoryImg = categoryImg;
	}
}
