package boardone;

import java.sql.Timestamp;

public class BoardDto {
	private int num;
	private String writer;
	private String email;
	private String subject;
	private String password;
	private int readcount;
	private int ref;
	private int step;
	private int depth;
	private Timestamp regdate;
	private String content;
	private String ip;

	public BoardDto() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "BoardDto{" +
				"\nnum=" + num +
				", \nwriter='" + writer + '\'' +
				", \nemail='" + email + '\'' +
				", \nsubject='" + subject + '\'' +
				", \npassword='" + password + '\'' +
				", \nreadcount=" + readcount +
				", \nref=" + ref +
				", \nstep=" + step +
				", \ndepth=" + depth +
				", \nregdate=" + regdate +
				", \ncontent='" + content + '\'' +
				", \nip='" + ip + '\'' +
				'}';
	}
}
