package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import bean.Bobburger;
import bean.Forward;
import bean.Order;
import bean.OrderDetail;
import bean.Recieve;
import dao.OrderDao;

public class OrderMM {
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;

	public OrderMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
		
	}

	public Forward recieveList() {
		Forward fw=new Forward();
		OrderDao oDao=new OrderDao();
		HttpSession session = request.getSession();
		if(session.getAttribute("branchid")==null) {
			fw.setPath("Branchlogin.jsp");
			fw.setRedirect(false);
		}
		List<Recieve> oListr=oDao.recieveList("주문접수");
		List<Recieve> oListc=oDao.recieveList("배달완료");
		oDao.close();
		String oListHtmlr = makeHtml_oList(oListr);
		String oListHtmlc = makeHtml_oList(oListc);
		request.setAttribute("oListr",oListHtmlr);
		request.setAttribute("oListc",oListHtmlc);
		fw.setPath("OrderRecieve.jsp");
		fw.setRedirect(false);
		return fw;
	}
	private String makeHtml_odList(List<Order> odList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<th>주문번호</th>");
		sb.append("<th>주문날짜</th>");
		sb.append("<th>배송주소</th>");
		sb.append("<th></th>");
		sb.append("</tr>");
		for(int i=0;i<odList.size();i++) {
			Order od=odList.get(i);
			OrderDao odDao=new OrderDao();
			List<OrderDetail> oddList=null;
			oddList=odDao.recieveOddList(odList.get(i).getOrderid());
			odDao.close();
			sb.append("<tr>");
			sb.append("<td id='orderid'>"+od.getOrderid()+"</td>");
			sb.append("<td >"+od.getOrdertime()+"</td>");
			sb.append("<td>"+od.getAddress()+"</td>");
			sb.append("<td rowspan='2'>"+"<button class='combtn' id='"+od.getOrderid()+"'>배달완료</button>"+"</td>");
			sb.append("</tr>");
			sb.append("<tr class='menutr'>");
			sb.append("<td colspan='3'>"+makeHtml_oddList(oddList)+"</td>");
			
			sb.append("</tr>");


		}
		sb.append("</table>");
		return sb.toString();
	}
	private String makeHtml_odcomList(List<Order> odList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<th>주문번호</th>");
		sb.append("<th>주문날짜</th>");
		sb.append("<th>배송주소</th>");
		sb.append("<th></th>");
		sb.append("</tr>");
		for(int i=0;i<odList.size();i++) {
			Order od=odList.get(i);
			OrderDao odDao=new OrderDao();
			List<OrderDetail> oddList=null;
			oddList=odDao.recieveOddList(odList.get(i).getOrderid());
			odDao.close();
			sb.append("<tr>");
			sb.append("<td id='orderid'>"+od.getOrderid()+"</td>");
			sb.append("<td >"+od.getOrdertime()+"</td>");
			sb.append("<td>"+od.getAddress()+"</td>");
			
			sb.append("</tr>");
			sb.append("<tr class='menutr'>");
			sb.append("<td colspan='3'>"+makeHtml_oddList(oddList)+"</td>");
			
			sb.append("</tr>");


		}
		sb.append("</table>");
		return sb.toString();
	}

	private String makeHtml_oddList(List<OrderDetail> oddList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table >");
		for(int i=0;i<oddList.size();i++) {
			OrderDetail odd=oddList.get(i);

			sb.append("<tr>");
			sb.append("<td>"+odd.getBobname()+"</td>");
			sb.append("<td>"+odd.getCnt()+"개</td>");
			sb.append("<td>"+odd.getCost()+"원</td>");
			sb.append("</tr>");

		}
		sb.append("</table>");
		return sb.toString();
	}
	private String makeHtml_oList(List<Recieve> oList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<table>");
		for(int i=0;i<oList.size();i++) {
			Recieve re=oList.get(i);
			sb.append("<tr>");
			sb.append("<td><input type='checkbox' name='checkedRecieve' value='" + re.getOrderid() + "'></td>");
			sb.append("<td>"+re.getOrderid()+"</td>");
			sb.append("<td>"+re.getOrdertime()+"</td>");
			sb.append("<td>"+re.getBobname()+re.getCnt()+"개"+"</td>");
			sb.append("<td>"+re.getState()+"</td>");
			sb.append("<td rowspan='2'>"+"<button class='combtn' id='"+re.getOrderid()+"'>배달완료</button>"+"</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='5'>"+re.getAddress()+"</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}

	public Forward recieveu() {
		String [] checkedRecieve=request.getParameterValues("checkedRecieve");
		OrderDao oDao=new OrderDao();
		Recieve re =new Recieve();
		for(int i=0;i<checkedRecieve.length;i++) {
			oDao.stateUpdate(Integer.parseInt(checkedRecieve[i]));
		}
		oDao.close();
		return recieveList();
	}
	
	public String delivery() {
		String bid=request.getParameter("bid");
		System.out.println("bid:"+bid+"======================================");
		OrderDao oDao=new OrderDao();
		
		oDao.stateUpdate(Integer.parseInt(bid));
		
	
		List<Recieve> oListr=oDao.recieveList("주문접수");
		List<Recieve> oListc=oDao.recieveList("배달완료");
		oDao.close();
		String rList = makeHtml_oList(oListr);
		String dList = makeHtml_oList(oListc);
		
		String json="{\"rList\":\""+rList+"\",\"dList\":\""+dList+"\"}";
		
		
		return json;
	}
	public String refresh() {
		OrderDao oDao=new OrderDao();
		HttpSession session = request.getSession();
		String branchid=(String) session.getAttribute("branchid");
			
		List<Order> rList=oDao.recieveOdList(branchid,"주문접수");
		List<Order> dList=oDao.recieveOdList(branchid,"배달완료");
		oDao.close();
		String rListhtml = makeHtml_odList(rList);
		String dListhtml = makeHtml_odcomList(dList);
		
		String json="{\"rList\":\""+rListhtml+"\",\"dList\":\""+dListhtml+"\"}";
		
		
		return json;
	}

	public String recieveref() {
		
		Forward fw=new Forward();
		OrderDao oDao=new OrderDao();
		
		List<Recieve> oListr=oDao.recieveList("주문접수");
		List<Recieve> oListc=oDao.recieveList("배달완료");
		oDao.close();
		String oListHtmlr = makeHtml_oList(oListr);
		String oListHtmlc = makeHtml_oList(oListc);
		request.setAttribute("oListr",oListHtmlr);
		request.setAttribute("oListc",oListHtmlc);
		
		return oListHtmlr;
	}

}
