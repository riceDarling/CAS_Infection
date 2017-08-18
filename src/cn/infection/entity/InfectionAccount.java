package cn.infection.entity;

import java.io.Serializable;

public class InfectionAccount implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private String password;
	private String nickname;
	private int level;
	private int schoolId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}
	public InfectionAccount(int id, String name, String password,
			String nickname, int level, int schoolId) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.nickname = nickname;
		this.level = level;
		this.schoolId = schoolId;
	}
	public InfectionAccount() {
		super();
	}
}
