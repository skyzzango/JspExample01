package memberone;

import java.sql.*;
import java.time.LocalDateTime;

public class MemberDao {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/itbank";
	private static final String ID = "iu";
	private static final String PW = "iu1004";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, ID, PW);
	}

	private PreparedStatement setPreparedStatement(Connection conn, String sql, String state) throws SQLException {
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, state);
		return stmt;
	}

	public boolean idCheck(String id) {
		boolean result = false;
		String sql = "select * from member where ID = ?";
		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (!rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean memberInsert(MemberDto dto) {
		boolean flag = false;
		String sql = "insert into member values (?, ?, ?, ?)";
		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)
		) {
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getEmail());
			pstmt.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
			int count = pstmt.executeUpdate();
			if (count > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int loginCheck(String id, String password) {
		int check = -1;
		String sql = "select password from member where id = ?";

		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (rs.next()) {
				String dbPass = rs.getString("password");
				check = password.equals(dbPass) ? 1 : 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	public MemberDto getMember(String id) {
		MemberDto dto = new MemberDto();
		String sql = "select * from member where id = ?";

		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void memberUpdate(MemberDto dto) {
		String sql = "update member set password = ?, email = ? where id = ?";

		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)
		) {
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int deleteMember(String id, String password) {
		int result = -1;
		String sql = "select password from member where id = ?";
		String sql1 = "delete from member where id = ?";

		try (
				Connection conn = getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (rs.next()) {
				String dbPass = rs.getString("password");
				if (dbPass.equals(password)) { // true 이면 본인 확인 성공
//					pstmt.close();
					try (PreparedStatement pstmt1 = conn.prepareStatement(sql1)) {
						pstmt1.setString(1, id);
						pstmt1.executeUpdate();
						result = 1; // 회원 탈퇴 성공
					}
				} else { // 본인 확인 실패 - 비밀번호 오류
					result = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
