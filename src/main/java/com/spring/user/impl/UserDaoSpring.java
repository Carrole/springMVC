package com.spring.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository("userDaoSpring")
public class UserDaoSpring {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void addUser(UserDo udo) {
		String sql = "insert into user (nickname, password) "
				+ "values (?, ?)";
		jdbcTemplate.update(sql, udo.getNickname(), udo.getPassword());
	}

	public UserDo getUserByNickname(String nickname) {
		try {
			String sql = "select * from user where nickname=?";
			Object[] args = {nickname};
			return jdbcTemplate.queryForObject(sql, args, new UserRowWrapper());
		} catch (NullPointerException e) {
			return null;
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
}
class UserRowWrapper implements RowMapper<UserDo>{

	//@Override
	public UserDo mapRow(ResultSet rs, int rowNum) throws SQLException {

		UserDo udo = new UserDo();
		udo.setNickname(rs.getString(1));
		udo.setPassword(rs.getString(2));
		udo.setCreated_at(rs.getString(3));

		return udo;
	}
}
