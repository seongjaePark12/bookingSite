package com.spring.cw.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cw.dao.AdminDAO;
import com.spring.cw.vo.BookingVO;
import com.spring.cw.vo.ImformationVO;
import com.spring.cw.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	@Override
	public ArrayList<MemberVO> memberSerch() {
		return adminDAO.memberSerch();
	}
	@Override
	public void imforInput(MultipartFile file,ImformationVO vo) {
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != "" && originalFilename != null) {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			  String saveFileName = sdf.format(date) + "_" + originalFilename;
				writeFile(file, saveFileName);	  // 메인 이미지를 서버에 업로드 시켜주는 메소드 호출
				vo.setFA_PHOTO(saveFileName);				// 서버에 저장된 파일명을 vo에 set시켜준다.
			}
			else {
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		adminDAO.imforInput(vo);
	}
	// 메인 상품 이미지 서버에 저장하기
	private void writeFile(MultipartFile productMainImg, String saveFileName) throws IOException {
		byte[] data = productMainImg.getBytes();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);
		fos.close();
	}
	@Override
	public void inputBankInput(ImformationVO vo,String FA_FNAME) {
		adminDAO.inputBankInput(vo,FA_FNAME);
	}

	@Override
	public void showUpdate(int FA_NO, String FA_SHOW) {
		adminDAO.showUpdate(FA_NO,FA_SHOW);
	}

	@Override
	public void showDelete(int FA_NO) {
		adminDAO.showDelete(FA_NO);
	}

	@Override
	public ImformationVO viewUpdate(int FA_NO) {
		return adminDAO.viewUpdate(FA_NO);
	}
	@Override
	public void viewUpdateOk(MultipartFile file,ImformationVO vo) {
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != "" && originalFilename != null) {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			  String saveFileName = sdf.format(date) + "_" + originalFilename;
				writeFile(file, saveFileName);	  // 메인 이미지를 서버에 업로드 시켜주는 메소드 호출
				vo.setFA_PHOTO(saveFileName);				// 서버에 저장된 파일명을 vo에 set시켜준다.
			}
			else {
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		adminDAO.viewUpdateOk(vo);
	}
	@Override
	public ArrayList<BookingVO> viewBooking(int FA_NO, String BOOKING_USEDAY, String BOOKING_STATUS, String BOOKING_APPROVAL, String BOOKING_PAYMENT, String CW_USER_NAME, String CW_USER_NUMBER, int startIndexNo, int pageSize) {
		return adminDAO.viewBooking(FA_NO,BOOKING_USEDAY,BOOKING_STATUS,BOOKING_APPROVAL,BOOKING_PAYMENT, CW_USER_NAME, CW_USER_NUMBER,startIndexNo,pageSize);
	}
	@Override
	public ArrayList<ImformationVO> close(int FA_NO) {
		return adminDAO.close(FA_NO);
	}
	@Override
	public void closeInput(int FA_NO,String FA_FNAME,String FA_CLOSE_START,String FA_CLOSE_END,String FA_CLOSE_DAY) {
		adminDAO.closeInput(FA_NO, FA_FNAME, FA_CLOSE_START, FA_CLOSE_END, FA_CLOSE_DAY);
	}
	@Override
	public void closeDelete(int FA_NO) {
		adminDAO.closeDelete(FA_NO);
	}
	@Override
	public ArrayList<BookingVO> refundList(int FA_NO, String CW_USER_NAME, String CW_USER_NUMBER, int startIndexNo, int pageSize) {
		return adminDAO.refundList(FA_NO, CW_USER_NAME, CW_USER_NUMBER,startIndexNo,pageSize);
	}
	@Override
	public void approvalUpdate(int BOOKING_NO, String BOOKING_APPROVAL) {
		adminDAO.approvalUpdate(BOOKING_NO,BOOKING_APPROVAL);
	}
	@Override
	public void paymentUpdate(int BOOKING_NO, String BOOKING_PAYMENT) {
		adminDAO.paymentUpdate(BOOKING_NO,BOOKING_PAYMENT);
	}
	@Override
	public void booDelete(int BOOKING_NO) {
		adminDAO.booDelete(BOOKING_NO);
	}
	@Override
	public int viewBookingBoo(int FA_NO) {
		return adminDAO.viewBookingBoo(FA_NO);
	}
	@Override
	public BookingVO viewBookingFind(int FA_NO) {
		return adminDAO.viewBookingFind(FA_NO);
	}
	@Override
	public int bookingCnt1(int FA_NO) {
		return adminDAO.bookingCnt1(FA_NO);
	}
	@Override
	public int bookingCnt2(int FA_NO) {
		return adminDAO.bookingCnt2(FA_NO);
	}
	@Override
	public int bookingCnt3(int FA_NO) {
		return adminDAO.bookingCnt3(FA_NO);
	}
	@Override
	public int bookingCnt4(int FA_NO) {
		return adminDAO.bookingCnt4(FA_NO);
	}
	@Override
	public int bookingCnt5(int FA_NO) {
		return adminDAO.bookingCnt5(FA_NO);
	}
	@Override
	public int bookingCnt6(int FA_NO) {
		return adminDAO.bookingCnt6(FA_NO);
	}
	@Override
	public int bookingCnt7(int FA_NO) {
		return adminDAO.bookingCnt7(FA_NO);
	}
	@Override
	public int bookingCnt8(int FA_NO) {
		return adminDAO.bookingCnt8(FA_NO);
	}
	@Override
	public ArrayList<ImformationVO> imadminList(String FA_GROUP, String FA_FNAME, String FA_METHOD, String start, String end,String FA_DATE, int startIndexNo, int pageSize) {
		return adminDAO.imadminList(FA_GROUP,FA_FNAME,FA_METHOD,start,end,FA_DATE,startIndexNo,pageSize);
	}
	@Override
	public void bookingUpdate(int BOOKING_NO, String CW_USER_BIRTH, String CW_USER_HOBBY, String BOOKING_USEDAY,
			String BOOKING_USETIME, String BOOKING_PERSONNEL, String CW_USER_NAME, String CW_USER_NUMBER,
			String BOOKING_POU) {
		adminDAO.bookingUpdate(BOOKING_NO,CW_USER_BIRTH,CW_USER_HOBBY,BOOKING_USEDAY,BOOKING_USETIME,BOOKING_PERSONNEL,CW_USER_NAME,CW_USER_NUMBER,BOOKING_POU);
	}
	@Override
	public void userDel(int CW_USER_NO) {
		adminDAO.userDel(CW_USER_NO);
	}
	@Override
	public int boogkingCnt(int FA_NO) {
		return adminDAO.boogkingCnt(FA_NO);
	}
	@Override
	public int viewCnt() {
		return adminDAO.viewCnt();
	}
	@Override
	public int refundCnt1(int FA_NO) {
		return adminDAO.refundCnt1(FA_NO);
	}
	@Override
	public int refundCnt2() {
		return adminDAO.refundCnt2();
	}
	@Override
	public int refundCnt3() {
		return adminDAO.refundCnt3();
	}
	@Override
	public ArrayList<ImformationVO> closeBank() {
		return adminDAO.closeBank();
	}

}
