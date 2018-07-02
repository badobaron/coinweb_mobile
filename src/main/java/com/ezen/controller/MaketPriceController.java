package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.WalletDAO;
import coinweb.vo.WalletVO;

@Controller
public class MaketPriceController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="market_price.do", method=RequestMethod.GET)
	public ModelAndView business(HttpSession session){
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/market_price/market_price");
				
		return mv;
	}
}
