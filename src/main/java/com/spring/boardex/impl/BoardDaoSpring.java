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
		System.out.println("insertBoard()(Spring JDBC) => Start !!");
		String sql = "insert into board (title, writer, content) "
				+ "values (?,?,?)";		
		jdbcTemplate.update(sql, bdo.getTitle(), bdo.getWriter(), bdo.getContent());
		System.out.println("insertBoard()(Spring JDBC) => End !!");
	}
	
	public BoardDo getBoard(BoardDo bdo) {
		System.out.println("getBoard()(Spring JDBC)  ==>");		
		String sql = "select * from board where seq=?";
		Object[] args = {bdo.getSeq()};
		return jdbcTemplate.queryForObject(sql, args, new BoardRowMapper());
	}
	
	public ArrayList<BoardDo> getBoardList(){	
		System.out.println("getBoardList ()(Spring JDBC) ==> ");
		String sql = "select * from board";
		Object[] args = {};
		return (ArrayList<BoardDo>)jdbcTemplate.query(sql, args, new BoardRowMapper());		
	}
	
	public void updateBoard(BoardDo bdo) {	
		System.out.println("updateBoard ()(Spring JDBC) ==> ");
		String sql = "update board set title=?, content=? where seq=?";
		jdbcTemplate.update(sql, bdo.getTitle(), bdo.getContent(), bdo.getSeq());
		
	}
	
	public void deleteBoard(BoardDo bdo) {
		System.out.println("deleteBoard ()(Spring JDBC) ==> ");		
		String sql = "delete from board where seq=?";		
		jdbcTemplate.update(sql, bdo.getSeq());
		
	}
	
	public ArrayList<BoardDo> searchBoardList(String searchCon, String searchKey){
		System.out.println("searchBoardList()(Spring JDBC) ==> ");
		String sql = "";
		if(searchCon.equals("title")) {
			sql = "select * from board where title=? order by seq desc";
		}
		else if(searchCon.equals("content")) {
			sql = "select * from board where content=? order by seq desc";
		}		
		Object [] args = {searchKey};
		return (ArrayList<BoardDo>) jdbcTemplate.query(sql, args, new BoardRowMapper());
	}
}


class BoardRowMapper implements RowMapper<BoardDo>{

	//@Override
	public BoardDo mapRow(ResultSet rs, int rowNum) throws SQLException {
		System.out.println("mapRow()(Spring JDBC ó��) ==> ");
		
		BoardDo bdo = new BoardDo();
		bdo.setSeq(rs.getInt(1));
		bdo.setTitle(rs.getString(2));
		bdo.setWriter(rs.getString(3));
		bdo.setContent(rs.getString(4));
		 
		return bdo;
	}
	
}
