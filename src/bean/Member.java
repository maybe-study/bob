package bean;

import java.util.Date;

public class Member {
	private String buyerid;
	private String pw;
	private String phone;
	private String email;
	private String name;
	private Date buybirth;
	
	public String getId() {
		return buyerid;
	}
	public void setId(String id) {
		this.buyerid = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone =phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
