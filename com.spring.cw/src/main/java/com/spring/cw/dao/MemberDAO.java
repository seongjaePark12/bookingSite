package com.spring.cw.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;
import com.spring.cw.vo.RefundVO;

public interface MemberDAO {

	public MemberVO getIdCheck(@Param("CW_USER_MID") String CW_USER_MID);

	public void setVisitUpdate(@Param("CW_USER_MID") String CW_USER_MID);

	public void setMemJoin(@Param("vo") MemberVO vo);

	public ArrayList<ImformationVO> imforList(@Param("FA_GROUP")String FA_GROUP, @Param("FA_FNAME")String FA_FNAME, @Param("FA_METHOD")String FA_METHOD, @Param("start")String start, @Param("end")String end,@Param("FA_DATE")String FA_DATE, @Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize);

	public ImformationVO imforListGo(@Param("FA_NO") int FA_NO);

	public void bookingInput(@Param("vo") BookingVO vo);

	public ArrayList<BookingVO> bookingList();

	public BookingVO bookingListGo(@Param("BOOKING_NO") int BOOKING_NO);

	public void bookingxx(@Param("BOOKING_NO")int BOOKING_NO, @Param("BOOKING_STATUS")String BOOKING_STATUS,@Param("BOOKING_DELETE") String BOOKING_DELETE);

	public void bookingDelete(@Param("BOOKING_NO") int BOOKING_NO);

	public void bookingUpdate(@Param("vo") BookingVO vo,@Param("BOOKING_NO") int BOOKING_NO);

	public ImformationVO bookingListImfor(@Param("FA_FNAME") String FA_FNAME);

	public ArrayList<BookingVO> bookingListA(@Param("name") String name,@Param("number") String number,@Param("FA_FNAME") String FA_FNAME);

	public void refundBankOk(@Param("BOOKING_NO")int BOOKING_NO, @Param("CW_USER_NAME")String CW_USER_NAME, @Param("USER_BANK_NAME")String USER_BANK_NAME, @Param("USER_BANK_NUM")String USER_BANK_NUM,
			@Param("USER_NAME")String USER_NAME, @Param("REFUND_BIGO")String REFUND_BIGO);

	public RefundVO refundView(@Param("BOOKING_NO")int BOOKING_NO);

	public void refundBankUpdate(@Param("REFUND_NO")int REFUND_NO, @Param("BOOKING_NO")int BOOKING_NO, @Param("CW_USER_NAME")String CW_USER_NAME, @Param("USER_BANK_NAME")String USER_BANK_NAME, @Param("USER_BANK_NUM")String USER_BANK_NUM,
			@Param("USER_NAME")String USER_NAME, @Param("REFUND_BIGO")String REFUND_BIGO);

	public void refundOk(@Param("BOOKING_NO")int BOOKING_NO, @Param("BOOKING_DELETE")String BOOKING_DELETE);

	public void userDel(@Param("CW_USER_MID")String CW_USER_MID);

	public MemberVO idCheck(@Param("CW_USER_MID")String CW_USER_MID);

	public int viewCnt();

	public ArrayList<ImformationVO> imforList1();

	
}
