package service;

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
	
}