package com.spring.springmvcAno;
;
import com.spring.comment.impl.CommentDaoSpring;
import com.spring.comment.impl.CommentDo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CommentControllerSpring {
	
	@Autowired
	CommentDaoSpring commentDaoSpring;

	@RequestMapping(value="/insertComment.do")
	public String insertComment(CommentDo cdo) {
		System.out.println(cdo.getPost_id());
		commentDaoSpring.insertComment(cdo);
		return "redirect:getBoard.do?seq=" + cdo.getPost_id();
	}

	@RequestMapping(value="/deleteComment.do")
	public String deleteComment(CommentDo cdo) {
		CommentDo deletedComment = commentDaoSpring.deleteComment(cdo);
		System.out.println(deletedComment);
		System.out.println("deleted");
		return "redirect:getBoard.do?seq=" + deletedComment.getPost_id();
	}
}
