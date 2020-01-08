package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Bobburger;


public class MenuDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public void close() {
		JdbcUtil.close(rs, pstmt, con);
	}
	public MenuDao() {
		con=JdbcUtil.getConnection();
	}
	public boolean insertProduct(Bobburger bob) {
		String sql = "insert into \"bobburger\" values(bobseq.NEXTVAL,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, bob.getBobname());
			pstmt.setInt(2, bob.getCost());
			pstmt.setNString(3, bob.getPic());
			pstmt.setNString(4, bob.getExplanation());
			pstmt.setNString(5, bob.getKind());

			int result = pstmt.executeUpdate();
			if(result!=0) { //작업 성공
				System.out.println("상품등록 성공");
				return true;
			}

		} catch (SQLException e) {
			System.out.println("상품등록 예외");
			e.printStackTrace();
		}
		return false;  //상품 등록 실패
	}


	public List<Bobburger> getItemList(String kind) {
		String sql = "SELECT * FROM \"bobburger\" WHERE \"kind\"=?";
		List<Bobburger> pList=null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, kind);
			rs = pstmt.executeQuery();
			pList = new ArrayList<Bobburger>();
			while(rs.next()) {
				Bobburger product = new Bobburger();
				product.setBobid(rs.getInt("bobid"));
				product.setPic(rs.getNString("pic"));
				product.setBobname(rs.getNString("bobname"));
				product.setCost(rs.getInt("cost"));
				product.setExplanation(rs.getNString("explanation"));
				product.setKind(kind);
				pList.add(product);
			}
			System.out.println("겟 완료");
			return pList;
		} catch (SQLException e) {
			System.out.println("list예외발생");
			e.printStackTrace();
		}

		return null;
	}



	
	public List<Bobburger> delmenuList(String kind) {
		String sql="SELECT * FROM \"bobburger\" WHERE \"kind\"=?";
		List<Bobburger> mnList=null;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, kind);
			rs=pstmt.executeQuery();
			mnList=new ArrayList<Bobburger>();
			while(rs.next()) {
				Bobburger bob=new Bobburger();
				bob.setPic(rs.getNString("pic"));
				bob.setBobid(rs.getInt("bobid"));
				bob.setBobname(rs.getNString("bobname"));
				bob.setCost(rs.getInt("cost"));
				bob.setKind(rs.getNString("kind"));
				bob.setExplanation(rs.getNString("explanation"));
				
				mnList.add(bob);		
				}
			return mnList;
		} catch (SQLException e) {
			System.out.println("상품 목록 불러오기 오류");
			e.printStackTrace();
		}
		return null;
	}
	
	public void menuDelete(int bobid) {
	String sql="DELETE FROM \"bobburger\" WHERE \"bobid\"=?";
	  try {
		  pstmt=con.prepareStatement(sql);
	      pstmt.setInt(1, bobid);
	  int result=pstmt.executeUpdate();
	  if(result!=0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
	  } catch (SQLException e) {
			System.out.println("상품 목록 불러오기 오류");
			e.printStackTrace();
		}
	}
}

