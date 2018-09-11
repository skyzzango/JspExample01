package memberone;

import java.sql.Timestamp;

public class MemberDto {
	private String id;
	private String password;
	private String email;
	private Timestamp regdate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberDto{" +
				"id='" + id + '\'' +
				", password='" + password + '\'' +
				", email='" + email + '\'' +
				", regdate=" + regdate +
				'}';
	}
}
