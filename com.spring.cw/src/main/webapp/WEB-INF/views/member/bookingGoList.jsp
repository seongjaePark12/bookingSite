<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String sToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function bookingxx(){
		var ans = confirm("예약을 변경 하시겠습니까?");
		if(!ans) return false;
		
		var BOOKING_STATUS = myform.BOOKING_STATUS.value;
		var BOOKING_NO = myform.BOOKING_NO.value;
		
		$.ajax({
			type : "post",
			url : "${ctp}/member/bookingxx",
			data:{
					BOOKING_NO : BOOKING_NO,
					BOOKING_STATUS : BOOKING_STATUS	
				},
			success:function(){
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});	
	}
	function bookingDelete(){
		var ans = confirm("예약 삭제 하시겠습니까?");
		if(!ans) return false;
		myform.submit();
	}
</script>
<style>
	h2{margin-left: 50px;}
	h3{margin-left: 100px;}
	table{border: 1px solid #444444;width:80%; margin-left: 100px;text-align: center;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: red;}
</style>
</head>
<body>
	<h2>예약상세</h2><hr>
	<form name="myform" method="post">
		<h3><b>예약정보</b></h3>
		<table>
			<tr>
				<td style="width:15%;background-color: #ddd;">시설명</td>
				<td style="width:35%;">${vo.FA_FNAME}</td>
				<td style="width:15%;background-color: #ddd;">기관</td>
				<td style="width:35%;">${vo.FA_INAME}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">이용날짜</td>
				<td style="width:35%;">${vo.BOOKING_USEDAY}</td>
				<td style="width:15%;background-color: #ddd;">이용시간</td>
				<td style="width:35%;">${vo.BOOKING_USETIME}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">정원</td>
				<td style="width:35%;">${vo1.FA_PEOPLE_NO}</td>
				<td style="width:15%;background-color: #ddd;">이용요금</td>
				<td style="width:35%;">${vo.FA_PAY}</td>
			</tr>
		</table>
		<br><br>
		<h3><b>신청자 정보</b></h3>
		<table>
			<tr>
				<td style="width:15%;background-color: #ddd;">신청자명</td>
				<td style="text-align: left;">${vo.CW_USER_NAME}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">생년월일</td>
				<td style="text-align: left;">${vo.CW_USER_BIRTH}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">휴대전화</td>
				<td style="text-align: left;">${vo.CW_USER_NUMBER}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">단체/동호회</td>
				<td style="text-align: left;">${vo.CW_USER_HOBBY}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">이용인원</td>
				<td style="text-align: left;">${vo.BOOKING_PERSONNEL}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">사용목적</td>
				<td style="text-align: left;">${vo.BOOKING_POU}</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">예약상태</td>
				<td style="text-align: left;">
					<c:if test="${vo.BOOKING_STATUS == 1}">예약신청</c:if>
					<c:if test="${vo.BOOKING_STATUS == 2}">예약완료</c:if>
					<c:if test="${vo.BOOKING_STATUS == 3}">예약취소</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">승인여부</td>
				<td style="text-align: left;">
					<c:if test="${vo.BOOKING_APPROVAL == 1}">대기</c:if>
					<c:if test="${vo.BOOKING_APPROVAL == 2}">승인</c:if>
					<c:if test="${vo.BOOKING_APPROVAL == 3}">반려</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:15%;background-color: #ddd;">결제상태</td>
				<td style="text-align: left;">
					<c:if test="${vo.BOOKING_PAYMENT == 0}">결제대기</c:if>
					<c:if test="${vo.BOOKING_PAYMENT == 1}">결제완료</c:if>
					<c:if test="${vo.BOOKING_PAYMENT == 2}">결제취소</c:if>
				</td>
			</tr>
		</table>
		<br><br>
		<div style="margin-left: 100px;">
			<button type="button" onclick="location.href='${ctp}/member/bookingList?BOOKING_NO=${vo.BOOKING_NO}&FA_FNAME=${vo.FA_FNAME}';">목록</button>
			<button style="margin-left: 1300px" type="button" onclick="bookingxx()">예약 취소</button>
			<button type="button" onclick="location.href='${ctp}/member/bookingUpdate?BOOKING_NO=${vo.BOOKING_NO}&FA_FNAME=${vo.FA_FNAME}';">수정</button>
			<button type="button" onclick="bookingDelete()">삭제</button>
		</div>
		<input type="hidden" name="BOOKING_STATUS" value="3" />
		<input type="hidden" name="BOOKING_NO" value="${vo.BOOKING_NO}" />
		<input type="hidden" name="BOOKING_PAYMENT" value="${vo.BOOKING_PAYMENT}" />
		<input type="hidden" name="BOOKING_APPROVAL" value="${vo.BOOKING_APPROVAL}" />
	</form>	
</body>
</html>