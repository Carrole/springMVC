package com.spring.boardex.client;

import java.util.ArrayList;

import com.spring.boardex.impl.BoardDo;

public interface BoardService {	
	//글 등록
	void insertBoard(BoardDo bdo);
	//글 목록
	ArrayList<BoardDo> getBoardList();
	//글 수정 
	void updateBoard(BoardDo bdo);	
	//글 삭제 
	void deleteBoard(BoardDo bdo);
}
