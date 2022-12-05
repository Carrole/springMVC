package com.spring.springmvcAno;

import com.spring.user.impl.UserDo;
import com.spring.user.impl.UserDaoSpring;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;

@Controller
public class UserControllerSpring {
	
	@Autowired
	UserDaoSpring userDaoSpring;
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "login";
	}

	@RequestMapping(value="/loginProc.do")
	public String loginProc(UserDo udo, RedirectAttributes rttr) {
		String inputPassword = udo.getPassword();
		UserDo user = userDaoSpring.getUserByNickname(udo.getNickname());
		String message = "success";
		if(user == null) {
			message = "none";
			rttr.addFlashAttribute("message", message);
			return "redirect:login.do";
		}

		if (inputPassword.equals(user.getPassword())) {
			rttr.addFlashAttribute("message", message);
			rttr.addFlashAttribute("currentUser", user.getNickname());
			return "redirect:getPostList.do";
		} else {
			message = "invalid";
			rttr.addFlashAttribute("message", message);
			return "redirect:login.do";
		}
	}

	@RequestMapping(value="/signup.do")
	public String signup() {
		return "signup";
	}

	@RequestMapping(value="/signupProc.do")
	public String signupProc(UserDo udo, RedirectAttributes redirectAttributes) {
		UserDo existingUser = userDaoSpring.getUserByNickname(udo.getNickname());
		String message = "";
		if (existingUser != null) {
			message = "already exists";
			redirectAttributes.addFlashAttribute("message", message);
			return "redirect:signup.do";
		} else {
			userDaoSpring.addUser(udo);
//			model.addAttribute("message", message);
			return "login";
		}
	}
}
