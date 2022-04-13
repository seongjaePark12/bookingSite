package com.spring.cw.service;

import java.util.ArrayList;

import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;
import com.spring.cw.vo.RefundVO;

public interface MemberService{

	public MemberVO getIdCheck(String CW_USER_MID);

	public void setVisitUpdate(String CW_USER_MID);

	public void setMemJoin(MemberVO vo);

	public ArrayList<ImformationVO> imforList(String FA_GROUP, String FA_FNAME, String FA_METHOD, String start, String end, String FA_DATE, int startIndexNo, int pageSize);

	public ImformationVO imforListGo(int FA_NO);

	public void bookingInput(BookingVO vo);

	public ArrayList<BookingVO> bookingList();

	public BookingVO bookingListGo(int BOOKING_NO);

	public void bookingxx(int BOOKING_NO, String BOOKING_STATUS, String BOOKING_DELETE);

	public void bookingDelete(int BOOKING_NO);

	public void bookingUpdate(BookingVO vo, int BOOKING_NO);

	public ImformationVO bookingListImfor(String FA_FNAME);

	public ArrayList<BookingVO> bookingListA(String name, String number, String FA_FNAME);

	public void refundBankOk(int BOOKING_NO, String CW_USER_NAME, String USER_BANK_NAME, String USER_BANK_NUM,
			String USER_NAME, String REFUND_BIGO);

	public RefundVO refundView(int BOOKING_NO);

	public void refundBankUpdate(int REFUND_NO, int BOOKING_NO, String CW_USER_NAME, String USER_BANK_NAME, String USER_BANK_NUM,
			String USER_NAME, String REFUND_BIGO);

	public void refundOk(int BOOKING_NO, String BOOKING_DELETE);

	public void userDel(String CW_USER_MID);

	public MemberVO idCheck(String CW_USER_MID);

	public int viewCnt();

	public ArrayList<ImformationVO> imforList1();


}
