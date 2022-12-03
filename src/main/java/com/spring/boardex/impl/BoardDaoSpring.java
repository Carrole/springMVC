package com.spring.boardex.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("boardDaoSpring")
public class BoardDaoSpring {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void insertBoard(BoardDo bdo) {
		String sql = "insert into post (title, users, content) "
				+ "values (?,?,?)";
		jdbcTemplate.update(sql, bdo.getTitle(), bdo.getUsers(), bdo.getContent());
	}
	
	public BoardDo getBoard(BoardDo bdo) {
		System.out.println(bdo);
		updateViewCount(bdo);
		String sql = "select * from post where seq=?";
		Object[] args = {bdo.getSeq()};
		return jdbcTemplate.queryForObject(sql, args, new BoardRowMapper());
	}
	
	public ArrayList<BoardDo> getBoardList(){
		String sql = "select * from post order by created_at desc";
		Object[] args = {};
		return (ArrayList<BoardDo>)jdbcTemplate.query(sql, args, new BoardRowMapper());		
	}
	
	public void updateBoard(BoardDo bdo) {
		String sql = "update post set title=?, content=? where seq=?";
		jdbcTemplate.update(sql, bdo.getTitle(), bdo.getContent(), bdo.getSeq());
	}

	public void updateViewCount(BoardDo bdo) {
		String sql = "update post set viewed=? where seq=?";
		jdbcTemplate.update(sql, bdo.getViewed() + 1, bdo.getSeq());
	}
	public void deleteBoard(BoardDo bdo) {
		String sql = "delete from post where seq=?";
		jdbcTemplate.update(sql, bdo.getSeq());
		
	}
	
	public ArrayList<BoardDo> searchBoardList(String searchCon, String searchKey){
		String sql = "";
		if(searchCon.equals("title")) {
			sql = "select * from post where title=? order by seq desc";
		}
		else if(searchCon.equals("content")) {
			sql = "select * from post where content=? order by seq desc";
		}
		else if(searchCon.equals("user")) {
			sql = "select * from post where user=? order by seq desc";
		}
		Object [] args = {searchKey};
		return (ArrayList<BoardDo>) jdbcTemplate.query(sql, args, new BoardRowMapper());
	}
}

class BoardRowMapper implements RowMapper<BoardDo>{

	//@Override
	public BoardDo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		BoardDo bdo = new BoardDo();
		bdo.setSeq(rs.getInt(1));
		bdo.setTitle(rs.getString(2));
		bdo.setUsers(rs.getString(3));
		bdo.setContent(rs.getString(4));
		bdo.setCreated_at(rs.getString(5));
		bdo.setViewed(rs.getInt(6));
		 
		return bdo;
	}
	
}
