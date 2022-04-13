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
<title>환불요청</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function bookingxx(){
		var ans = confirm("환불 하시겠습니까?");
		if(!ans) return false;
		
		var USER_BANK_NAME = myform.USER_BANK_NAME.value;
		var USER_BANK_NUM = myform.USER_BANK_NUM.value;
		var USER_NAME = myform.USER_NAME.value;
		if(USER_BANK_NAME == ""){
			alert("환불받으실 계좌명을 입력해주세요 \n 계좌등록필수");
			return;
		}
		else if(USER_BANK_NUM == ""){
			alert("환불받으실 계좌번호을 입력해주세요 \n 계좌등록필수");
			return;
		}
		else if(USER_NAME == ""){
			alert("환불받으실 예금주명을 입력해주세요 \n 계좌등록필수");
			return;
		}
		
		var BOOKING_NO = myform.BOOKING_NO.value;
		var BOOKING_DELETE = myform.BOOKING_DELETE.value;
		
		$.ajax({
			type : "post",
			url : "${ctp}/member/refundOk",
			data:{
					BOOKING_NO : BOOKING_NO,
					BOOKING_DELETE : BOOKING_DELETE
				},
			success:function(){
				alert("환불요청 되었습니다");
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});	
	}
	function bankOk(){
		var ans = confirm("계좌를 등록 하시겠습니까?");
		if(!ans) return false;
		
		var BOOKING_NO = myform.BOOKING_NO.value;
		var CW_USER_NAME = myform.CW_USER_NAME.value;
		var USER_BANK_NAME = myform.USER_BANK_NAME.value;
		var USER_BANK_NUM = myform.USER_BANK_NUM.value;
		var USER_NAME = myform.USER_NAME.value;
		var REFUND_BIGO = myform.REFUND_BIGO.value;
		
		$.ajax({
			type : "post",
			url : "${ctp}/member/refundBankOk",
			data:{
				BOOKING_NO : BOOKING_NO,
				CW_USER_NAME : CW_USER_NAME,
				USER_BANK_NAME : USER_BANK_NAME,
				USER_BANK_NUM : USER_BANK_NUM,
				USER_NAME : USER_NAME,
				REFUND_BIGO : REFUND_BIGO
				},
			success:function(){
				alert("등록완료");
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});	
	}
	function bankUpdate(){
		var ans = confirm("계좌를 수정 하시겠습니까?");
		if(!ans) return false;
		
		var REFUND_NO = myform.REFUND_NO.value;
		var BOOKING_NO = myform.BOOKING_NO.value;
		var CW_USER_NAME = myform.CW_USER_NAME.value;
		var USER_BANK_NAME = myform.USER_BANK_NAME.value;
		var USER_BANK_NUM = myform.USER_BANK_NUM.value;
		var USER_NAME = myform.USER_NAME.value;
		var REFUND_BIGO = myform.REFUND_BIGO.value;
		
		$.ajax({
			type : "post",
			url : "${ctp}/member/refundBankUpdate",
			data:{
				REFUND_NO : REFUND_NO,
				BOOKING_NO : BOOKING_NO,
				CW_USER_NAME : CW_USER_NAME,
				USER_BANK_NAME : USER_BANK_NAME,
				USER_BANK_NUM : USER_BANK_NUM,
				USER_NAME : USER_NAME,
				REFUND_BIGO : REFUND_BIGO
				},
			success:function(){
				alert("수정완료");
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});	
	}
</script>
<style>
	h2{margin-left: 50px;}
	h3{margin-left: 100px;}
	table{border: 1px solid #444444;width:80%; margin-left: 100px;text-align: center;}
	td{border: 1px solid #444444;}
</style>
</head>
<body>
	<h2>환불요청</h2><hr>
	<form name="myform" method="post">
		<div style="text-align: center;">
			<img src="${ctp}/resources/data/${vo1.FA_PHOTO}" alt="image" width="15%"/>
		</div><br>
		<h3><b>예약정보</b></h3>
		<table>
			<tr style="background-color: #ddd;">
				<td>예약 신청일</td>
				<td>예약상태</td>
				<td>승인여부</td>
			</tr>
			<tr>
				<td>${vo.BOOKING_DAY}</td>
				<td>
					<c:if test="${vo.BOOKING_STATUS == 1}">예약신청</c:if>
					<c:if test="${vo.BOOKING_STATUS == 2}">예약완료</c:if>
					<c:if test="${vo.BOOKING_STATUS == 3}">예약취소</c:if>
				</td>
				<td>
					<c:if test="${vo.BOOKING_APPROVAL == 1}">대기</c:if>
					<c:if test="${vo.BOOKING_APPROVAL == 2}">승인</c:if>
					<c:if test="${vo.BOOKING_APPROVAL == 2}">반려</c:if>
				</td>
			</tr>
		</table>
		<br><h3><b>상세 예약정보</b></h3>
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd">시설명</td>			
				<td style="width:35%">${vo.FA_FNAME}</td>			
				<td style="width:15%; background-color: #ddd">기관</td>			
				<td style="width:35%">${vo.FA_INAME}</td>			
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd">위치</td>			
				<td style="width:35%">${vo1.FA_ADDRESS}</td>			
				<td style="width:15%; background-color: #ddd">예약문의</td>			
				<td style="width:35%">${vo1.FA_NUMBER}</td>			
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd">이용날짜</td>			
				<td style="width:35%">${vo.BOOKING_USEDAY}</td>			
				<td style="width:15%; background-color: #ddd">이용시간</td>			
				<td style="width:35%">${vo.BOOKING_USETIME}</td>			
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd">정원</td>			
				<td style="width:35%">${vo1.FA_PEOPLE_NO}명</td>			
				<td style="width:15%; background-color: #ddd">이용요금</td>			
				<td style="width:35%">${vo.FA_PAY}원</td>			
			</tr>
		</table>
		<br><h3><b>결제 정보</b></h3>
		<table>
			<tr style="background-color: #ddd;">
				<td>이용요금</td>
				<td>최종결제금액</td>
				<td>은행명</td>
				<td>입금계좌번호</td>
				<td>예금주</td>
				<td>결제기한</td>
			</tr>
			<tr>
				<td>${vo1.FA_PAY}원</td>
				<td>${vo1.FA_PAY}원</td>
				<td>${vo1.FA_BANK_NAME}</td>
				<td>${vo1.FA_BANK_NUM}</td>
				<td>${vo1.FA_BANK_MASTER}</td>
				<td>${vo.BOOKING_DAY}</td>
			</tr>
		</table>
		<br><h3><b>환불계좌</b></h3>
		<table>
			<tr>
				<td>은행명</td>
				<td>계좌번호</td>
				<td>예금주</td>
				<td>비고</td>
				<td>계좌확인</td>
			</tr>
			<tr>
				<td><input type="text" name="USER_BANK_NAME" value="${vo2.USER_BANK_NAME}" /></td>
				<td><input type="text" name="USER_BANK_NUM" value="${vo2.USER_BANK_NUM}" /></td>
				<td><input type="text" name="USER_NAME" value="${vo2.USER_NAME}" /></td>
				<td><input type="text" name="REFUND_BIGO" value="${vo2.REFUND_BIGO}" /></td>
				<td>
					<c:if test="${vo2.USER_BANK_NAME == null}"><button type="button" onclick="bankOk()">계좌등록</button></c:if>
					<c:if test="${vo2.USER_BANK_NAME != null}"><button type="button" onclick="bankUpdate()">수정</button></c:if>
				</td>
			</tr>
		</table>
		<br><br>
		<div style="text-align: center;">
			<button type="button" onclick="location.href='${ctp}/member/bookingListA';">목록</button>
			<button type="button" onclick="bookingxx()">환불요청</button>
		</div>
		<input type="hidden" name="BOOKING_STATUS" value="3" />
		<input type="hidden" name="REFUND_NO" value="${vo2.REFUND_NO}" />
		<input type="hidden" name="CW_USER_NAME" value="${sName}" />
		<input type="hidden" name="BOOKING_NO" value="${vo.BOOKING_NO}" />
		<input type="hidden" name="BOOKING_PAYMENT" value="${vo.BOOKING_PAYMENT}" />
		<input type="hidden" name="BOOKING_APPROVAL" value="${vo.BOOKING_APPROVAL}" />
		<input type="hidden" name="BOOKING_DELETE" value="0" />
	</form>	
</body>
</html>