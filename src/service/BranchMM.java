package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Branch;
import bean.Forward;
import dao.BranchDao;

public class BranchMM {
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;

	public BranchMM(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}
   //지점추가하기
	public Forward addbranchfrm() {
		Branch ab= new Branch();
		ab.setBranchid(request.getParameter("branchid"));
		ab.setBranchpw(request.getParameter("branchpw"));
		ab.setSales(0);
		ab.setBranchname(request.getParameter("branchname"));
		ab.setBranchaddress(request.getParameter("branchaddress"));
		ab.setExplain(request.getParameter("explain"));
		
		BranchDao bDao= new BranchDao();
		boolean result = bDao.branch(ab);
		bDao.close();
		
		Forward fw= new Forward();
		if(result) {
			fw.setPath("adminPage.jsp");
			fw.setRedirect(true);
		}else {
			request.setAttribute("msg", "등록실패");
			fw.setPath("addBranch.jsp");
			fw.setRedirect(false);
		}
		
		return fw;

	}
	public Forward delbranchList() {
		Forward fw=new Forward();
		BranchDao bDao=new BranchDao();
		
		List<Branch> brList=bDao.delbranchList();
		bDao.close();
		
		String brListHtml = makeHtml_brList(brList);
		request.setAttribute("brListHtml", brListHtml);
		fw.setPath("delBranch.jsp");
		fw.setRedirect(false);
		return fw;
	}
	private String makeHtml_brList(List<Branch> brList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<table>");
		for(int i=0; i<brList.size();i++) {
			Branch br = brList.get(i);
			sb.append("<tr>");
			sb.append("<td><input type='checkbox' name='checkedBranch' value='"+br.getBranchid()+"'></td>");
			sb.append("<td>"+br.getBranchname()+"</td>");
			sb.append("<td>"+br.getSales()+"</td>");
			sb.append("<td>"+br.getBranchaddress()+"</td>");
			sb.append("<td>"+br.getExplain()+"</td>");
			sb.append("<tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}
	public Forward delbranch() {
		String [] checkedBranch = request.getParameterValues("checkedBranch");
		BranchDao bDao = new BranchDao();
		Branch br = new Branch();
		for(int i=0;i<checkedBranch.length;i++) {
			bDao.branchDelete(checkedBranch[i]);
		}
		bDao.close();
		return delbranchList();
	}
	public Forward printbranch() {
		
		return null;
	}
	
	
}