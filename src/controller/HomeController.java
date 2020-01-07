package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/admin", "/delbranch", "/addbranch", "/allrevenue", "/delmenu", "/addmenu", "/branchlogin", "/menu",
		"/joinfrm", "/login", "/main", "/order" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = request.getServletPath();
		switch (cmd) {

		case "/admin": // 관리자 페이지

			break;

		case "/delbranch": // 브런치삭제 페이지

			break;

		case "/addbranch": // 브런치 추가 페이지

			break;

		case "/allrevenue": // 매출 페이지

			break;

		case "/delmenu": // 메뉴 삭제 페이지

			break;

		case "/addmenu":// 메뉴 추가 페이지
			break;

		case "/branchlogin":// 지사 로그인 페이지

			break;

		case "/order": // 주문 페이지

			break;

		case "/menu": // 메뉴 페이지

			break;

		case "/joinfrm": // 회원가입

			break;

		case "/login": // 로그인

			break;

		case "/main": // 메인 페이지

			break;

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
