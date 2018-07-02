package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MypageController {
	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	public String index(){
		return "mypage/mypage";
	}
}
