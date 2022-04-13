package com.spring.cw.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;

public interface AdminDAO {

	public ArrayList<MemberVO> memberSerch();

	public void imforInput(@Param("vo") ImformationVO vo);

	public void inputBankInput(@Param("vo") ImformationVO vo,@Param("FA_FNAME") String FA_FNAME);

	public void showUpdate(@Param("FA_NO")int FA_NO, @Param("FA_SHOW")String FA_SHOW);

	public void showDelete(@Param("FA_NO")int FA_NO);

	public ImformationVO viewUpdate(@Param("FA_NO")int FA_NO);

	public void viewUpdateOk(@Param("vo")ImformationVO vo);

	public ArrayList<BookingVO> viewBooking(@Param("FA_NO")int FA_NO,@Param("BOOKING_USEDAY") String BOOKING_USEDAY,@Param("BOOKING_STATUS") String BOOKING_STATUS,@Param("BOOKING_APPROVAL") String BOOKING_APPROVAL,@Param("BOOKING_PAYMENT") String BOOKING_PAYMENT, @Param("CW_USER_NAME")String CW_USER_NAME, @Param("CW_USER_NUMBER")String CW_USER_NUMBER, @Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize);

	public ArrayList<ImformationVO> close(@Param("FA_NO")int FA_NO);

	public void closeInput(@Param("FA_NO")int FA_NO,@Param("FA_FNAME")String FA_FNAME,@Param("FA_CLOSE_START")String FA_CLOSE_START,@Param("FA_CLOSE_END")String FA_CLOSE_END,@Param("FA_CLOSE_DAY")String FA_CLOSE_DAY);

	public void closeDelete(@Param("FA_NO")int FA_NO);

	public ArrayList<BookingVO> refundList(@Param("FA_NO")int FA_NO, @Param("CW_USER_NAME")String CW_USER_NAME,@Param("CW_USER_NUMBER")String CW_USER_NUMBER, @Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize);

	public void approvalUpdate(@Param("BOOKING_NO")int BOOKING_NO, @Param("BOOKING_APPROVAL")String BOOKING_APPROVAL);

	public void paymentUpdate(@Param("BOOKING_NO")int BOOKING_NO, @Param("BOOKING_PAYMENT")String BOOKING_PAYMENT);

	public void booDelete(@Param("BOOKING_NO")int BOOKING_NO);

	public int viewBookingBoo(@Param("FA_NO")int FA_NO);

	public BookingVO viewBookingFind(@Param("FA_NO")int FA_NO);

	public int bookingCnt1(@Param("FA_NO")int FA_NO);
	public int bookingCnt2(@Param("FA_NO")int FA_NO);
	public int bookingCnt3(@Param("FA_NO")int FA_NO);
	public int bookingCnt4(@Param("FA_NO")int FA_NO);
	public int bookingCnt5(@Param("FA_NO")int FA_NO);
	public int bookingCnt6(@Param("FA_NO")int FA_NO);
	public int bookingCnt7(@Param("FA_NO")int FA_NO);
	public int bookingCnt8(@Param("FA_NO")int FA_NO);

	public ArrayList<ImformationVO> imadminList(@Param("FA_GROUP")String FA_GROUP, @Param("FA_FNAME")String FA_FNAME, @Param("FA_METHOD")String FA_METHOD, @Param("start")String start, @Param("end")String end,@Param("FA_DATE")String FA_DATE, @Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize);

	public void bookingUpdate(@Param("BOOKING_NO")int BOOKING_NO, @Param("CW_USER_BIRTH")String CW_USER_BIRTH, @Param("CW_USER_HOBBY")String CW_USER_HOBBY, @Param("BOOKING_USEDAY")String BOOKING_USEDAY,
			@Param("BOOKING_USETIME")String BOOKING_USETIME, @Param("BOOKING_PERSONNEL")String BOOKING_PERSONNEL, @Param("CW_USER_NAME")String CW_USER_NAME, @Param("CW_USER_NUMBER")String CW_USER_NUMBER,
			@Param("BOOKING_POU")String BOOKING_POU);

	public void userDel(@Param("CW_USER_NO")int CW_USER_NO);

	public int boogkingCnt(@Param("FA_NO")int FA_NO);

	public int viewCnt();

	public int refundCnt1(@Param("FA_NO")int FA_NO);
	public int refundCnt2();
	public int refundCnt3();

	public ArrayList<ImformationVO> closeBank();

}
