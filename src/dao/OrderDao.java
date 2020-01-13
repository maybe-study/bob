package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Bobburger;
import bean.Branch;
import bean.Cart;
import bean.Order;
import bean.OrderDetail;
import bean.Recieve;

public class OrderDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public OrderDao() {
		con = JdbcUtil.getConnection();
	}
	public void close() {
		JdbcUtil.close(rs, pstmt, con);

	}
	public boolean orderInsert(Order od) {
		String sql = "insert into \"order\" VALUES(odseq.nextval,sysdate,?,?,'주문접수',?,?)" ;
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, od.getTotcost());
			pstmt.setNString(2, od.getAddress());		
			pstmt.setNString(3, od.getBranchid());
			pstmt.setNString(4, od.getBuyerid());
			
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("주문추가성공");
				return true;
			
			}
		}catch(SQLException e) {
			System.out.println("주문추가실패");
			e.printStackTrace();
		}
		return false;
	}
	public boolean orderdetailInsert(String id) {
		String sql = "insert into \"orderdetail\" (\"detailid\",\"cost\",\"cnt\",\"orderid\",\"bobid\")\r\n" + 
				"select oddseq.nextval,b.\"cost\",c.\"cnt\",ODSEQ.currval,b.\"bobid\"\r\n" + 
				"                       from \"bobburger\" b join \"cart\" c \r\n" + 
				"                       on b.\"bobid\"=c.\"bobid\"\r\n" + 
				"                       where c.\"buyerid\"=?" ;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, id);
			
			
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("주문상세추가성공");
				return true;
			
			}
		}catch(SQLException e) {
			System.out.println("주문상세추가실패");
			e.printStackTrace();
		}
		return false;
	}
	public void cartDelete(String id) {
		String sql = "delete from \"cart\" where \"buyerid\"=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, id);
		
			int result = pstmt.executeUpdate();
			if (result != 0) {
				System.out.println("카트삭제 성공");
			} else {
				System.out.println("카트삭제 실패");
			}
		} catch (SQLException e) {
			System.out.println("카트오류");
			e.printStackTrace();
		}
	}
	public List<Recieve> recieveList(String state) {
		String sql="SELECT od.\"orderid\", od.\"ordertime\",bob.\"bobname\",odt.\"cnt\",od.\"address\",od.\"state\"\r\n,odt.\"detailid\"" + 
				"				 FROM \"order\" od JOIN \"orderdetail\" odt \r\n" + 
				"				ON od.\"orderid\"=odt.\"orderid\"\r\n" + 
				"				JOIN \"bobburger\" bob\r\n" + 
				"				ON odt.\"bobid\"=bob.\"bobid\"\r\n" + 
				"				WHERE \"state\"=?";
		List<Recieve> oList = null;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, state);
			rs=pstmt.executeQuery();
			oList = new ArrayList<Recieve>();
			while(rs.next()) {
				Recieve re = new Recieve();
				re.setOrderid(rs.getNString("orderid"));
				re.setOrdertime(rs.getNString("ordertime"));
				re.setBobname(rs.getNString("bobname"));
				re.setCnt(rs.getInt("cnt"));
				re.setAddress(rs.getNString("address"));
				re.setState(rs.getNString("state"));
				re.setDetailid(rs.getInt("detailid"));
				oList.add(re);				
			}
			for(int i=0;i<oList.size();i++) {
				System.out.println("밥네임:"+oList.get(i).getBobname());
			}
			
			return oList;
		}catch (SQLException e) {
			System.out.println("뿌리기 실패");
			e.printStackTrace();
		}
		return null;
	}
	public void stateUpdate(int orderid) {
		String sql = "UPDATE \"order\" "
				+ "SET \"state\"='배달'"
				+ "WHERE \"orderid\"=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderid);
			int result = pstmt.executeUpdate();
			if(result != 0) {
				System.out.println("업데이트 성공");
			}else {
				System.out.println("업데이트 실패");
			}
		}catch (SQLException e) {
			System.out.println("업데이트 오류");
			e.printStackTrace();
		}
	}
	
}
