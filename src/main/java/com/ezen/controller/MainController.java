package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.BoardDAO;
import coinweb.vo.BoardVO;


@Controller
public class MainController {
	

	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public String index(){
		
		
		return "index";
	}
}
