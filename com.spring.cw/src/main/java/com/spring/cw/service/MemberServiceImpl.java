package com.spring.cw.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cw.dao.MemberDAO;
import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;
import com.spring.cw.vo.RefundVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberVO getIdCheck(String CW_USER_MID) {
		return memberDAO.getIdCheck(CW_USER_MID);
	}

	@Override
	public void setVisitUpdate(String CW_USER_MID) {
		memberDAO.setVisitUpdate(CW_USER_MID);
	}

	@Override
	public void setMemJoin(MemberVO vo) {
		memberDAO.setMemJoin(vo);
	}

	@Override
	public ArrayList<ImformationVO> imforList(String FA_GROUP, String FA_FNAME, String FA_METHOD, String start, String end, String FA_DATE, int startIndexNo, int pageSize) {
		return memberDAO.imforList(FA_GROUP, FA_FNAME, FA_METHOD, start, end, FA_DATE, startIndexNo, pageSize);
	}

	@Override
	public ImformationVO imforListGo(int FA_NO) {
		return memberDAO.imforListGo(FA_NO);
	}

	@Override
	public void bookingInput(BookingVO vo) {
		memberDAO.bookingInput(vo);
	}

	@Override
	public ArrayList<BookingVO> bookingList() {
		return memberDAO.bookingList();
	}

	@Override
	public BookingVO bookingListGo(int BOOKING_NO) {
		return memberDAO.bookingListGo(BOOKING_NO);
	}

	@Override
	public void bookingxx(int BOOKING_NO, String BOOKING_STATUS,String BOOKING_DELETE) {
		memberDAO.bookingxx(BOOKING_NO,BOOKING_STATUS, BOOKING_DELETE);
	}

	@Override
	public void bookingDelete(int BOOKING_NO) {
		memberDAO.bookingDelete(BOOKING_NO);
	}

	@Override
	public void bookingUpdate(BookingVO vo,int BOOKING_NO) {
		memberDAO.bookingUpdate(vo,BOOKING_NO);
	}

	@Override
	public ImformationVO bookingListImfor(String FA_FNAME) {
		return memberDAO.bookingListImfor(FA_FNAME);
	}

	@Override
	public ArrayList<BookingVO> bookingListA(String name, String number, String FA_FNAME) {
		return memberDAO.bookingListA(name,number,FA_FNAME);
	}

	@Override
	public void refundBankOk(int BOOKING_NO, String CW_USER_NAME, String USER_BANK_NAME, String USER_BANK_NUM,
			String USER_NAME, String REFUND_BIGO) {
		memberDAO.refundBankOk(BOOKING_NO,CW_USER_NAME,USER_BANK_NAME,USER_BANK_NUM,USER_NAME,REFUND_BIGO);
	}

	@Override
	public RefundVO refundView(int BOOKING_NO) {
		return memberDAO.refundView(BOOKING_NO);
	}

	@Override
	public void refundBankUpdate(int REFUND_NO, int BOOKING_NO, String CW_USER_NAME, String USER_BANK_NAME,
			String USER_BANK_NUM, String USER_NAME, String REFUND_BIGO) {
		memberDAO.refundBankUpdate(REFUND_NO,BOOKING_NO,CW_USER_NAME,USER_BANK_NAME,USER_BANK_NUM,USER_NAME,REFUND_BIGO);
	}

	@Override
	public void refundOk(int BOOKING_NO, String BOOKING_DELETE) {
		memberDAO.refundOk(BOOKING_NO,BOOKING_DELETE);
	}

	@Override
	public void userDel(String CW_USER_MID) {
		memberDAO.userDel(CW_USER_MID);
	}

	@Override
	public MemberVO idCheck(String CW_USER_MID) {
		return memberDAO.idCheck(CW_USER_MID);
	}

	@Override
	public int viewCnt() {
		return memberDAO.viewCnt();
	}

	@Override
	public ArrayList<ImformationVO> imforList1() {
		return memberDAO.imforList1();
	}


}
