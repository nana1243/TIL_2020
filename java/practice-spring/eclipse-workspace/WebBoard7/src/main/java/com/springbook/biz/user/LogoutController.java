package com.springbook.biz.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.stereotype.Controller;


@Controller
public class LogoutController {
	
	@RequestMapping(value="/logout.do")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("Logout");
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.invalidate();

		mv.setViewName("login.jsp");
		return mv;
	}
	
	
	
	

}
