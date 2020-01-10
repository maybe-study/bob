package service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.Bobburger;
import bean.Forward;
import dao.MemberDao;
import dao.MenuDao;

public class MenuMM {
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;

	public MenuMM(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
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
		// Forward fw = new Forward();
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
			// HttpSession session = request.getSession();
			System.out.println("밥네임:" + bobname);
			bob.setBobname(bobname);
			bob.setCost(cost);
			bob.setExplanation(explanation);
			bob.setKind(kind);
			bob.setPic(pic);

			if (bobDao.insertProduct(bob)) {
				System.out.println("상품등록 성공");
			} else {
				System.out.println("상품등록 실패");
			}
			fw = new Forward();
			fw.setPath("adminPage.jsp"); // ("index.jsp");
			// 새로고침시 파일재업로드를 방지하려면
			// page속성을 session영역세 저장하고 true로 설정
			fw.setRedirect(true);
			bobDao.close();

			/*
			 * if (pDao.insertProduct(product)) {
			 *
			 * System.out.println("상품등록 성공"); } else { System.out.println("상품등록 실패"); } //
			 * 신상품 등록시 신상품 페이지, 인기상품 등록시 인기상품 페이지 이동 if (product.getP_kind().equals("new"))
			 * { session.setAttribute("page", "newItem"); } else {
			 * session.setAttribute("page", "bestItem"); } fw = new Forward();
			 * fw.setPath("./"); //("index.jsp"); //새로고침시 파일재업로드를 방지하려면 //page속성을 session영역세
			 * 저장하고 true로 설정 fw.setRedirect(true); pDao.close();
			 */

		} catch (IOException e) {
			System.out.println("상품등록 예외");
			e.printStackTrace();
		}
		return fw;

	}
	
	public Forward getMenuList() {
		Forward fw = new Forward();
		// session에서 id 넘어오는지 체크 나중에 추가

		MenuDao pDao = new MenuDao();
		
		List<Bobburger> pListn = pDao.getItemList("일반");
		List<Bobburger> pListm = pDao.getItemList("고기");
		List<Bobburger> pListt = pDao.getItemList("튀김");
		List<Bobburger> pListtt = pDao.getItemList("떡갈비");
		
		
		
		pDao.close();
		
		
		
		request.setAttribute("pListn", new Gson().toJson(pListn));
		request.setAttribute("pListm", new Gson().toJson(pListm));
		request.setAttribute("pListt", new Gson().toJson(pListt));
		request.setAttribute("pListtt", new Gson().toJson(pListtt));
		
		fw.setPath("Order.jsp");
		fw.setRedirect(false);
		return fw;
		
	}
	
/*
	public Forward getItemList() {
		Forward fw = new Forward();
		// session에서 id 넘어오는지 체크 나중에 추가

		MenuDao pDao = new MenuDao();
		
		List<Bobburger> pListn = pDao.getItemList("일반");
		List<Bobburger> pListm = pDao.getItemList("고기");
		List<Bobburger> pListt = pDao.getItemList("튀김");
		List<Bobburger> pListtt = pDao.getItemList("떡갈비");
		
		pDao.close();

		
		String pListHtmln = makeHtml_pList(pListn);
		String pListHtmlm = makeHtml_pList(pListm);
		String pListHtmlt = makeHtml_pList(pListt);
		String pListHtmlntt = makeHtml_pList(pListtt);
		
		
		
		request.setAttribute("pListHtmln", pListHtmln);
		request.setAttribute("pListHtmlm", pListHtmlm);
		request.setAttribute("pListHtmlt", pListHtmlt);
		request.setAttribute("pListHtmltt", pListHtmlntt);
		
		fw.setPath("Order.jsp");
		fw.setRedirect(false);
		return fw;
	}
	*/

	private String makeHtml_pList(List<Bobburger> pList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < pList.size(); i++) {
			Bobburger p = pList.get(i);
			sb.append("<div id='list' onclick=\"detail('" + p.getBobid() + "')\">");
			sb.append("<img src='upload/" + p.getPic() + "' width='40%'><br>");
			// sb.append("<input id='test' name='"+p.getP_code()+"' type='button'
			// value='장바구니담기'>");
			sb.append(p.getBobname() + "<br>");
			sb.append(p.getCost() + "원");

			sb.append("</div>");

		}
		System.out.println(sb);
		return sb.toString();
	}

	public Forward delmenuList() {
		 Forward fw=new Forward();
		 MenuDao mnDao=new MenuDao();
		 
		 List<Bobburger> mnListn=mnDao.delmenuList("일반");
		 List<Bobburger> mnListm=mnDao.delmenuList("고기");
		 List<Bobburger> mnListt=mnDao.delmenuList("튀김");
		 List<Bobburger> mnListtt=mnDao.delmenuList("떡갈비");
		 mnDao.close();
		 
		 String mnListHtmln = makeHtml_mnList(mnListn);
	     String mnListHtmlm = makeHtml_mnList(mnListm);
		 String mnListHtmlt = makeHtml_mnList(mnListt);
		 String mnListHtmlntt = makeHtml_mnList(mnListtt);
		
		 request.setAttribute("mnListHtmln", mnListHtmln);
		 request.setAttribute("mnListHtmlm", mnListHtmlm);
		 request.setAttribute("mnListHtmlt", mnListHtmlt);
		 request.setAttribute("mnListHtmltt", mnListHtmlntt);

		 fw.setPath("delMenu.jsp");
		 fw.setRedirect(false);
		 return fw;
	}
	
	//삭제 메뉴 리스트를 만드는 함수
	private String makeHtml_mnList(List<Bobburger> mnList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table>");
		for(int i=0;i<mnList.size();i++) {
			Bobburger bob=mnList.get(i);
			sb.append("<tr>");
			sb.append("<td><input type='checkbox' name='checkedMenu' value='"+bob.getBobid()+"'></td>");
			sb.append("<td><img src='upload/" + bob.getPic() + "' width='40%'></td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}

	public Forward delmenu() {
		//체크된 메뉴 리스트
		//ArrayList delList = new ArrayList(Arrays.asList(request.getParameterValues("checkedMenu")));
		String[] checkedMenu=request.getParameterValues("checkedMenu");
		System.out.println("내가 태스트하낟다아아앙라아아앙ㄴㄹ머ㅣ마널;ㅣㅓ댜ㅓ;미ㅏㅓㅏㄹ");
		System.out.println(Arrays.toString(checkedMenu));
		MenuDao mnDao=new MenuDao(); 
		Bobburger bob=new Bobburger();
		for(int i=0;i<checkedMenu.length;i++) {
			mnDao.menuDelete(Integer.parseInt(checkedMenu[i]));
		}
		
		
		mnDao.close();
		return delmenuList();
	
	}

	public Forward menuList() {
		Forward fw=new Forward();
		MenuDao mnDao=new MenuDao();
		List<Bobburger> mListn=mnDao.menuList("일반");
		List<Bobburger> mListm=mnDao.menuList("고기");
		List<Bobburger> mListt=mnDao.menuList("튀김");
		List<Bobburger> mListtt=mnDao.menuList("떡갈비");
		mnDao.close();
		String mListHtmln = makeHtml_mList(mListn);
		String mListHtmlm = makeHtml_mList(mListm);
		String mListHtmlt = makeHtml_mList(mListt);
		String mListHtmlntt = makeHtml_mList(mListtt);
		 request.setAttribute("mListHtmln", mListHtmln);
		 request.setAttribute("mListHtmlm", mListHtmlm);
		 request.setAttribute("mListHtmlt", mListHtmlt);
		 request.setAttribute("mListHtmltt", mListHtmlntt);
		fw.setPath("menu.jsp");
		 fw.setRedirect(false);
		return fw;
	}

	private String makeHtml_mList(List<Bobburger> mList) {
		StringBuilder sb=new StringBuilder();
		for(int i=0;i<mList.size();i++) {
			Bobburger bob=mList.get(i);
			sb.append("<ul id=menubody>");
			sb.append("<li><img src='upload/" + bob.getPic() + "' width='150px'>");
			sb.append("</li>");
			sb.append("<li>"+bob.getBobname());
			sb.append("</li>");
			sb.append("<li>"+bob.getCost()+"원");
			sb.append("</li>");
			sb.append("<li>"+bob.getExplanation());
			sb.append("</li>");
			sb.append("</ul>");
			
		}
		return sb.toString();
	}

	public Forward addCart() {
		// TODO Auto-generated method stub
		System.out.println("addCart 옴");
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()){
			String name = (String)params.nextElement();
			System.out.println(name + " : " +request.getParameter(name));
		}
		
		
		
		return null;
	}

}
