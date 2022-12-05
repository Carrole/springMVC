package com.spring.comment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Repository("commentDaoSpring")
public class CommentDaoSpring {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insertComment(CommentDo cdo) {
		String sql = "insert into comment (content, post_id, nickname) "
				+ "values (?, ?, ?)";
		jdbcTemplate.update(sql, cdo.getContent(), cdo.getPost_id(), cdo.getNickname());
		// TODO: param check
	}

	public CommentDo getComment(CommentDo cdo) {
		String sql = "select * from comment where seq=?";
		Object[] args = {cdo.getSeq()};
		return jdbcTemplate.queryForObject(sql, args, new CommentRowMapper());
	}

	public ArrayList<CommentDo> getCommentList(int postId) {
		String sql = "select * from comment where post_id=? order by created_at desc";
		Object[] args = {postId};
		return (ArrayList<CommentDo>) jdbcTemplate.query(sql, args, new CommentRowMapper());
	}

	public CommentDo deleteComment(CommentDo cdo) {
		CommentDo deletedComment = getComment(cdo);
		String sql = "delete from comment where seq=?";
		jdbcTemplate.update(sql, cdo.getSeq());
		return deletedComment;
	}
}
class CommentRowMapper implements RowMapper<CommentDo>{

	//@Override
	public CommentDo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		CommentDo cdo = new CommentDo();
		cdo.setSeq(rs.getInt(1));
		cdo.setContent(rs.getString(2));
		cdo.setCreated_at(rs.getString(3));
		cdo.setPost_id(rs.getInt(4));
		cdo.setNickname(rs.getString(5));

		return cdo;
	}
	
}
