package boardone;

import boardone.BoardDto;

import java.sql.*;
import java.time.LocalDateTime;

public class BoardDao {
	private static BoardDao instance = null;

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		if (instance == null) {
			synchronized (BoardDao.class) {
				instance = new BoardDao();
			}
		}
		return instance;
	}

	private PreparedStatement setPreparedStatement(Connection conn, String sql, String state) throws Exception {
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, state);
		return stmt;
	}

	public void insertArticle(BoardDto article) {
		int num = article.getNum();
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		int number = 0;

		String sql = "select max(num) from board";

		try (
				Connection conn = ConnUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			if (number != 0) { // 답 글일 경우
				sql = "update board set step = step + 1 where ref = ? and step > ?";
				try (PreparedStatement pstmt1 = conn.prepareStatement(sql)) {
					pstmt1.setInt(1, ref);
					pstmt1.setInt(2, step);
					pstmt1.executeQuery();
					step++;
					depth++;
				}
			} else { // 새 글일 경우
				ref = number;
				step = 0;
				depth = 0;
			}

			sql = "insert into board " +
					"(num, writer, email, subject, password, regdate, ref, step, depth, content, ip) " +
					"values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try (PreparedStatement pstmt2 = conn.prepareStatement(sql)) {
				pstmt2.setString(1, article.getWriter());
				pstmt2.setString(2, article.getEmail());
				pstmt2.setString(3, article.getSubject());
				pstmt2.setString(4, article.getPassword());
				pstmt2.setTimestamp(5, article.getRegdate());
				pstmt2.setInt(6, ref);
				pstmt2.setInt(7, step);
				pstmt2.setInt(8, depth);
				pstmt2.setString(9, article.getContente());
				pstmt2.setString(10, article.getIp());
				pstmt2.executeQuery();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}




	public boolean idCheck(String id) {
		boolean result = false;
		String sql = "select * from member where ID = ?";
		try (
				Connection conn = ConnUtil.getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (!rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean memberInsert(BoardDto dto) {
		boolean flag = false;
		String sql = "insert into member values (?, ?, ?, ?)";
		try (
				Connection conn = ConnUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)
		) {

			int count = pstmt.executeUpdate();
			if (count > 0) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int loginCheck(String id, String password) {
		int check = -1;
		String sql = "select password from member where id = ?";

		try (
				Connection conn = ConnUtil.getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (rs.next()) {
				String dbPass = rs.getString("password");
				check = password.equals(dbPass) ? 1 : 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public BoardDto getMember(String id) {
		BoardDto dto = new BoardDto();
		String sql = "select * from member where id = ?";

		try (
				Connection conn = ConnUtil.getConnection();
				PreparedStatement pstmt = setPreparedStatement(conn, sql, id);
				ResultSet rs = pstmt.executeQuery()
		) {
			if (rs.next()) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public void memberUpdate(BoardDto dto) {
		String sql = "update member set password = ?, email = ? where id = ?";

		try (
				Connection conn = ConnUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)
		) {

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int deleteMember(String id, String password) {
		int result = -1;
		String sql = "select password from member where id = ?";
		String sql1 = "delete from member where id = ?";

		try (
				Connection conn = ConnUtil.getConnection();
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
