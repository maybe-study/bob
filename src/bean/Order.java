package bean;

public class Order {
   int orderid;
String ordertime;
   int totcost;
   int tototcost;
   String address;
   String state;
   String branchid;

   public int getTototcost() {
	return tototcost;
}
public void setTototcost(int tototcost) {
	this.tototcost = tototcost;
}
String branchname;
   public String getBranchname() {
	return branchname;
}
public void setBranchname(String branchname) {
	this.branchname = branchname;
}
String buyerid;

public int getOrderid() {
	return orderid;
}
public void setOrderid(int orderid) {
	this.orderid = orderid;
}
public String getOrdertime() {
	return ordertime;
}
public void setOrdertime(String ordertime) {
	this.ordertime = ordertime;
}
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
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getBranchid() {
	return branchid;
}
public void setBranchid(String branchid) {
	this.branchid = branchid;
}
public String getBuyerid() {
	return buyerid;
}
public void setBuyerid(String buyerid) {
	this.buyerid = buyerid;
}
   
}
