package com.spring.boardex.impl;

public class BoardDo {
	private int seq;
	private String title;
	private String users;
	private String content;
	private String created_at;
	private int viewed;
	
	@Override
	public String toString() {
		return "BoardDo [seq=" + seq + 
				", title=" + title + 
				", user=" + users +
				", content=" + content +
				", created_at=" + created_at +
				", viewed= " + viewed +"]";
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public int getViewed() {
		return viewed;
	}
	public void setViewed(int viewed) {
		this.viewed = viewed;
	}
	
	
	
	
	
	

}
