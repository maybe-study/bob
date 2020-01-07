package service;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Forward;
import bean.Member;
import dao.MemberDao;

public class MemberMM {
  HttpServletRequest request;
  HttpServletResponse response;
  HttpSession session;
  
  public MemberMM(HttpServletRequest request,
		  HttpServletResponse response) {
	  this.request=request;
	  this.response=response;
  }
  
  public Forward joinfrm() {
	  Member mb=new Member();
	  mb.setId(request.getParameter("buyerid"));
	  mb.setPw(request.getParameter("pw"));
	  //mb.setPhone(request.getParameter("phone"));
	  String phone=request.getParameter("phone");
	  String phone1=request.getParameter("phone1");
	  String phone2=request.getParameter("phone2");
	  String p= phone+phone1+phone2;
	  mb.setPhone(p);
	  //mb.setEmail(request.getParameter("email"));
	  String email=request.getParameter("email");
	  String email1=request.getParameter("email1");
	  String e= email+"@"+email1;
	  mb.setEmail(e);
	  mb.setName(request.getParameter("name"));
	  String year=request.getParameter("year");
	  String birth=request.getParameter("birth");
	  String day=request.getParameter("day");
	  Date d = Date.valueOf(year+"-"+birth+"-"+day);
	  mb.setBuybirth(d);
	  
	  MemberDao mDao=new MemberDao();
	  boolean result=mDao.memberJoin(mb);
	  mDao.close();
	  
	  Forward fw=new Forward();
	  if(result) {
		  fw.setPath("login.jsp");
		  fw.setRedirect(true);
	  }else {
		  request.setAttribute("msg","회원가입실패");
		  fw.setPath("joinForm.jsp");
		  fw.setRedirect(false);
	  }
	  return fw;
  } //회원가입 끝

public Forward loginfrm() {
	Forward fw=new Forward();
	Member mb=new Member();
	String id=request.getParameter("buyerid");
	String pw=request.getParameter("pw");
	MemberDao mDao=new MemberDao();
	int result=mDao.login(id,pw);
	mDao.close();
	if(result==-1) {
		request.setAttribute("msgAccess", "id존재하지 않아요!");
	}
	else if(result==0){
		request.setAttribute("msgAccess", "pw가 틀립니다.");
	}
	else {//로그인 성공시 
		HttpSession session=request.getSession();
		session.setAttribute("id", id);
	}
	fw.setPath("main.jsp");
	fw.setRedirect(false);
	return fw;
}
}

