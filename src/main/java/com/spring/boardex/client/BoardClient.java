package com.spring.boardex.client;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.boardex.impl.BoardDo;

public class BoardClient {

	public static void main(String[] args) {
//		JdbcUtil jutil = new JdbcUtil();
//		jutil.getConnection();	 
		
		ApplicationContext context = 
				new GenericXmlApplicationContext("BoardSetting.xml");
		
		BoardService bService = (BoardService)context.getBean("boardService");
		
		//1. �� ��� �����ϱ� 
//		BoardDo bdo = new BoardDo();
//		bdo.setTitle("title");
//		bdo.setWriter("writer");
//		bdo.setContent("content");
//		bService.insertBoard(bdo);
		
		//2. �� ��� ���� 
		ArrayList<BoardDo> aList = bService.getBoardList();
		for(BoardDo temp : aList) {
			System.out.println("--> "+ temp.toString());
		}
		
		//3. �� ���� 
//		BoardDo bdo = new BoardDo();
//		bdo.setSeq(2);
//		bdo.setTitle("�� ���� ����");
//		bdo.setContent("�� ���� ����");
//		bService.updateBoard(bdo);
////		
//		ArrayList<BoardDo> aList2 = bService.getBoardList();
//		for(BoardDo temp : aList2) {
//			System.out.println("(����) --> "+ temp.toString());
//		}		
		
		//4. �� ����
		BoardDo bdo = new BoardDo();
		bdo.setSeq(2);
		
		bService.deleteBoard(bdo);
//				
		ArrayList<BoardDo> aList2 = bService.getBoardList();
		for(BoardDo temp : aList2) {
			System.out.println("(����) --> "+ temp.toString());
		}		
	}

}
