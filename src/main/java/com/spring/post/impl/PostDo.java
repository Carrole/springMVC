package com.spring.post.impl;

public class PostDo {
	private int seq;
	private String title;
	private String nickname;
	private String content;
	private String created_at;
	private int viewed;

	@Override
	public String toString() {
		return "PostDo [seq=" + seq +
				", title=" + title + 
				", user=" + nickname +
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
