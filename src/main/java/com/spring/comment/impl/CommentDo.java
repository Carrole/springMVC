package com.spring.comment.impl;

public class CommentDo {
	private int seq;
	private String content;
	private String created_at;
	private int post_id;
	private String nickname;
	
	@Override
	public String toString() {
		return "CommentDo [seq=" + seq +
				", post_id=" + post_id +
				", content=" + content +
				", created_at=" + created_at +
				",nickname=" + nickname + "]";
	}

	public CommentDo() {
	}


	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
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

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
