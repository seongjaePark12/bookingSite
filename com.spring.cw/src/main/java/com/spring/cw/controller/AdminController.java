package com.spring.cw.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cw.service.AdminService;
import com.spring.cw.service.MemberService;
import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag="";
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	
		// 관리자 홈 호출
		@RequestMapping(value="/admin", method = RequestMethod.GET)
		public String adminGet() {
			return "admin/admin";
		}
		// 회원 홈 호출
		@RequestMapping(value="/member", method = RequestMethod.GET)
		public String memberGet(Model model) {
			ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
			vos = adminService.memberSerch();
			model.addAttribute("vos",vos);
			return "admin/member";
		}
		// 시설등록 홈 호출
		@RequestMapping(value="/input", method = RequestMethod.GET)
		public String inputGet() {
			return "admin/input";
		}
		// 시설등록
		@RequestMapping(value="/input", method = RequestMethod.POST)
		public String inputPost(MultipartFile file, ImformationVO vo) {
			adminService.imforInput(file,vo);
			msgFlag = "imforInputOk";
		    return "redirect:/msg/" + msgFlag;
		}
		// 시설은행정보 홈 호출
		@RequestMapping(value="/inputBank", method = RequestMethod.GET)
		public String inputBankGet(Model model) {
			ArrayList<ImformationVO> vos = adminService.closeBank();
			model.addAttribute("vos",vos);
			return "admin/inputBank";
		}
		// 시설은행정보 등록
		@RequestMapping(value="/inputBank", method = RequestMethod.POST)
		public String inputBankPost(ImformationVO vo, String FA_FNAME) {
			adminService.inputBankInput(vo,FA_FNAME);
			msgFlag = "inputBankOk";
			return "redirect:/msg/" + msgFlag;
		}
		// 예약내역 홈 호출
		@RequestMapping(value="/booking", method = RequestMethod.GET)
		public String bookingGet() {
			return "admin/booking";
		}
		// 시설현황 홈 호출
		@RequestMapping(value="/view", method = RequestMethod.GET)
		public String viewGet(Model model,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
				@RequestParam(name="start", defaultValue="", required=false)String start,
				@RequestParam(name="end", defaultValue="", required=false)String end,
				@RequestParam(name="FA_GROUP", defaultValue="", required=false)String FA_GROUP,
				@RequestParam(name="FA_FNAME", defaultValue="", required=false)String FA_FNAME,
				@RequestParam(name="FA_METHOD", defaultValue="", required=false)String FA_METHOD,
				String FA_DATE) {
			int totRecCnt = adminService.viewCnt();
			int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;
			int blockSize = 3;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			ArrayList<ImformationVO> vos = new ArrayList<ImformationVO>();
			vos = adminService.imadminList(FA_GROUP,FA_FNAME,FA_METHOD,start,end,FA_DATE,startIndexNo,pageSize);
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
			return "admin/view";
		}
		// 표시변경
		@ResponseBody
		@RequestMapping(value="/showUpdate", method = RequestMethod.POST)
		public String showUpdatePost(int FA_NO,String FA_SHOW) {
			adminService.showUpdate(FA_NO,FA_SHOW);
			return "";
		}
		// 시설삭제
		@ResponseBody
		@RequestMapping(value="/showDelete", method = RequestMethod.POST)
		public String showDeletePost(int FA_NO) {
			adminService.showDelete(FA_NO);
			return "";
		}
		// 시설 수정 홈
		@RequestMapping(value="/viewUpdate", method = RequestMethod.GET)
		public String viewUpdateGet(Model model,int FA_NO) {
			ImformationVO vo = adminService.viewUpdate(FA_NO);
			model.addAttribute("vo",vo);
			return "admin/viewUpdate";
		}
		// 시설 수정하기
		@RequestMapping(value="/viewUpdate", method = RequestMethod.POST)
		public String viewUpdatePost(MultipartFile file, ImformationVO vo) {
			adminService.viewUpdateOk(file,vo);
			return "redirect:/admin/view";
		}
		// 시설 예약보기
		@RequestMapping(value="/viewBooking", method = RequestMethod.GET)
		public String viewBookingGet(Model model,int FA_NO,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
				@RequestParam(name="BOOKING_USEDAY", defaultValue="", required=false) String BOOKING_USEDAY,
				@RequestParam(name="BOOKING_STATUS", defaultValue="", required=false)String BOOKING_STATUS,
				@RequestParam(name="BOOKING_APPROVAL", defaultValue="", required=false)String BOOKING_APPROVAL, 
				@RequestParam(name="BOOKING_PAYMENT", defaultValue="", required=false)String BOOKING_PAYMENT,
				@RequestParam(name="CW_USER_NAME", defaultValue="", required=false)String CW_USER_NAME,
				@RequestParam(name="CW_USER_NUMBER", defaultValue="", required=false)String CW_USER_NUMBER) {
			int totRecCnt = adminService.boogkingCnt(FA_NO);
			int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;
			int blockSize = 3;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			ArrayList<BookingVO> vos = new ArrayList<BookingVO>();
			vos = adminService.viewBooking(FA_NO,BOOKING_USEDAY,BOOKING_STATUS,BOOKING_APPROVAL,BOOKING_PAYMENT,CW_USER_NAME,CW_USER_NUMBER,startIndexNo,pageSize);
			BookingVO vovo = adminService.viewBookingFind(FA_NO);
			int mem = adminService.viewBookingBoo(FA_NO);
			int m1 = adminService.bookingCnt1(FA_NO);
			int m2 = adminService.bookingCnt2(FA_NO);
			int m3 = adminService.bookingCnt3(FA_NO);
			int m4 = adminService.bookingCnt4(FA_NO);
			int m5 = adminService.bookingCnt5(FA_NO);
			int m6 = adminService.bookingCnt6(FA_NO);
			int m7 = adminService.bookingCnt7(FA_NO);
			int m8 = adminService.bookingCnt8(FA_NO);
			model.addAttribute("vos",vos);
			model.addAttribute("vovo",vovo);
			model.addAttribute("mem",mem);
			model.addAttribute("FA_NO",FA_NO);
			model.addAttribute("pag", pag);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("totPage", totPage);
			model.addAttribute("curScrStartNo", curScrStartNo);
			model.addAttribute("blockSize", blockSize);
			model.addAttribute("curBlock", curBlock);
			model.addAttribute("lastBlock", lastBlock);
			model.addAttribute("BOOKING_USEDAY",BOOKING_USEDAY);
			model.addAttribute("BOOKING_STATUS",BOOKING_STATUS);
			model.addAttribute("BOOKING_APPROVAL",BOOKING_APPROVAL);
			model.addAttribute("BOOKING_PAYMENT",BOOKING_PAYMENT);
			model.addAttribute("CW_USER_NAME",CW_USER_NAME);
			model.addAttribute("CW_USER_NUMBER",CW_USER_NUMBER);
			model.addAttribute("m1",m1);
			model.addAttribute("m2",m2);
			model.addAttribute("m3",m3);
			model.addAttribute("m4",m4);
			model.addAttribute("m5",m5);
			model.addAttribute("m6",m6);
			model.addAttribute("m7",m7);
			model.addAttribute("m8",m8);
			return "admin/viewBooking";
		}
		// 시설 휴관 홈
		@RequestMapping(value="/closeView", method = RequestMethod.GET)
		public String closeViewGet(Model model,int FA_NO) {
			ArrayList<ImformationVO> vos = adminService.close(FA_NO);
			model.addAttribute("FA_NO",FA_NO);
			model.addAttribute("vos",vos);
			return "admin/closeView";
		}
		// 시설 휴관 등록 홈
		@RequestMapping(value="/closeInput", method = RequestMethod.GET)
		public String viewCloseInputGet(Model model,int FA_NO) {
			ImformationVO vo = adminService.viewUpdate(FA_NO);
			model.addAttribute("vo",vo);
			model.addAttribute("FA_NO",FA_NO);
			return "admin/closeInput";
		}
		// 시설 휴관 등록
		@ResponseBody
		@RequestMapping(value="/closeInputUP", method = RequestMethod.POST)
		public String viewCloseInputPost(String FA_FNAME,String FA_CLOSE_START,String FA_CLOSE_END,
				@RequestParam(value="FA_CLOSE_DAY[]") String FA_CLOSE_DAY,int FA_NO) {
			System.out.println(FA_FNAME+"//"+FA_CLOSE_START+"//"+FA_CLOSE_END+"//"+FA_CLOSE_DAY);
			adminService.closeInput(FA_NO,FA_FNAME,FA_CLOSE_START,FA_CLOSE_END,FA_CLOSE_DAY);
			return "";
		}
		// 휴관일 삭제
		@ResponseBody
		@RequestMapping(value="/closeDelete", method = RequestMethod.POST)
		public String closeDeletePost(int FA_NO) {
			adminService.closeDelete(FA_NO);
			return "";
		}
		// 환불관리 홈
		@RequestMapping(value="/refund", method = RequestMethod.GET)
		public String refundGet(Model model,int FA_NO,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
				@RequestParam(name="CW_USER_NAME", defaultValue="", required=false)String CW_USER_NAME,
				@RequestParam(name="CW_USER_NUMBER", defaultValue="", required=false)String CW_USER_NUMBER
				) {
			int totRecCnt = adminService.refundCnt1(FA_NO);
			int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
			int startIndexNo = (pag - 1) * pageSize;
			int curScrStartNo = totRecCnt - startIndexNo;
			int blockSize = 3;
			int curBlock = (pag - 1) / blockSize;
			int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
			ArrayList<BookingVO> vos = new ArrayList<BookingVO>();
			vos = adminService.refundList(FA_NO,CW_USER_NAME,CW_USER_NUMBER,startIndexNo,pageSize);
			BookingVO vovo = adminService.viewBookingFind(FA_NO);
			int r1 = adminService.refundCnt1(FA_NO);
			int r2 = adminService.refundCnt2();
			int r3 = adminService.refundCnt3();
			model.addAttribute("vovo",vovo);
			model.addAttribute("r1",r1);
			model.addAttribute("r2",r2);
			model.addAttribute("r3",r3);
			model.addAttribute("vos",vos);
			model.addAttribute("FA_NO",FA_NO);
			model.addAttribute("pag", pag);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("totPage", totPage);
			model.addAttribute("curScrStartNo", curScrStartNo);
			model.addAttribute("blockSize", blockSize);
			model.addAttribute("curBlock", curBlock);
			model.addAttribute("lastBlock", lastBlock);
			model.addAttribute("CW_USER_NAME",CW_USER_NAME);
			model.addAttribute("CW_USER_NUMBER",CW_USER_NUMBER);
			return "admin/refund";
		}
		// 관리자 예약 수정홈
		@RequestMapping(value="/booUpdate", method = RequestMethod.GET)
		public String booUpdateGet(Model model,int FA_NO) {
			BookingVO vo = adminService.viewBookingFind(FA_NO);
			model.addAttribute("vo",vo);
			return "admin/booUpdate";
		}
		// 관리자 예약 수정
		@ResponseBody
		@RequestMapping(value="/bookUpdate", method = RequestMethod.POST)
		public String booUpdatePost(int BOOKING_NO,String CW_USER_NAME,String CW_USER_NUMBER,String BOOKING_POU,String BOOKING_PERSONNEL,String BOOKING_USETIME,String BOOKING_USEDAY,String CW_USER_HOBBY,String CW_USER_BIRTH) {
			adminService.bookingUpdate(BOOKING_NO,CW_USER_BIRTH,CW_USER_HOBBY,BOOKING_USEDAY,BOOKING_USETIME,BOOKING_PERSONNEL,CW_USER_NAME,CW_USER_NUMBER,BOOKING_POU);
			return "";
		}
		// 승인변경
		@ResponseBody
		@RequestMapping(value="/approvalUpdate", method = RequestMethod.POST)
		public String approvalUpdatePost(int BOOKING_NO,String BOOKING_APPROVAL) {
			adminService.approvalUpdate(BOOKING_NO,BOOKING_APPROVAL);
			return "";
		}
		// 결제상태변경
		@ResponseBody
		@RequestMapping(value="/paymentUpdate", method = RequestMethod.POST)
		public String paymentUpdatePost(int BOOKING_NO,String BOOKING_PAYMENT) {
			adminService.paymentUpdate(BOOKING_NO,BOOKING_PAYMENT);
			return "";
		}
		// 관리자 권한으로 예약취소
		@ResponseBody
		@RequestMapping(value="/booDelete", method = RequestMethod.POST)
		public String booDeletePost(int BOOKING_NO) {
			adminService.booDelete(BOOKING_NO);
			return "";
		}
		// 관리자 권한으로 예약취소
		@ResponseBody
		@RequestMapping(value="/userDel", method = RequestMethod.POST)
		public String userDelPost(int CW_USER_NO) {
			adminService.userDel(CW_USER_NO);
			return "";
		}
}
