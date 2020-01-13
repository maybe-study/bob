package bean;

public class OrderDetail {
	int detailid;
	int cost;
	int cnt;
	int orderid;
	int bobid;
	String bobname;

	
	public String getBobname() {
		return bobname;
	}
	public void setBobname(String bobname) {
		this.bobname = bobname;
	}
	String buyername;
	String ordertime;
	String address;
	int totcost;
	
	
	public int getTotcost() {
		return totcost;
	}
	public void setTotcost(int totcost) {
		this.totcost = totcost;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getBuyername() {
		return buyername;
	}
	public void setBuyername(String buyername) {
		this.buyername = buyername;
	}
	public int getDetailid() {
		return detailid;
	}
	public void setDetailid(int detailid) {
		this.detailid = detailid;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getBobid() {
		return bobid;
	}
	public void setBobid(int bobid) {
		this.bobid = bobid;
	}
	
}
