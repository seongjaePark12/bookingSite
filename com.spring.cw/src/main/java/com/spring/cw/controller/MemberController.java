package com.spring.cw.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cw.service.MemberService;
import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;
import com.spring.cw.vo.RefundVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	String msgFlag="";
	@Autowired
	MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 홈 호출
		@RequestMapping(value="/login", method = RequestMethod.GET)
		public String loginGet(HttpServletRequest request) {
			// 로그인폼 호출시 기존에 저장된 쿠키가 있으면 불러올수 있게 한다.
			Cookie[] cookies = request.getCookies();	// 기존에 저장된 현재 사이트의 쿠키를 불러와서 배열로 저장한다.
			String mid = "";
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					mid = cookies[i].getValue();
					request.setAttribute("mid", mid);
					break;
				}
			}
			return "member/login";
		}
		// 로그인 인증처리
		@RequestMapping(value="/login", method = RequestMethod.POST)
		public String loginPost(String CW_USER_MID, String CW_USER_PWD, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
			MemberVO vo = memberService.getIdCheck(CW_USER_MID);
			
			if(vo != null && passwordEncoder.matches(CW_USER_PWD, vo.getCW_USER_PWD())) {
				String strLevel = "";
				if(vo.getCW_USER_LEVEL() == 1) strLevel = "관리자";
				else if(vo.getCW_USER_LEVEL() == 0) strLevel = "회원";
				session.setAttribute("sMid", CW_USER_MID);
				session.setAttribute("sName", vo.getCW_USER_NAME());
				session.setAttribute("sBirth", vo.getCW_USER_BIRTH());
				session.setAttribute("sNum", vo.getCW_USER_NUMBER());
				session.setAttribute("sLevel", vo.getCW_USER_LEVEL());
				session.setAttribute("sJoinday", vo.getCW_USER_JOINDAY());
				session.setAttribute("sLastday", vo.getCW_USER_LASTDATE());
				session.setAttribute("sVisitcnt", vo.getCW_USER_VISITCNT());
				session.setAttribute("sStrLevel", strLevel);
				//쿠키 처리
				// 아이디에 대한 정보를 쿠키로 저장처리...
				String idCheck = request.getParameter("remember")==null? "" : request.getParameter("remember");
				// 쿠키 처리(아이디에 대한 정보를 쿠키로 저장할지를 처리한다)-jsp에서 idCheck변수에 값이 체크되어서 넘어오면 'on'값이 담겨서 넘어오게 된다.
				if(idCheck.equals("on")) {				// 앞의 jsp에서 쿠키를 저장하겠다고 넘겼을경우...
					Cookie cookie = new Cookie("cMid", CW_USER_MID);
					cookie.setMaxAge(60*60*24*4); 	// 쿠키의 만료시간을 4일로 정했다.(단위: 초)
					response.addCookie(cookie);
				}
				else {		// jsp에서 쿠키저장을 취소해서 보낸다면? 쿠키명을 삭제처리한다.
					Cookie[] cookies = request.getCookies();	// 기존에 저장되어 있는 현재 사이트의 쿠키를 불러와서 배열로 저장한다.
					for(int i=0; i<cookies.length; i++) {
						if(cookies[i].getName().equals("cMid")) {
							cookies[i].setMaxAge(0);		//  저장된 쿠키명중 'cMid' 쿠키를 찾아서 삭제한다.
							response.addCookie(cookies[i]);
							break;
						}
					}
				}
				// 로그인 인증후에 최종 방문일자/시간 업데이트
				memberService.setVisitUpdate(CW_USER_MID);
				msgFlag = "loginOk";
			}
			else {
				msgFlag = "loginNo";
			}
			return "redirect:/msg/"+msgFlag;
		}
		
		// 회원 가입폼
		@RequestMapping(value="/join", method = RequestMethod.GET)
		public String joinGet() {
			return "member/join";
		}
		
		// 회원 가입처리하기
		@RequestMapping(value="/join", method = RequestMethod.POST)
		public String joinPost(MemberVO vo) {
			// 비밀번호 암호화 처리
			vo.setCW_USER_PWD(passwordEncoder.encode(vo.getCW_USER_PWD()));
			// DB에 가입회원 등록하기
		    memberService.setMemJoin(vo);
		    msgFlag = "memJoinOk";
		    return "redirect:/msg/" + msgFlag;
		}
		// 로그인 후 메인
		@RequestMapping(value="/main", method = RequestMethod.GET)
		public String mainGet(HttpSession session, Model model) {
			session.getAttribute("sMid");
			return "main/main";
		}
		// 로그아웃
		@RequestMapping(value="/logout", method = RequestMethod.GET)
		public String logoutGet(HttpSession session) {
			session.invalidate();
			return "redirect:/member/login";
		}
		// 예약 홈
		@RequestMapping(value="/booking", method = RequestMethod.GET)
		public String bookingGet(Model model) {
			ArrayList<ImformationVO> vos = new ArrayList<ImformationVO>();
			vos = memberService.imforList1();
			model.addAttribute("vos",vos);
			return "member/booking";
		}
		// 예약 홈
		@RequestMapping(value="/bookingA", method = RequestMethod.GET)
		public String bookingAGet(Model model,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue = "3", required = false) int pageSize,
				@RequestParam(name="start", defaultValue="", required=false)String start,
				@RequestParam(name="end", defaultValue="", required=false)String end,
				@RequestParam(name="FA_GROUP", defaultValue="", required=false)String FA_GROUP,
				@RequestParam(name="FA_FNAME", defaultValue="", required=false)String FA_FNAME,
				@RequestParam(name="FA_METHOD", defaultValue="", required=false)String FA_METHOD,
				String FA_DATE) {
			int totRecCnt = memberService.viewCnt();
			int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;
			int blockSize = 3;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			ArrayList<ImformationVO> vos = new ArrayList<ImformationVO>();
			vos = memberService.imforList(FA_GROUP,FA_FNAME,FA_METHOD,start,end,FA_DATE,startIndexNo,pageSize);
			model.addAttribute("vos",vos);
			model.addAttribute("pag", pag);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("totPage", totPage);
			model.addAttribute("curScrStartNo", curScrStartNo);
			model.addAttribute("blockSize", blockSize);
			model.addAttribute("curBlock", curBlock);
			model.addAttribute("lastBlock", lastBlock);
			model.addAttribute("FA_DATE",FA_DATE);
			model.addAttribute("FA_GROUP",FA_GROUP);
			model.addAttribute("FA_FNAME",FA_FNAME);
			model.addAttribute("FA_METHOD",FA_METHOD);
			model.addAttribute("start",start);
			model.addAttribute("end",end);
			return "member/bookingA";
		}
		// 예약 홈
		@RequestMapping(value="/bookingGo", method = RequestMethod.GET)
		public String bookingGoGet(int FA_NO,Model model) {
			ImformationVO vo = memberService.imforListGo(FA_NO);
			model.addAttribute("vo",vo);
			return "member/bookingGo";
		}
		// 예약하기
		@RequestMapping(value="/bookingGo", method = RequestMethod.POST)
		public String bookingGoPost(BookingVO vo,Model model) {
			memberService.bookingInput(vo);
			msgFlag = "bookingInputOk";
		    return "redirect:/msg/" + msgFlag;
		}
		// 예약 신청 홈 
		@RequestMapping(value="/bookingGoAB", method = RequestMethod.GET)
		public String bookingGoABGet(int FA_NO,Model model,HttpSession session) {
			ImformationVO vo = memberService.imforListGo(FA_NO);
			model.addAttribute("vo",vo);
			return "member/bookingGoAB";
		}
		// 예약신청이동창?
		@ResponseBody
		@RequestMapping(value="/bookingBooking", method = RequestMethod.POST)
		public String bookingBookingGet(int FA_NO) {
			return "";
		}
		// 예약 홈
		@RequestMapping(value="/bookingGoA", method = RequestMethod.GET)
		public String bookingGoAGet(int FA_NO,Model model,HttpSession session,
				@RequestParam(name="BOOKING_USEDAY", defaultValue="", required=false)String BOOKING_USEDAY,
				@RequestParam(name="BOOKING_USETIME1", defaultValue="", required=false)String BOOKING_USETIME1,
				@RequestParam(name="BOOKING_USETIME2", defaultValue="", required=false)String BOOKING_USETIME2) {
			ImformationVO vo = memberService.imforListGo(FA_NO);
			model.addAttribute("vo",vo);
			model.addAttribute("BOOKING_USEDAY",BOOKING_USEDAY);
			model.addAttribute("BOOKING_USETIME1",BOOKING_USETIME1);
			model.addAttribute("BOOKING_USETIME2",BOOKING_USETIME2);
			return "member/bookingGoA";
		}
		// 예약하기
		@RequestMapping(value="/bookingGoA", method = RequestMethod.POST)
		public String bookingGoAPost(BookingVO vo,Model model) {
			System.out.println(vo);
			memberService.bookingInput(vo);
			
			msgFlag = "bookingInputOkA";
			return "redirect:/msg/" + msgFlag;
		}
		// 예약내역 홈
		@RequestMapping(value="/bookingList", method = RequestMethod.GET)
		public String bookingListGet(Model model) {
			ArrayList<BookingVO> vos = memberService.bookingList();
			model.addAttribute("vos",vos);
			return "member/bookingList";
		}
		// 예약내역 보기
		@RequestMapping(value="/bookingListGo", method = RequestMethod.GET)
		public String bookingListGoGet(int BOOKING_NO,Model model,String FA_FNAME) {
			BookingVO vo = memberService.bookingListGo(BOOKING_NO);
			ImformationVO vo1 = memberService.bookingListImfor(FA_FNAME);
			model.addAttribute("vo",vo);
			model.addAttribute("vo1",vo1);
			return "member/bookingGoList";
		}
		// 예약내역 홈
		@RequestMapping(value="/bookingListA", method = RequestMethod.GET)
		public String bookingListAGet(Model model,HttpSession session,
				@RequestParam(name="FA_FNAME", defaultValue="", required=false)String FA_FNAME) {
			String name = (String) session.getAttribute("sName");
			String number = (String) session.getAttribute("sNum");
			ArrayList<BookingVO> vos = memberService.bookingListA(name,number,FA_FNAME);
			model.addAttribute("vos",vos);
			model.addAttribute("FA_FNAME",FA_FNAME);
			return "member/bookingListA";
		}
		// 예약내역 보기
		@RequestMapping(value="/bookingListGoA", method = RequestMethod.GET)
		public String bookingListGoAGet(int BOOKING_NO,Model model,String FA_FNAME) {
			BookingVO vo = memberService.bookingListGo(BOOKING_NO);
			ImformationVO vo1 = memberService.bookingListImfor(FA_FNAME);
			model.addAttribute("vo",vo);
			model.addAttribute("vo1",vo1);
			return "member/bookingGoListA";
		}
		// 예약취소
		@ResponseBody
		@RequestMapping(value="/bookingxx", method = RequestMethod.POST)
		public String bookingxxGet(int BOOKING_NO,String BOOKING_STATUS, String BOOKING_DELETE) {
			memberService.bookingxx(BOOKING_NO,BOOKING_STATUS,BOOKING_DELETE);
			return "";
		}
		// 예약삭제
		@RequestMapping(value="/bookingListGo", method = RequestMethod.POST)
		public String bookingListGoPost(int BOOKING_NO) {
			memberService.bookingDelete(BOOKING_NO);
			return "redirect:/member/bookingList";
		}
		// 예약 수정홈
		@RequestMapping(value="/bookingUpdate", method = RequestMethod.GET)
		public String bookingUpdateGet(int BOOKING_NO,Model model,String FA_FNAME) {
			BookingVO vo = memberService.bookingListGo(BOOKING_NO);
			ImformationVO vo1 = memberService.bookingListImfor(FA_FNAME);
			model.addAttribute("vo",vo);
			model.addAttribute("vo1",vo1);
			return "member/bookingUpdate";
		}
		// 예약 수정
		@RequestMapping(value="/bookingUpdate", method = RequestMethod.POST)
		public String bookingUpdatePost(BookingVO vo,int BOOKING_NO) {
			memberService.bookingUpdate(vo, BOOKING_NO);
			return "redirect:/member/bookingList";
		}
		// 환불 홈
		@RequestMapping(value="/refund", method = RequestMethod.GET)
		public String refundGet(int BOOKING_NO,Model model,String FA_FNAME) {
			BookingVO vo = memberService.bookingListGo(BOOKING_NO);
			ImformationVO vo1 = memberService.bookingListImfor(FA_FNAME);
			RefundVO vo2 = memberService.refundView(BOOKING_NO);
			model.addAttribute("vo",vo);
			model.addAttribute("vo1",vo1);
			model.addAttribute("vo2",vo2);
			return "member/refund";
		}
		// 환불계좌입력
		@ResponseBody
		@RequestMapping(value="/refundBankOk", method = RequestMethod.POST)
		public String refundBankOkPost(int BOOKING_NO,String CW_USER_NAME, String USER_BANK_NAME, String USER_BANK_NUM, String USER_NAME, String REFUND_BIGO) {
			memberService.refundBankOk(BOOKING_NO,CW_USER_NAME,USER_BANK_NAME,USER_BANK_NUM,USER_NAME,REFUND_BIGO);
			return "";
		}
		// 환불계좌수정
		@ResponseBody
		@RequestMapping(value="/refundBankUpdate", method = RequestMethod.POST)
		public String refundBankUpdatePost(int REFUND_NO,int BOOKING_NO,String CW_USER_NAME, String USER_BANK_NAME, String USER_BANK_NUM, String USER_NAME, String REFUND_BIGO) {
			memberService.refundBankUpdate(REFUND_NO,BOOKING_NO,CW_USER_NAME,USER_BANK_NAME,USER_BANK_NUM,USER_NAME,REFUND_BIGO);
			return "";
		}
		// 환불
		@ResponseBody
		@RequestMapping(value="/refundOk", method = RequestMethod.POST)
		public String refundOkPost(int BOOKING_NO,String BOOKING_DELETE) {
			memberService.refundOk(BOOKING_NO,BOOKING_DELETE);
			return "";
		}
		// 회원탈퇴
		@ResponseBody
		@RequestMapping(value="/userDel", method = RequestMethod.POST)
		public String userDelPost(HttpSession session,String CW_USER_MID) {
			memberService.userDel(CW_USER_MID);
			session.invalidate();
			return "";
		}
		// 아이디 중복체크
		@ResponseBody
		@RequestMapping(value="/idCheck", method = RequestMethod.POST)
		public String idCheckPost(String CW_USER_MID) {
			String res = "0";
			MemberVO vo = memberService.idCheck(CW_USER_MID);
			if(vo != null) res = "1";
			return res;
		}
}
