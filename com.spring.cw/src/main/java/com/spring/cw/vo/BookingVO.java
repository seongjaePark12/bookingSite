package com.spring.cw.vo;

public class BookingVO {
	private int BOOKING_NO;
	private int FA_NO;
	private String FA_FNAME;
	private String FA_INAME;
	private String BOOKING_DAY;
	private String BOOKING_USEDAY;
	private String BOOKING_USETIME;
	private String BOOKING_PERSONNEL;
	private int FA_PAY;
	private int BOOKING_PAY;
	private String CW_USER_NAME;
	private String CW_USER_BIRTH;
	private String CW_USER_HOBBY;
	private String CW_USER_NUMBER;
	private String BOOKING_POU;
	private String BOOKING_STATUS;
	private String BOOKING_APPROVAL;
	private String BOOKING_APPROVAL2;
	private String BOOKING_PAYMENT;
	private String BOOKING_CNT;
	private String BOOKING_DELETE;
	
	private int FA_PEOPLE_NO;

	public int getBOOKING_NO() {
		return BOOKING_NO;
	}

	public void setBOOKING_NO(int bOOKING_NO) {
		BOOKING_NO = bOOKING_NO;
	}

	public int getFA_NO() {
		return FA_NO;
	}

	public void setFA_NO(int fA_NO) {
		FA_NO = fA_NO;
	}

	public String getFA_FNAME() {
		return FA_FNAME;
	}

	public void setFA_FNAME(String fA_FNAME) {
		FA_FNAME = fA_FNAME;
	}

	public String getFA_INAME() {
		return FA_INAME;
	}

	public void setFA_INAME(String fA_INAME) {
		FA_INAME = fA_INAME;
	}

	public String getBOOKING_DAY() {
		return BOOKING_DAY;
	}

	public void setBOOKING_DAY(String bOOKING_DAY) {
		BOOKING_DAY = bOOKING_DAY;
	}

	public String getBOOKING_USEDAY() {
		return BOOKING_USEDAY;
	}

	public void setBOOKING_USEDAY(String bOOKING_USEDAY) {
		BOOKING_USEDAY = bOOKING_USEDAY;
	}

	public String getBOOKING_USETIME() {
		return BOOKING_USETIME;
	}

	public void setBOOKING_USETIME(String bOOKING_USETIME) {
		BOOKING_USETIME = bOOKING_USETIME;
	}

	public String getBOOKING_PERSONNEL() {
		return BOOKING_PERSONNEL;
	}

	public void setBOOKING_PERSONNEL(String bOOKING_PERSONNEL) {
		BOOKING_PERSONNEL = bOOKING_PERSONNEL;
	}

	public int getFA_PAY() {
		return FA_PAY;
	}

	public void setFA_PAY(int fA_PAY) {
		FA_PAY = fA_PAY;
	}

	public int getBOOKING_PAY() {
		return BOOKING_PAY;
	}

	public void setBOOKING_PAY(int bOOKING_PAY) {
		BOOKING_PAY = bOOKING_PAY;
	}

	public String getCW_USER_NAME() {
		return CW_USER_NAME;
	}

	public void setCW_USER_NAME(String cW_USER_NAME) {
		CW_USER_NAME = cW_USER_NAME;
	}

	public String getCW_USER_BIRTH() {
		return CW_USER_BIRTH;
	}

	public void setCW_USER_BIRTH(String cW_USER_BIRTH) {
		CW_USER_BIRTH = cW_USER_BIRTH;
	}

	public String getCW_USER_HOBBY() {
		return CW_USER_HOBBY;
	}

	public void setCW_USER_HOBBY(String cW_USER_HOBBY) {
		CW_USER_HOBBY = cW_USER_HOBBY;
	}

	public String getCW_USER_NUMBER() {
		return CW_USER_NUMBER;
	}

	public void setCW_USER_NUMBER(String cW_USER_NUMBER) {
		CW_USER_NUMBER = cW_USER_NUMBER;
	}

	public String getBOOKING_POU() {
		return BOOKING_POU;
	}

	public void setBOOKING_POU(String bOOKING_POU) {
		BOOKING_POU = bOOKING_POU;
	}

	public String getBOOKING_STATUS() {
		return BOOKING_STATUS;
	}

	public void setBOOKING_STATUS(String bOOKING_STATUS) {
		BOOKING_STATUS = bOOKING_STATUS;
	}

	public String getBOOKING_APPROVAL() {
		return BOOKING_APPROVAL;
	}

	public void setBOOKING_APPROVAL(String bOOKING_APPROVAL) {
		BOOKING_APPROVAL = bOOKING_APPROVAL;
	}

	public String getBOOKING_APPROVAL2() {
		return BOOKING_APPROVAL2;
	}

	public void setBOOKING_APPROVAL2(String bOOKING_APPROVAL2) {
		BOOKING_APPROVAL2 = bOOKING_APPROVAL2;
	}

	public String getBOOKING_PAYMENT() {
		return BOOKING_PAYMENT;
	}

	public void setBOOKING_PAYMENT(String bOOKING_PAYMENT) {
		BOOKING_PAYMENT = bOOKING_PAYMENT;
	}

	public String getBOOKING_CNT() {
		return BOOKING_CNT;
	}

	public void setBOOKING_CNT(String bOOKING_CNT) {
		BOOKING_CNT = bOOKING_CNT;
	}

	public String getBOOKING_DELETE() {
		return BOOKING_DELETE;
	}

	public void setBOOKING_DELETE(String bOOKING_DELETE) {
		BOOKING_DELETE = bOOKING_DELETE;
	}

	public int getFA_PEOPLE_NO() {
		return FA_PEOPLE_NO;
	}

	public void setFA_PEOPLE_NO(int fA_PEOPLE_NO) {
		FA_PEOPLE_NO = fA_PEOPLE_NO;
	}

	@Override
	public String toString() {
		return "BookingVO [BOOKING_NO=" + BOOKING_NO + ", FA_NO=" + FA_NO + ", FA_FNAME=" + FA_FNAME + ", FA_INAME="
				+ FA_INAME + ", BOOKING_DAY=" + BOOKING_DAY + ", BOOKING_USEDAY=" + BOOKING_USEDAY
				+ ", BOOKING_USETIME=" + BOOKING_USETIME + ", BOOKING_PERSONNEL=" + BOOKING_PERSONNEL + ", FA_PAY="
				+ FA_PAY + ", BOOKING_PAY=" + BOOKING_PAY + ", CW_USER_NAME=" + CW_USER_NAME + ", CW_USER_BIRTH="
				+ CW_USER_BIRTH + ", CW_USER_HOBBY=" + CW_USER_HOBBY + ", CW_USER_NUMBER=" + CW_USER_NUMBER
				+ ", BOOKING_POU=" + BOOKING_POU + ", BOOKING_STATUS=" + BOOKING_STATUS + ", BOOKING_APPROVAL="
				+ BOOKING_APPROVAL + ", BOOKING_APPROVAL2=" + BOOKING_APPROVAL2 + ", BOOKING_PAYMENT=" + BOOKING_PAYMENT
				+ ", BOOKING_CNT=" + BOOKING_CNT + ", BOOKING_DELETE=" + BOOKING_DELETE + ", FA_PEOPLE_NO="
				+ FA_PEOPLE_NO + "]";
	}
	
	
}
