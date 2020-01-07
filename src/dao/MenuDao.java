package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
