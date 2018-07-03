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
	
	@Autowired
	ServletContext context;		
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao = sqlSession.getMapper(coinweb.dao.BoardDAO.class);
		

		int startCount = 0;
		int pageSize = 5;	
	
		
		ArrayList<BoardVO> list =dao.getBoardList(startCount,pageSize);
		mv.setViewName("index");
		mv.addObject("list",list);
		
		
		return mv;
	}
}
