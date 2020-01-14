package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MenuMM;
import service.OrderMM;

@WebServlet({"/changecart","/recieveref"})
public class RestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String cmd=request.getServletPath();
		System.out.println("cmd:"+cmd);
		MenuMM menu=new MenuMM(request, response);
		OrderMM om = new OrderMM(request, response);
		
		
		String json = null;
		
		switch(cmd) {
		
		case "/changecart":
			json=menu.changeCart();
			break;
		
		case "/recieveref":
			json=om.recieveref();
			break;
		}
		if(json!=null) {
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			System.out.println("json:"+json);
			PrintWriter out = response.getWriter();
			out.write(json);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
