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
<title>예약신청</title>
<style>
	a{margin-top: 10px; text-decoration: none; color: black;}
</style>
<script type="text/javascript">
	function inputOn(){
		var BOOKING_USETIME2 = myform.BOOKING_USETIME2.value;
		var BOOKING_USETIME1 = myform.BOOKING_USETIME1.value;
		var BOOKING_USETIME = BOOKING_USETIME1+"~"+BOOKING_USETIME2;
		var BOOKING_PERSONNEL = myform.BOOKING_PERSONNEL.value;
		var CW_USER_NAME = myform.CW_USER_NAME.value;
		var CW_USER_NUMBER = myform.CW_USER_NUMBER.value;
		var BOOKING_POU = myform.BOOKING_POU.value;
		var agree = myform.agree.value;
		
		if(BOOKING_PERSONNEL == ""){
			alert("이용인원을 입력하세요");
			myform.BOOKING_PERSONNEL.focus();
		}
		else if(agree == 2 || agree == ""){
			alert("개인정보수집 및 이용안내 동의를 하지 않으면 예약이 불가능합니다");
			return;
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
	<h2>신청서 작성(본인인증 후)</h2><hr><br>
	<form name="myform" method="post">
		<table>
			<tr>
				<td style="text-align: center;font-weight: bold;">철원 공공체육시설 예약을 위한 개인정보 수집,이용동의서</td>
			</tr>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp; 철원 공공체육시설 예약을 위하여, 개인정보 수집,이용에 대한 아래 내용을 자세히 읽어보신 후 동의 여부를 결정하여 주시기 바랍니다.<br><br>
					&nbsp;&nbsp;&nbsp;- 개인정보 수집 항목 : 성명, 전화번호<br>
					&nbsp;&nbsp;&nbsp;- 수집목적 : 공공체육시설 예약 신청의 원활한 절차 진행 및 예약 안내를 위함<br>
					&nbsp;&nbsp;&nbsp;- 보유기간 : 1년<br><br>
					&nbsp;&nbsp;&nbsp;위와 같이 개인정보 수집,이용의 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 서비스를 이용하실 수 없음을 알려드립니다.
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<input type="radio" name="agree" value="1" >동의
			        <input type="radio" name="agree" value="2">동의하지않음
			    </td>
			</tr>
		</table>
		<br><br>
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
				<td>${BOOKING_USEDAY}</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용시간</td>
				<td>${BOOKING_USETIME1}~${BOOKING_USETIME2}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">정원</td>
				<td>${vo.FA_PEOPLE_NO}</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용요금</td>
				<td>${vo.FA_PAY}</td>
			</tr>
		</table>
		<br>
		<h3><b>신청자 정보</b></h3>
		<div style="text-align: right; margin-right: 300px">* 표시는 필수 입력 항목 입니다.</div>
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">신청자명</td>
				<td>${sName}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">생년월일</td>
				<td>${sBirth}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">휴대전화 *</td>
				<td><input type="text" name="CW_USER_NUMBER" value="${sNum}" /></td>
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
		</table>
		<br><br>
		<div style="margin-left: 600px;">
			<button type="button" onclick="location.href='${ctp}/member/bookingA?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=';" style="width:200px;">취소</button>
			<button type="button" onclick="inputOn()" style="width:200px;">예약하기</button>
		</div>
		<input type="hidden" name="BOOKING_STATUS" value="1"/>
		<input type="hidden" name="BOOKING_APPROVAL" value="1"/>
		<input type="hidden" name="BOOKING_PAYMENT" value="0"/>
		<input type="hidden" name="BOOKING_DELETE" value="1"/>
		<input type="hidden" name="FA_FNAME" value="${vo.FA_FNAME}" />
		<input type="hidden" name="FA_INAME" value="${vo.FA_INAME}" />
		<input type="hidden" name="FA_PEOPLE_NO" value="${vo.FA_PEOPLE_NO}" />
		<input type="hidden" name="FA_PAY" value="${vo.FA_PAY}" />
		<input type="hidden" name="CW_USER_NAME" value="${sName}" />
		<input type="hidden" name="CW_USER_BIRTH" value="${sBirth}" />
		<input type="hidden" name="BOOKING_USETIME" />
		<input type="hidden" name="BOOKING_USETIME1" value="${BOOKING_USETIME1}" />
		<input type="hidden" name="BOOKING_USETIME2" value="${BOOKING_USETIME2}" />
	</form>	
</body>
</html>