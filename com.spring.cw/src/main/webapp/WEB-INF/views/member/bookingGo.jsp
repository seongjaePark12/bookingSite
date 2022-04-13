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
<title>관리자요</title>
<script type="text/javascript">
	function inputOn(){
		var BOOKING_USEDAY = myform.BOOKING_USEDAY.value;
		var BOOKING_USETIME2 = myform.BOOKING_USETIME2.value;
		var BOOKING_USETIME1 = myform.BOOKING_USETIME1.value;
		var BOOKING_USETIME = BOOKING_USETIME1+":00~"+BOOKING_USETIME2+":00";
		var BOOKING_PERSONNEL = myform.BOOKING_PERSONNEL.value;
		var CW_USER_NAME = myform.CW_USER_NAME.value;
		var CW_USER_NUMBER = myform.CW_USER_NUMBER.value;
		var BOOKING_POU = myform.BOOKING_POU.value;
		
		if(BOOKING_PERSONNEL == ""){
			alert("이용인원을 입력하세요");
			myform.BOOKING_PERSONNEL.focus();
		}
		else if(CW_USER_NAME == ""){
			alert("신청자명을 입력하세요");
			myform.CW_USER_NAME.focus();
		}
		else if(CW_USER_NUMBER == ""){
			alert("전화번호를 입력하세요");
			myform.CW_USER_NUMBER.focus();
		}
		else if(BOOKING_POU == ""){
			alert("사용목적을 입력하세요");
			myform.BOOKING_POU.focus();
		}
		else{
			myform.BOOKING_USETIME.value = BOOKING_USETIME;
			myform.submit();
		}
	}
</script>
<style>
	h2{margin-left: 50px;}
	h3{margin-left: 100px;}
	table{border: 1px solid #444444;width:80%; margin-left: 100px;}
	td{border: 1px solid #444444;}
</style>
</head>
<body>
	<h2>신청자 등록</h2><hr>
	<form name="myform" method="post">
		<div style="text-align: center;">
			<img src="${ctp}/resources/data/${vo.FA_PHOTO}" alt="image" width="15%"/>
		</div>
		<h3><b>예약정보</b></h3>
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">시설명</td>
				<td>${vo.FA_FNAME}<input type="hidden" name="FA_FNAME" value="${vo.FA_FNAME}" /></td>
				<td style="width:15%; background-color: #ddd; text-align: center;">기관</td>
				<td>${vo.FA_INAME}<input type="hidden" name="FA_INAME" value="${vo.FA_INAME}" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용날짜</td>
				<td><input type="date" name="BOOKING_USEDAY" value="<%=sToday %>" /></td>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용시간</td>
				<td>
					<select id="BOOKING_USETIME1" name="BOOKING_USETIME1">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}:00</option>
						</c:forEach>
					</select>
					<select id="BOOKING_USETIME2" name="BOOKING_USETIME2">
						<c:forEach var="j" begin="0" end="24">
							<option value="${j}">${j}:00</option>
						</c:forEach>
					</select>
					<input type="hidden" name="BOOKING_USETIME" />
				</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">정원</td>
				<td>${vo.FA_PEOPLE_NO}<input type="hidden" name="FA_PEOPLE_NO" value="${vo.FA_PEOPLE_NO}" /></td>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용요금</td>
				<td>${vo.FA_PAY}<input type="hidden" name="FA_PAY" value="${vo.FA_PAY}" /></td>
			</tr>
		</table><br>
		<h3><b>신청자 정보</b></h3>
		<div style="text-align: right; margin-right: 300px">* 표시는 필수 입력 항목 입니다.</div>
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">신청자명 *</td>
				<td><input type="text" name="CW_USER_NAME" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">생년월일 *</td>
				<td><input type="date" name="CW_USER_BIRTH" value="<%=sToday %>" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">휴대전화 *</td>
				<td><input type="text" name="CW_USER_NUMBER" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">단체/동호회</td>
				<td><input type="text" name="CW_USER_HOBBY" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용인원 *</td>
				<td><input type="text" name="BOOKING_PERSONNEL" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">사용목적 *</td>
				<td><input type="text" name="BOOKING_POU" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">예약상태</td>
				<td>예약신청</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">승인여부 *</td>
				<td>
					<select name="BOOKING_APPROVAL">
						<option value="1">대기</option>
						<option value="2">승인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">결제상태 *</td>
				<td>
					<select name="BOOKING_PAYMENT">
						<option value="0">결제대기</option>
						<option value="1">결제완료</option>
					</select>
				</td>
			</tr>
		</table>
		<br><br>
		<div>
			<button style="margin-left: 100px;" type="button" onclick="location.href='${ctp}/member/booking';">목록</button>
			<button style="margin-left: 1400px;" type="reset">취소</button>
			<button type="button" onclick="inputOn()">저장</button>
		</div>
		<input type="hidden" name="BOOKING_STATUS" value="1"/>
		<input type="hidden" name="BOOKING_DELETE" value="1"/>
	</form>	
</body>
</html>