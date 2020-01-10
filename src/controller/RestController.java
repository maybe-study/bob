package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/changecart")
public class RestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String cmd=request.getServletPath();
		System.out.println("cmd:"+cmd);
		switch(cmd) {
		
		case "/changecart":
			Enumeration params = request.getParameterNames();
			while (params.hasMoreElements()){
				String name = (String)params.nextElement();
				System.out.println(name + " : " +request.getParameter(name));
			}
			System.out.println("changecart 옴");
			break;
		
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
