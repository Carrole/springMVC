package com.spring.user.impl;

public class UserDo {
	private String nickname;
	private String password;
	private String created_at;
	
	@Override
	public String toString() {
		return "UserDo [nickname=" + nickname +
				", password=" + password +
				", created_at=" + created_at + "]";
	}

	public UserDo() {
	}

	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }

	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }

	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}
