package com.spring.post.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("postDaoSpring")
public class PostDaoSpring {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void insertPost(PostDo pdo) {
		String sql = "insert into post (title, nickname, content) "
				+ "values (?,?,?)";
		jdbcTemplate.update(sql, pdo.getTitle(), pdo.getNickname(), pdo.getContent());
	}
	
	public PostDo getPost(PostDo pdo) {
		System.out.println(pdo);
		String sql = "select * from post where seq=?";
		Object[] args = {pdo.getSeq()};
		PostDo post = jdbcTemplate.queryForObject(sql, args, new PostRowMapper());
		updateViewCount(post);
		post.setViewed(post.getViewed() + 1);
		return post;
	}
	
	public ArrayList<PostDo> getPostList(){
		String sql = "select * from post order by created_at desc";
		Object[] args = {};
		return (ArrayList<PostDo>)jdbcTemplate.query(sql, args, new PostRowMapper());
	}
	
	public void updatePost(PostDo pdo) {
		String sql = "update post set title=?, content=? where seq=?";
		jdbcTemplate.update(sql, pdo.getTitle(), pdo.getContent(), pdo.getSeq());
	}

	public void updateViewCount(PostDo pdo) {
		String sql = "update post set viewed=? where seq=?";
		jdbcTemplate.update(sql, pdo.getViewed() + 1, pdo.getSeq());
	}
	public void deletePost(PostDo pdo) {
		String sql = "delete from post where seq=?";
		jdbcTemplate.update(sql, pdo.getSeq());
		
	}
	
	public ArrayList<PostDo> searchPostList(String searchCon, String searchKey){
		String sql = "";
		if(searchKey.equals("")) {
			sql = "select * from post order by seq desc";
			return (ArrayList<PostDo>) jdbcTemplate.query(sql, new PostRowMapper());
		} else {
			if (searchCon.equals("title")) {
				sql = "select * from post where title=? order by seq desc";
			} else if (searchCon.equals("content")) {
				sql = "select * from post where content=? order by seq desc";
			} else if (searchCon.equals("users")) {
				sql = "select * from post where nickname=? order by seq desc";
			}
		}
		Object [] args = {searchKey};
		return (ArrayList<PostDo>) jdbcTemplate.query(sql, args, new PostRowMapper());
	}
}

class PostRowMapper implements RowMapper<PostDo>{

	//@Override
	public PostDo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		PostDo pdo = new PostDo();
		pdo.setSeq(rs.getInt(1));
		pdo.setTitle(rs.getString(2));
		pdo.setNickname(rs.getString(3));
		pdo.setContent(rs.getString(4));
		pdo.setCreated_at(rs.getString(5));
		pdo.setViewed(rs.getInt(6));
		 
		return pdo;
	}
	
}
