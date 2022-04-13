package com.spring.cw.vo;

public class RefundVO {
	private int REFUND_NO;
	private int BOOKING_NO;
	private String FA_FNAME;
	private String BOOKING_DAY;
	private String CW_USER_NAME;
	private String USER_BANK_NAME;
	private String USER_BANK_NUM;
	private String USER_NAME;
	private String REFUND_BIGO;
	private String BOOKING_DELETE;
	public int getREFUND_NO() {
		return REFUND_NO;
	}
	public void setREFUND_NO(int rEFUND_NO) {
		REFUND_NO = rEFUND_NO;
	}
	public int getBOOKING_NO() {
		return BOOKING_NO;
	}
	public void setBOOKING_NO(int bOOKING_NO) {
		BOOKING_NO = bOOKING_NO;
	}
	public String getFA_FNAME() {
		return FA_FNAME;
	}
	public void setFA_FNAME(String fA_FNAME) {
		FA_FNAME = fA_FNAME;
	}
	public String getBOOKING_DAY() {
		return BOOKING_DAY;
	}
	public void setBOOKING_DAY(String bOOKING_DAY) {
		BOOKING_DAY = bOOKING_DAY;
	}
	public String getCW_USER_NAME() {
		return CW_USER_NAME;
	}
	public void setCW_USER_NAME(String cW_USER_NAME) {
		CW_USER_NAME = cW_USER_NAME;
	}
	public String getUSER_BANK_NAME() {
		return USER_BANK_NAME;
	}
	public void setUSER_BANK_NAME(String uSER_BANK_NAME) {
		USER_BANK_NAME = uSER_BANK_NAME;
	}
	public String getUSER_BANK_NUM() {
		return USER_BANK_NUM;
	}
	public void setUSER_BANK_NUM(String uSER_BANK_NUM) {
		USER_BANK_NUM = uSER_BANK_NUM;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getREFUND_BIGO() {
		return REFUND_BIGO;
	}
	public void setREFUND_BIGO(String rEFUND_BIGO) {
		REFUND_BIGO = rEFUND_BIGO;
	}
	public String getBOOKING_DELETE() {
		return BOOKING_DELETE;
	}
	public void setBOOKING_DELETE(String bOOKING_DELETE) {
		BOOKING_DELETE = bOOKING_DELETE;
	}
	@Override
	public String toString() {
		return "RefundVO [REFUND_NO=" + REFUND_NO + ", BOOKING_NO=" + BOOKING_NO + ", FA_FNAME=" + FA_FNAME
				+ ", BOOKING_DAY=" + BOOKING_DAY + ", CW_USER_NAME=" + CW_USER_NAME + ", USER_BANK_NAME="
				+ USER_BANK_NAME + ", USER_BANK_NUM=" + USER_BANK_NUM + ", USER_NAME=" + USER_NAME + ", REFUND_BIGO="
				+ REFUND_BIGO + ", BOOKING_DELETE=" + BOOKING_DELETE + "]";
	}
}
