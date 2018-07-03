package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.MemberDAO;
import coinweb.vo.RankingVO;


@Controller
public class MypageController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	
	@RequestMapping(value="mypage.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView mypage( HttpSession session){
		ModelAndView mv = new ModelAndView();
		int id = ((Integer) session.getAttribute("sid"));
		MemberDAO dao =sqlSession.getMapper(coinweb.dao.MemberDAO.class);
		RankingVO vo = dao.getMypageResult(id);
		
		System.out.println("아이디값:"+id);

			mv.addObject("vo",vo);
			mv.setViewName("/mypage/mypage");
	
		
	return mv;
	}
}
