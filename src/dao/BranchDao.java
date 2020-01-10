package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Branch;

public class BranchDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public BranchDao() {
		con = JdbcUtil.getConnection();
	}

	public boolean branch(Branch ab) {
		String sql = "insert into \"branch\" VALUES(?,?,?,?,?,?)" ;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, ab.getBranchid());
			pstmt.setNString(2, ab.getBranchpw());
			pstmt.setInt(3, ab.getSales());
			pstmt.setNString(4, ab.getBranchaddress());
			pstmt.setNString(5, ab.getBranchname());
			pstmt.setNString(6, ab.getExplain());
			
			int result=pstmt.executeUpdate();
			if(result!=0)
				return true;
			
			
		}catch(SQLException e) {
			System.out.println("지점추가실패");
			e.printStackTrace();
		}
		return false;
	}

	public void close() {
		JdbcUtil.close(rs, pstmt, con);

	}
}