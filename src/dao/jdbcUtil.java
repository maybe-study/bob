package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class jdbcUtil {  //여러 DAO의 공용 메소드
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException ex) {
			System.out.println("드라이버 로딩 실패");
			ex.printStackTrace();
		}
	}// static End

	public static Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "icia", "1111");
			System.out.println("Connection Success!");
			//con.setAutoCommit(false); //트랜잭션 처리시 수동커밋
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}
		return con;
	}// End Connection

	public static void close(Connection con) {
		if (con != null)
			try {
				con.close();
				System.out.println("con close");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}// end close

	public static void close(PreparedStatement pstmt) {
		if (pstmt != null)
			try {
				pstmt.close();
				System.out.println("pstmt close");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}// end close

	public static void close(ResultSet rs) {
		if (rs != null)
			try {
				rs.close();
				System.out.println("rs close");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}// end close

	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// End commit;

	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// End rollback;
}// End Class
