package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import bean.Bobburger;
import bean.Cart;

public class CartDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void close() {
		JdbcUtil.close(rs, pstmt, con);
	}

	public CartDao() {
		con = JdbcUtil.getConnection();
	}

	
	
	
	
	public int insertCart(Cart cart) {
		//String sql = "insert into \"cart\" values(?,?,?)";
		String sql = "insert into \"cart\" values(41,'123',3)";
		//넣는거는 insert
		try {
			pstmt = con.prepareStatement(sql);
			//pstmt.setNString(1, cart.getB_bobid());
			//pstmt.setNString(2, cart.getB_buyerid());
			//pstmt.setInt(3, cart.getC_cnt());

			int result = pstmt.executeUpdate();
			if (result != 0) { // 작업 성공
				System.out.println("장바구니 등록 성공");
				return 1;
			}

		} catch(SQLIntegrityConstraintViolationException e) {
			System.out.println("이미 장바구니에 있는 밥버거");
			return 0;
			
		}catch (SQLException e) {
			System.out.println("장바구니 등록 예외");
			e.printStackTrace();
		} 
		return -1;
	}
	
	
	
	
	
	
	public boolean updateCart(Cart cart) {
		//String sql = "insert into \"cart\" values(?,?,?)";
		String sql = "update \"cart\" set \"cnt\"=? where \"bobid\"=? and \"buyerid\"='123'";
		//넣는거는 insert
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, cart.getB_bobid());
			pstmt.setNString(2, cart.getB_buyerid());
			pstmt.setInt(3, cart.getC_cnt());

			int result = pstmt.executeUpdate();
			if (result != 0) { // 작업 성공
				System.out.println("장바구니 업데이트 성공");
				return true;
			}

		} catch (SQLException e) {
			System.out.println("장바구니 업데이트 예외");
			e.printStackTrace();
		} 
		return false;
	}
}
