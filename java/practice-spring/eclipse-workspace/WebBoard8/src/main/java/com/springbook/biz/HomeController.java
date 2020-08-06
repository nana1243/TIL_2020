package com.springbook.biz;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	// Show main page
		@RequestMapping("/main.do")
		public ModelAndView main(ModelAndView mv) {
			mv.setViewName("main");
			return mv;
		}

	
}
