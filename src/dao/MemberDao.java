package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bean.Member;

public class MemberDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDao() {
		con=JdbcUtil.getConnection();
	}
	public void close() {
		JdbcUtil.close(rs, pstmt, con);
	}
	public boolean memberJoin(Member mb) {
		String sql="INSERT INTO \"buyer\" VALUES(?,?,?,?,?,?)";
		int result=0;
		try {
			pstmt=con.prepareStatement(sql);//1번만 파싱
			pstmt.setNString(1, mb.getId()); //1234
			pstmt.setNString(2, mb.getPw());
			pstmt.setNString(3, mb.getPhone());
			pstmt.setNString(4, mb.getEmail());
			pstmt.setNString(5, mb.getName());
			pstmt.setDate(6, mb.getBuybirth());
			
			result=pstmt.executeUpdate();
			if(result!=0)
				return true;
			
		} catch (SQLException e) {
			System.out.println("회원가입 예외(실패)");
			e.printStackTrace();
		} 
		return false;
	}
	public int login(String id, String pw) {
		String sql="SELECT * FROM BUYER WHERE ID=?";
		int result=-1;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getNString("PW").equals(pw))
					result=1; //모두일치
				else
					result=0;//id는 일치하지만 pw가 불일치
			}else
				result=-1;//id 불일치
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("로그인 실패");
			}
		return result;
	}
}//Dao End









