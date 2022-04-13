<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자요</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function bookingUpdate(){
		var ans = confirm("예약을 수정 하시겠습니까?");
		if(!ans) return false;
		
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
	<h2>예약 수정</h2><hr>
		<form name="myform" method="post">
			<div style="text-align: center;">
				<img src="${ctp}/resources/data/${vo1.FA_PHOTO}" alt="image" width="15%"/>
			</div>	
			<h3><b>예약정보</b></h3>
			<table>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">시설명</td>
					<td>${vo.FA_FNAME}</td>
					<td style="width:15%; background-color: #ddd; text-align: center;">기관</td>
					<td>${vo.FA_INAME}</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">이용날짜</td>
					<td><input type="date" name="BOOKING_USEDAY" value="${vo.BOOKING_USEDAY}" /></td>
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
					<td>${vo.FA_PEOPLE_NO}</td>
					<td style="width:15%; background-color: #ddd; text-align: center;">이용요금</td>
					<td>${vo.FA_PAY}</td>
				</tr>
			</table><br>
			<h3><b>신청자 정보</b></h3>
			<div style="text-align: right; margin-right: 300px">* 표시는 필수 입력 항목 입니다.</div>
			<table>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">신청자명 *</td>
					<td><input type="text" name="CW_USER_NAME" value="${vo.CW_USER_NAME}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">생년월일 *</td>
					<td><input type="date" name="CW_USER_BIRTH" value="${vo.CW_USER_BIRTH}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">휴대전화 *</td>
					<td><input type="text" name="CW_USER_NUMBER" value="${vo.CW_USER_NUMBER}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">단체/동호회</td>
					<td><input type="text" name="CW_USER_HOBBY" value="${vo.CW_USER_HOBBY}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">이용인원 *</td>
					<td><input type="text" name="BOOKING_PERSONNEL" value="${vo.BOOKING_PERSONNEL}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">사용목적 *</td>
					<td><input type="text" name="BOOKING_POU" value="${vo.BOOKING_POU}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">예약상태</td>
					<td>
						<c:if test="${vo.BOOKING_STATUS == 1}">
							예약신청
						</c:if>
						<c:if test="${vo.BOOKING_STATUS == 2}">
							예약완료
						</c:if>
						<c:if test="${vo.BOOKING_STATUS == 3}">
							예약취소
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">승인여부 *</td>
					<td>
						<c:if test="${vo.BOOKING_APPROVAL == 1}">
							대기
						</c:if>
						<c:if test="${vo.BOOKING_APPROVAL == 2}">
							승인
						</c:if>
						<c:if test="${vo.BOOKING_APPROVAL == 2}">
							반려
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">결제상태 *</td>
					<td>
						<c:if test="${vo.BOOKING_PAYMENT == 0}">
							결제대기
						</c:if>
						<c:if test="${vo.BOOKING_PAYMENT == 1}">
							결제완료
						</c:if>
					</td>
				</tr>
			</table>
			<br><br>
			<div style="margin-left: 100px;">
				<button type="button" onclick="location.href='${ctp}/member/bookingListGo?BOOKING_NO=${vo.BOOKING_NO}&FA_FNAME=${vo.FA_FNAME}';">이전</button>
				<button style="margin-left: 1300px" type="button" onclick="bookingUpdate()">수정하기</button>
				<button type="reset">취소</button>
			</div>
			<input type="hidden" name="BOOKING_STATUS" value="${vo.BOOKING_STATUS}" />
			<input type="hidden" name="BOOKING_NO" value="${vo.BOOKING_NO}" />
			<input type="hidden" name="BOOKING_PAYMENT" value="${vo.BOOKING_PAYMENT}" />
			<input type="hidden" name="BOOKING_APPROVAL" value="${vo.BOOKING_APPROVAL}" />
			<input type="hidden" name="BOOKING_DELETE" value="${vo.BOOKING_DELETE}" />
		</form>	
</body>
</html>