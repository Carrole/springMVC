package com.spring.boardex.client;

import java.util.ArrayList;

import com.spring.boardex.impl.BoardDo;

public interface BoardService {	
	//�� ���
	void insertBoard(BoardDo bdo);
	//�� ���
	ArrayList<BoardDo> getBoardList();
	//�� ���� 
	void updateBoard(BoardDo bdo);	
	//�� ���� 
	void deleteBoard(BoardDo bdo);
}