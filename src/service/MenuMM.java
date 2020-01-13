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
import bean.Branch;
import bean.Cart;
import bean.Forward;
import bean.Order;
import bean.OrderDetail;
import dao.CartDao;
import dao.MemberDao;
import dao.MenuDao;
import dao.OrderDao;

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
		if(isLogin()) {
			fw.setPath("login.jsp");
			fw.setRedirect(false);
			return fw;
		}
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
		sb.append("<button class=\"btn\" id=\"changebtn\" type=\"button\" onclick=\"location.href='modifycart'\"><img class=\"btn-img\" src=\"img/change.png\"></button>");
		sb.append("<button class=\"btn\" id=\"orderbtn\" type=\"button\" onclick=\"location.href='ordersheet?sum="+sum+"'\"><img class=\"btn-img\" src=\"img/btn2.png\"></button>");


		System.out.println(sb);
		return sb.toString();
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

	public Forward modifyCart() {
		Forward fw=new Forward();
		MenuDao mnDao=new MenuDao();
		
		String id=(String) request.getSession().getAttribute("id");
		if(isLogin()) {
			fw.setPath("login.jsp");
			fw.setRedirect(false);
			return fw;
		}
		
		List<Bobburger> mListn=mnDao.getCartList("일반",id);
		List<Bobburger> mListm=mnDao.getCartList("고기",id);
		List<Bobburger> mListt=mnDao.getCartList("튀김",id);
		List<Bobburger> mListtt=mnDao.getCartList("떡갈비",id);
		mnDao.close();
		request.setAttribute("pListn", new Gson().toJson(mListn));
		request.setAttribute("pListm", new Gson().toJson(mListm));
		request.setAttribute("pListt", new Gson().toJson(mListt));
		request.setAttribute("pListtt", new Gson().toJson(mListtt));
		fw.setPath("Order.jsp");
		fw.setRedirect(false);
		 return fw;
		
	}

	public String changeCart() {
		System.out.println("changeCart 옴");

		CartDao cDao=new CartDao();
		String buyerid=(String) request.getSession().getAttribute("id");
		Enumeration<String> params = request.getParameterNames();

		while (params.hasMoreElements()){
			String bobid = (String)params.nextElement();
			int cnt=Integer.parseInt(request.getParameter(bobid));
			System.out.println(bobid + " : " +cnt);


			//카트에 밥버거 아이디 구매자 아이디로 insert 할라고 했는데 있으면?
			
				Cart c= new Cart();

				c.setB_bobid(Integer.parseInt(bobid));
				c.setB_buyerid(buyerid);
				c.setC_cnt(cnt);
				int result=cDao.insertCart(c);
					if(result==0) {	//이미 디비에 등록되어 있는 경우
						//카운트를 업데이트
						cDao.updateCart(c);

					}else if(result==1) {	//장바구니 등록 성공
						//성공 메시지
						System.out.println("카트 등록 성공");

					}else {	//장바구니 등록 실패
						//실패 메시지
						System.out.println("카트 등록 실패");
					}
				}
			

		return "{\"a\":\"1\"}";

	}
	public Forward addCart() {
		// TODO Auto-generated method stub
		Forward fw=new Forward();
		System.out.println("addCart 옴");

		CartDao cDao=new CartDao();
		String buyerid=(String) request.getSession().getAttribute("id");
		Enumeration<String> params = request.getParameterNames();

		while (params.hasMoreElements()){
			String bobid = (String)params.nextElement();
			int cnt=Integer.parseInt(request.getParameter(bobid));
			System.out.println(bobid + " : " +cnt);


			//카트에 밥버거 아이디 구매자 아이디로 insert 할라고 했는데 있으면?
			
				Cart c= new Cart();

				c.setB_bobid(Integer.parseInt(bobid));
				c.setB_buyerid(buyerid);
				c.setC_cnt(cnt);
				int result=cDao.insertCart(c);
					if(result==0) {	//이미 디비에 등록되어 있는 경우
						//카운트를 업데이트
						cDao.updateCart(c);

					}else if(result==1) {	//장바구니 등록 성공
						//성공 메시지
						System.out.println("카트 등록 성공");

					}else {	//장바구니 등록 실패
						//실패 메시지
						System.out.println("카트 등록 실패");
					}
				}
			
			fw.setPath("cartlist");
			fw.setRedirect(false);

		return fw;
	}

	public Forward orderSheet() {
		HttpSession session=request.getSession();
		Forward fw=new Forward();
		MenuDao mnDao=new MenuDao();

		String id=(String)session.getAttribute("id");

		List<Branch> branchList=null;

		int total=Integer.parseInt(request.getParameter("sum"));

		branchList=mnDao.getBranchList(id);

		System.out.println("토탈값:"+total);
		request.setAttribute("total", total);
		if(branchList!=null&&branchList.size()!=0) {
			String orderListHtml1=makeHtml_branchList(branchList);
			request.setAttribute("branchList", orderListHtml1);
		}

		fw.setPath("OrderSheet.jsp");
		fw.setRedirect(false);
		return fw;
	}
    //지점select
	private String makeHtml_branchList(List<Branch> branchList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<select name='branchid'>");
		sb.append("<option value=''>지점선택</option>");
		for(int i=0;i<branchList.size();i++) {
			Branch b=branchList.get(i);
			sb.append("<option value="+b.getBranchid()+">"+b.getBranchname()+"</option>");
		}
		sb.append("</select>");
	    System.out.println("1:"+sb);
		return sb.toString();
	}

	public Forward payment() {
		Forward fw=new Forward();
		HttpSession session=request.getSession();
		OrderDao orDao=new OrderDao();
		if(isLogin()) {
			fw.setPath("login.jsp");
			fw.setRedirect(false);
			return fw;
		}
		String id=(String)session.getAttribute("id");
		Order od=new Order();
		OrderDetail odd=new OrderDetail();
		Cart c=new Cart();
		
		od.setTototcost(Integer.parseInt(request.getParameter("total")));
		od.setAddress(request.getParameter("address"));
		od.setBranchid(request.getParameter("branchid"));
		od.setBuyerid(id);
		
		
		orDao.orderInsert(od);
		
		
		
		
		
		
		orDao.orderdetailInsert(id);
		orDao.cartDelete(id);
		
		
		return null;
	}
	public boolean isLogin() {
		String id=(String) request.getSession().getAttribute("id");
		System.out.println("id검사:"+id);
		if(id==null) {	
			return true;
		}else {
			return false;
		}
		
	}

	public Forward orderConfirm() {
		HttpSession session=request.getSession();
		Forward fw=new Forward();
		OrderDao odDao=new OrderDao();
		
		String id=(String)session.getAttribute("id");
		List<Order> odList=null;
		odList=odDao.odList(id);
		
		
		if(odList!=null&&odList.size()!=0) {
			String odListHtml=makeHtml_odList(odList);
			request.setAttribute("odList", odListHtml);
		}
		
		fw.setPath("OrderConfirm.jsp");
		fw.setRedirect(false);
		return fw;
	}


	private String makeHtml_odList(List<Order> odList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<th>주문번호</th>");
		sb.append("<th>주문날짜</th>");
		sb.append("<th>배송주소</th>");
		sb.append("<th></th>");
		sb.append("</tr>");
		for(int i=0;i<odList.size();i++) {
			Order od=odList.get(i);		
			OrderDao odDao=new OrderDao();
			List<OrderDetail> oddList=null;
			oddList=odDao.oddList(odList.get(i).getOrderid());
			
			sb.append("<tr>");
			sb.append("<td>"+od.getOrderid()+"</td>");
			sb.append("<td>"+od.getOrdertime()+"</td>");
			sb.append("<td>"+od.getAddress()+"</td>");
			sb.append("<td><button id='menubtn'>메뉴보기</button>");
			sb.append("</tr>");
			sb.append("<tr id='in'>");
			sb.append("<td colspan='3'>"+makeHtml_oddList(oddList)+"</td>");
			sb.append("<td>"+"총"+od.getTototcost()+"원"+"</td>");
			sb.append("</tr>");
		  

		}
		sb.append("</table>");
		return sb.toString();
	}

	private String makeHtml_oddList(List<OrderDetail> oddList) {
		StringBuilder sb=new StringBuilder();
		sb.append("<table>");
		for(int i=0;i<oddList.size();i++) {
			OrderDetail odd=oddList.get(i);
			OrderDao odDao=new OrderDao();
			
			sb.append("<tr>");
			sb.append("<td>"+odd.getBobname()+"</td>");
			sb.append("<td>"+odd.getCnt()+"</td>");
			sb.append("<td>"+odd.getCost()+"</td>");
			sb.append("</tr>");
			
				
			
			
		}
		sb.append("</table>");
		return sb.toString();
	}

	}

/*
 * private String makeHtml_oddList(List<OrderDetail> oddList) { StringBuilder
 * sb=new StringBuilder();
 * 
 * sb.append("<h2>"+oddList.get(0).getBuyername()+"님의 주문내역</h2>");
 * sb.append("<table>"); sb.append("<tr>"); sb.append("<th>주문번호</th>");
 * sb.append("<th>주문날짜</th>"); sb.append("<th>배송주소</th>");
 * sb.append("<th></th>");
 * 
 * sb.append("</tr>");
 * 
 * for(int i=0;i<oddList.size();i++) { OrderDetail odd=oddList.get(i);
 * 
 * sb.append("<tr>"); sb.append("<td>"+odd.getOrderid()+"</td>");
 * sb.append("<td>"+odd.getOrdertime()+"</td>");
 * sb.append("<td>"+odd.getAddress()+"</td>");
 * sb.append("<td><button id='menubtn'>메뉴보기</button>"); sb.append("</tr>");
 * sb.append("<tr id='in'>");
 * sb.append("<td colspan='3'>"+odd.getBobname()+"|"+odd.getCnt()+"|"+odd.
 * getCost()+"</td>"); sb.append("<td>"+"총"+odd.getTotcost()+"원"+"</td>");
 * sb.append("</tr>");
 * 
 * 
 * }
 * 
 * return sb.toString(); }
 * 
 * 
 */


