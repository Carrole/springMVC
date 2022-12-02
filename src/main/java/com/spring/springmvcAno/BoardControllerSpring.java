package com.spring.springmvcAno;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.boardex.impl.BoardDaoSpring;
import com.spring.boardex.impl.BoardDo;

@Controller
public class BoardControllerSpring {
	
	@Autowired
	BoardDaoSpring boardDaoSpring;
	
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard() {
		return "insertBoardView";
	}

	@RequestMapping(value="/insertProcBoard.do")
	public String insertProcBoard(BoardDo bdo) {
		boardDaoSpring.insertBoard(bdo);
		return "redirect:getBoardList.do";
	}
	
	
	@RequestMapping(value="/getBoard.do")
	public String getBoard(BoardDo bdo, BoardDaoSpring bdao, Model model) {
		BoardDo board = boardDaoSpring.getBoard(bdo);
		model.addAttribute("board", board);
				
		return "getBoardView";
	}
	
	@RequestMapping(value="getBoardList.do")
	public String getBoardList(BoardDo bdo, BoardDaoSpring bdao, Model model) {
		ArrayList<BoardDo> blist = boardDaoSpring.getBoardList();
		model.addAttribute("bList", blist);
		
		return "getBoardListView";
	}
	
	@RequestMapping(value="/modifyBoard.do")
	public String modifyBoard(BoardDo bdo, BoardDaoSpring bdao, Model model) {
		BoardDo board = boardDaoSpring.getBoard(bdo);
		model.addAttribute("board", board);
		 
		return "getModifyView";
	}
	
	@RequestMapping(value="/modifyProcBoard.do")
	public String modifyProcBoard(BoardDo bdo, BoardDaoSpring bdao, Model model) {
		boardDaoSpring.updateBoard(bdo);
		
		return "redirect:getBoardList.do";
	}

	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(BoardDo bdo, BoardDaoSpring bdao, Model model) {
		boardDaoSpring.deleteBoard(bdo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping(value="/searchBoardList.do")
	public String searchBoardList(
			@RequestParam(value="searchCon") String searchCon,
			@RequestParam(value="searchKey") String searchKey,
			Model model) {
		ArrayList<BoardDo> bList = boardDaoSpring.searchBoardList(searchCon, searchKey);
		model.addAttribute("bList", bList);
		
		return "getBoardListView";
	}
}
