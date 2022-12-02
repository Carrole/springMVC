package com.spring.boardex.client;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.boardex.impl.BoardDo;

public class BoardClient {

	public static void main(String[] args) {
		ApplicationContext context = 
				new GenericXmlApplicationContext("BoardSetting.xml");
		
		BoardService bService = (BoardService)context.getBean("boardService");

		ArrayList<BoardDo> aList = bService.getBoardList();
		for(BoardDo temp : aList) {
			System.out.println("--> "+ temp.toString());
		}

		BoardDo bdo = new BoardDo();
		bdo.setSeq(2);
		
		bService.deleteBoard(bdo);

		ArrayList<BoardDo> aList2 = bService.getBoardList();
		for(BoardDo temp : aList2) {
			System.out.println("(����) --> "+ temp.toString());
		}		
	}
}
