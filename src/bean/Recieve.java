package bean;

import java.sql.Date;

public class Recieve {
	private String orderid;
	private int detailid;
	
	private String ordertime;
	private String bobname;
	private int cnt;
	private String address;
	private String state;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String string) {
		this.ordertime = string;
	}
	public String getBobname() {
		return bobname;
	}
	public void setBobname(String bobname) {
		this.bobname = bobname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getDetailid() {
		return detailid;
	}
	public void setDetailid(int detailid) {
		this.detailid = detailid;
	}
}
