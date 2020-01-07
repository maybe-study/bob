package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Forward;

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
	  String id=(request.getParameter("id"));
  }
}

