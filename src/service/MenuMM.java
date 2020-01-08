package service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.Bobburger;
import bean.Forward;
import dao.MenuDao;

public class MenuMM {
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;
	public MenuMM(HttpServletRequest request, HttpServletResponse response) {
		  this.request=request;
		  this.response=response;
	}
	
	public Forward insertproduct() {
		Forward fw = new Forward();
//		if(request.getSession().getAttribute("id")==null) {
//			fw.setPath("./");
//			fw.setRedirect(true);
//			return fw;
//		}
		String uploadPath = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path=" + uploadPath);
		File dir = new File(uploadPath);
		if (!dir.exists()) { // 클린시 업로드 폴더 삭제될경우를 대비
			dir.mkdir(); // dir.mkdirs(); 부모폴더까지 생성
		}
		int size = 10 * 1024 * 1024;
		//Forward fw = new Forward();
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
			new DefaultFileRenamePolicy());
			String bobname = multi.getParameter("bobname");
			String explanation = multi.getParameter("explanation");
			int cost = Integer.parseInt(multi.getParameter("cost"));
			String kind = multi.getParameter("kind");
			String pic = multi.getFilesystemName("p_file");

			Bobburger bob = new Bobburger();
			MenuDao bobDao = new MenuDao();
			//HttpSession session = request.getSession();
			System.out.println("밥네임:"+bobname);
			bob.setBobname(bobname);
			bob.setCost(cost);
			bob.setExplanation(explanation);
			bob.setKind(kind);
			bob.setPic(pic);
			
			if(bobDao.insertProduct(bob)) {
				System.out.println("상품등록 성공");
			}else{
				System.out.println("상품등록 실패");
			}
			fw = new Forward();
			fw.setPath("./index.jsp");  //("index.jsp");
			//새로고침시 파일재업로드를 방지하려면
			//page속성을 session영역세 저장하고 true로 설정
			fw.setRedirect(true);
			bobDao.close();
			
			/*
			if (pDao.insertProduct(product)) {

				System.out.println("상품등록 성공");
			} else {
				System.out.println("상품등록 실패");
			}
			// 신상품 등록시 신상품 페이지, 인기상품 등록시 인기상품 페이지 이동
			if (product.getP_kind().equals("new")) {
				session.setAttribute("page", "newItem");
			} else {
				session.setAttribute("page", "bestItem");
			}
			fw = new Forward();
			fw.setPath("./");  //("index.jsp");
			//새로고침시 파일재업로드를 방지하려면
			//page속성을 session영역세 저장하고 true로 설정
			fw.setRedirect(true);
			pDao.close();
			*/

		} catch (IOException e) {
			System.out.println("상품등록 예외");
			e.printStackTrace();
		}
		return fw;

	}

	public Forward getMenuList(String kind) {
		Forward fw=new Forward();
		MenuDao mnDao=new MenuDao();
		List<Bobburger> mnList=null;
		mnList=mnDao.getMenuList(kind);
		
		if(mnList!=null&&mnList.size()!=0) {
			String mnListHtml=makeHtml_mnList(mnList);
			request.setAttribute("mnList", mnListHtml);
		}
		fw.setPath("./delMenu.jsp");
		fw.setRedirect(false);
		return fw;
	}

	private String makeHtml_mnList(List<Bobburger> mnList) {
		StringBuilder sb=new StringBuilder();
		for(int i=0;i<mnList.size();i++) {
			Bobburger bob=mnList.get(i);
			sb.append("<div class='menu'>");
			sb.append(bob.getBobname());
			sb.append("</div>");
			
		}
		return sb.toString();
	}
	
}
