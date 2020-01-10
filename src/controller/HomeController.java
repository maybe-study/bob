package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;
import dao.MemberDao;
import service.BranchMM;
import service.MemberMM;
import service.MenuMM;

@WebServlet({"/admin","/delbranchfrm","/addbranchfrm","/allrevenue","/delmenufrm","/delmenu","/addmenufrm",
	"/branchloginfrm","/menu","/joinfrm","/loginfrm","/main","/orderfrm","/addmenu","/cartlist","/ordersheet"
	,"/payment","/addcart","/branchlogin"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd=request.getServletPath();
		Forward fw=null;
		MemberMM mm=new MemberMM(request, response);
		MenuMM menu=new MenuMM(request, response);
        BranchMM bm=new BranchMM(request, response);
		switch(cmd) {

		case "/joinchk":    //회원가입 중복확인
			String buyerid = request.getParameter("buyerid");
			response.getWriter().write(new MemberDao().registerCheck(buyerid)+"");
			break;

		case "/admin":

			break;

		case "/delbranchfrm":	//브런치삭제 페이지

			break;

		case "/addbranchfrm":	//브런치 추가 페이지
            fw=bm.addbranchfrm();
			break;

		case "/allrevenue": // 매출 페이지

			break;
		case "/delmenufrm":
			fw=menu.delmenuList();
			break;
		case "/delmenu":
			fw=menu.delmenu();
			break;
		case "/addmenufrm": //메뉴 추가 페이지

			break;

		case "/branchlogin": //지사 로그인 페이지
            fw=mm.branchloginfrm();
			break;

		case "/orderfrm":		//주문 페이지
			fw=menu.getMenuList();
			break;

		case "/menu":		   //메뉴 페이지
			fw=menu.menuList();
			break;

		case "/joinfrm":	   //회원가입
			fw=mm.joinfrm();
			break;

		case "/loginfrm":	   //로그인
			fw=mm.loginfrm();
			break;

		case "/main":		  //메인 페이지

			break;
		case "/cartlist":		  //메인 페이지
			fw=menu.cartList();
			break;

		case "/addmenu":
			fw=menu.insertproduct();

			break;
		case "/addcart":
			fw=menu.addCart();

			break;

		case "/ordersheet":
			fw=menu.orderSheet();


			break;
		case "/payment":
			fw=menu.payment();
			break;
		}
		if(fw!=null) {
			if(fw.isRedirect()) {
				response.sendRedirect(fw.getPath());
			}

			else {
				RequestDispatcher dis=request.getRequestDispatcher(fw.getPath());
				dis.forward(request, response);
			}
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
