package com.spring.cw.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;

public interface AdminService {

	public ArrayList<MemberVO> memberSerch();

	public void imforInput(MultipartFile file, ImformationVO vo);

	public void inputBankInput(ImformationVO vo, String FA_FNAME);

	public void showUpdate(int FA_NO, String FA_SHOW);

	public void showDelete(int FA_NO);

	public ImformationVO viewUpdate(int FA_NO);

	public void viewUpdateOk(MultipartFile file, ImformationVO vo);

	public ArrayList<BookingVO> viewBooking(int FA_NO, String BOOKING_USEDAY, String BOOKING_STATUS, String BOOKING_APPROVAL, String BOOKING_PAYMENT, String CW_USER_NAME, String CW_USER_NUMBER, int startIndexNo, int pageSize);

	public ArrayList<ImformationVO> close(int FA_NO);

	public void closeInput(int FA_NO,String FA_FNAME,String FA_CLOSE_START,String FA_CLOSE_END,String FA_CLOSE_DAY);

	public void closeDelete(int FA_NO);

	public ArrayList<BookingVO> refundList(int FA_NO, String CW_USER_NAME, String CW_USER_NUMBER, int startIndexNo, int pageSize);

	public void approvalUpdate(int BOOKING_NO, String BOOKING_APPROVAL);

	public void paymentUpdate(int BOOKING_NO, String BOOKING_PAYMENT);

	public void booDelete(int BOOKING_NO);

	public int viewBookingBoo(int FA_NO);

	public BookingVO viewBookingFind(int FA_NO);
	// 예약상태,승인여부,결제상태 카운트 
	public int bookingCnt1(int FA_NO);
	public int bookingCnt2(int FA_NO);
	public int bookingCnt3(int FA_NO);
	public int bookingCnt4(int FA_NO);
	public int bookingCnt5(int FA_NO);
	public int bookingCnt6(int FA_NO);
	public int bookingCnt7(int FA_NO);
	public int bookingCnt8(int FA_NO);

	public ArrayList<ImformationVO> imadminList(String FA_GROUP, String FA_FNAME, String FA_METHOD, String start, String end,String FA_DATE, int startIndexNo, int pageSize);

	public void bookingUpdate(int BOOKING_NO, String CW_USER_BIRTH, String CW_USER_HOBBY, String BOOKING_USEDAY,
			String BOOKING_USETIME, String BOOKING_PERSONNEL, String CW_USER_NAME, String CW_USER_NUMBER,
			String BOOKING_POU);

	public void userDel(int CW_USER_NO);

	public int boogkingCnt(int FA_NO);

	public int viewCnt();

	public int refundCnt1(int FA_NO);
	public int refundCnt2();
	public int refundCnt3();

	public ArrayList<ImformationVO> closeBank();




}
