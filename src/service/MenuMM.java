package service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.Bobburger;
import bean.Cart;
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
			fw.setPath("./index.jsp"); // ("index.jsp");
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
	

	private String makeHtml_pList(List<Bobburger> pList) {
		StringBuilder sb = new StringBuilder();
		   sb.append("<table>");
		   sb.append("<tr>");
		   sb.append("<th>상품</th>");
		   sb.append("<th>수량선택</th>");
		   sb.append("</tr>");
		for (int i = 0; i < pList.size(); i++) {
			Bobburger bob = pList.get(i);
			sb.append("<tr>");
			sb.append("<td><img src='upload/" + bob.getPic() + "' width='40%'><br>");
			sb.append("<td><input type='number' id='orderamt' name='orderamt' value=1 maxlength>");
			sb.append("</tr>");
			// sb.append("<input id='test' name='"+p.getP_code()+"' type='button'
			// value='장바구니담기'>");
			

			sb.append("</table>");

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

	public Forward cartList() {
		HttpSession session=request.getSession();
		Forward fw=new Forward();
		MenuDao mnDao=new MenuDao();
		
		String id=(String)session.getAttribute("id");
		System.out.println("카트리스트2");
		List<Cart> cList=null;
		cList=mnDao.cartList(id);
		
		if(cList!=null&&cList.size()!=0) {
			String cListHtml=makeHtml_cList(cList);
			request.setAttribute("cList", cListHtml);
		}
		fw.setPath("cart.jsp");
		fw.setRedirect(false);
		return fw;
	}

	private String makeHtml_cList(List<Cart> cList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table>");
		sb.append("<tr><th style='text-align:center'>메뉴이름</th>");
		sb.append("<th style='text-align:center'>가격</th>");
		sb.append("<th style='text-align:center'>수량</th>");
		sb.append("<th style='text-align:center'>총값</th></tr>");
		int sum=0;
		for(int i=0;i<cList.size();i++) {
			Cart c=cList.get(i);
			sum+=c.getT_price();
			sb.append("<tr>");
			sb.append("<td>"+c.getB_bobname()+"</td>");
			sb.append("<td>"+c.getB_cost()+"</td>");
			sb.append("<td>"+c.getC_cnt()+"</td>");
			sb.append("<td>"+c.getT_price()+"</td>");
			sb.append("</tr>");
			
		}
		
		sb.append("<tr><td colspan='4'>총가격:"+sum+"</td></tr>");
		sb.append("</table>");
		sb.append("<button class=\"btn\" id=\"changebtn\" type=\"button\" onclick=\"location.href='orderfrm'\"><img class=\"btn-img\" src=\"img/change.png\"></button>"); 
		sb.append("<button class=\"btn\" id=\"orderbtn\" type=\"button\" onclick=\"location.href='OrderSheet.jsp?sum="+sum+"'\"><img class=\"btn-img\" src=\"img/btn2.png\"></button>");
		
		
		System.out.println(sb);
		return sb.toString();
	}

	

}
