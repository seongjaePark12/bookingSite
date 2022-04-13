package com.spring.cw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

	@RequestMapping(value="/msg/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model , HttpSession session) {
		String name = session.getAttribute("sName")==null? "" : (String) session.getAttribute("sName");
		String strLevel = session.getAttribute("sStrLevel")==null? "" : (String) session.getAttribute("sStrLevel");
		
		if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("memIdCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다");
			model.addAttribute("url","member/join");
		}
		else if(msgFlag.equals("memEmailCheckNo")) {
			model.addAttribute("msg", "이메일이 중복되었습니다");
			model.addAttribute("url","member/join");
		}
		else if(msgFlag.equals("memJoinOk")) {
			model.addAttribute("msg", "회원가입되셨습니다");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("loginOk")) {
			model.addAttribute("msg", name+"님("+strLevel+") 로그인 되었습니다");
			model.addAttribute("url","member/main");
		}
		else if(msgFlag.equals("loginNo")) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("imforInputOk")) {
			model.addAttribute("msg", "시설이 등록되었습니다");
			model.addAttribute("url","admin/admin");
		}
		else if(msgFlag.equals("inputBankOk")) {
			model.addAttribute("msg", "은행정보가 등록되었습니다");
			model.addAttribute("url","admin/admin");
		}
		else if(msgFlag.equals("bookingInputOk")) {
			model.addAttribute("msg", "예약 되었습니다");
			model.addAttribute("url","member/main");
		}
		else if(msgFlag.equals("bookingInputOkA")) {
			model.addAttribute("msg", "예약 되었습니다");
			model.addAttribute("url","member/main");
		}
		
		return "include/message";
	}
}
