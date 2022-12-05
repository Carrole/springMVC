package com.spring.springmvcAno;

import java.util.ArrayList;

import com.spring.comment.impl.CommentDaoSpring;
import com.spring.comment.impl.CommentDo;
import com.spring.user.impl.UserDaoSpring;
import com.spring.user.impl.UserDo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.post.impl.PostDaoSpring;
import com.spring.post.impl.PostDo;

@Controller
public class PostControllerSpring {
	
	@Autowired
	PostDaoSpring postDaoSpring;

	@Autowired
	CommentDaoSpring commentDaoSpring;

	@Autowired
	UserDaoSpring userDaoSpring;
	
	@RequestMapping(value="/insertPost.do")
	public String insertPost() {
		return "insertPostView";
	}

	@RequestMapping(value="/insertProcPost.do")
	public String insertProcPost(PostDo pdo) {
		postDaoSpring.insertPost(pdo);
		return "redirect:getPostList.do";
	}
	
	
	@RequestMapping(value="/getPost.do")
	public String getPost(PostDo pdo, PostDaoSpring bdao, Model model) {
		PostDo post = postDaoSpring.getPost(pdo);
		ArrayList<CommentDo> clist = new ArrayList<CommentDo>();
		String message = "success";
		clist = commentDaoSpring.getCommentList(pdo.getSeq());
		UserDo user = userDaoSpring.getUserByNickname(post.getNickname());

		if(clist.size() == 0) {
			message = "empty";
		}

		model.addAttribute("commentCount", clist.size());
		model.addAttribute("post", post);
		model.addAttribute("clist", clist);
		model.addAttribute("user", user);
		model.addAttribute("message", message);

		return "getPostView";
	}
	
	@RequestMapping(value="getPostList.do")
	public String getPostList(PostDo pdo, Model model) {
		ArrayList<PostDo> plist = postDaoSpring.getPostList();

		model.addAttribute("plist", plist);

		return "getPostListView";
	}
	
	@RequestMapping(value="/modifyPost.do")
	public String modifyPost(PostDo pdo, Model model) {
		PostDo post = postDaoSpring.getPost(pdo);
		model.addAttribute("post", post);
		 
		return "getPostModifyView";
	}
	
	@RequestMapping(value="/modifyProcPost.do")
	public String modifyProcPost(PostDo pdo) {
		postDaoSpring.updatePost(pdo);
		return "redirect:getPost.do?seq=" + pdo.getSeq();
	}

	@RequestMapping(value="/deletePost.do")
	public String deletePost(PostDo pdo) {
		postDaoSpring.deletePost(pdo);
		return "redirect:getPostList.do";
	}
	
	@RequestMapping(value="/searchPostList.do")
	public String searchPostList(
			@RequestParam(value="searchCon") String searchCon,
			@RequestParam(value="searchKey") String searchKey,
			Model model) {
		ArrayList<PostDo> plist = postDaoSpring.searchPostList(searchCon, searchKey);
		model.addAttribute("plist", plist);
		
		return "getPostListView";
	}
}
