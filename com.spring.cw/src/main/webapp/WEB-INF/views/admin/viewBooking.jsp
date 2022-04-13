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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function dateCheck(){
		var BOOKING_USEDAY = searchForm.BOOKING_USEDAY.value;
		var FA_NO = searchForm.FA_NO.value;
		location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY="+BOOKING_USEDAY+"&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=";
	}
	function statusCheck(){
		var BOOKING_STATUS = searchForm.BOOKING_STATUS.value;
		var FA_NO = searchForm.FA_NO.value;
		location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY=&BOOKING_STATUS="+BOOKING_STATUS+"&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=";
	}
	function approvalCheck(){
		var BOOKING_APPROVAL = searchForm.BOOKING_APPROVAL.value;
		var FA_NO = searchForm.FA_NO.value;
		location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL="+BOOKING_APPROVAL+"&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=";
	}
	function paymentCheck(){
		var BOOKING_PAYMENT = searchForm.BOOKING_PAYMENT.value;
		var FA_NO = searchForm.FA_NO.value;
		location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT="+BOOKING_PAYMENT+"&CW_USER_NAME=&CW_USER_NUMBER=";
	}
	function find(){
		var FA_NO = searchForm.FA_NO.value;
		var GROUP = searchForm.GROUP.value;
		var txt = searchForm.txt.value;
		if(GROUP == ''){
			location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=";
		}
		if(GROUP == '신청자'){
			location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME="+txt+"&CW_USER_NUMBER=";
		}
		if(GROUP == '휴대전화'){
			location.href="${ctp}/admin/viewBooking?FA_NO="+FA_NO+"&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER="+txt;
		}
	}
	function Check1(obj){
	  	var ans = confirm("승인여부를 변경하시겠습니까?");
	  	if(!ans) {
	  		return false;
	  	}
	  	var str = $(obj).val();
	  	var query = {
	  			BOOKING_NO : str.substring(1),
	  			BOOKING_APPROVAL : str.substring(0,1)
	  	}
	  	$.ajax({
	  		type : "post",
	  		url  : "../admin/approvalUpdate",
	  		data : query,
	  		success:function(){
				location.reload();
			},
	  		error:function() {
	  			alert("처리 실패!!");
	  		}
	  	});
	}
	function Check2(obj){
	  	var ans = confirm("결제상태를 변경하시겠습니까?");
	  	if(!ans) {
	  		return false;
	  	}
	  	var str = $(obj).val();
	  	var query = {
	  			BOOKING_NO : str.substring(1),
	  			BOOKING_PAYMENT : str.substring(0,1)
	  	}
	  	$.ajax({
	  		type : "post",
	  		url  : "../admin/paymentUpdate",
	  		data : query,
	  		success:function(){
				location.reload();
			},
	  		error:function() {
	  			alert("처리 실패!!");
	  		}
	  	});
	}
	function booDelete(BOOKING_NO){
	  	var ans = confirm("예약을 삭제하시겠습니까?");
	  	if(!ans) {
	  		return false;
	  	}
	  	$.ajax({
	  		type : "post",
	  		url  : "../admin/booDelete",
	  		data : {BOOKING_NO:BOOKING_NO},
	  		success:function(){
				location.reload();
			},
	  		error:function() {
	  			alert("처리 실패!!");
	  		}
	  	});
	}
</script>
<style>
	table{border: 1px solid #444444;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: black;}
</style>
</head>
<body>
	<h2>예약현황(신청자 명단)</h2>
	<div>
		<a class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); font-size: 15pt; margin-left: 20px;" href="${ctp}/admin/viewBooking?FA_NO=${FA_NO}&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=">예약현황</a>
		<a class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); font-size: 15pt;" href="${ctp}/admin/refund?FA_NO=${FA_NO}">환불관리</a>
		<a class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); font-size: 15pt;" href="${ctp}/admin/closeView?FA_NO=${FA_NO}">휴관일관리</a>
	</div>
	<br><br>
	<h4>신청내역</h4>
	<br>
	<table style="width:90%;">
		<tr>
			<td style="text-align: center;" colspan="7"><b>${vovo.FA_FNAME}</b></td>
			<td style="text-align: right;" colspan="2"><b>모집정원 :${vovo.FA_PEOPLE_NO}</b></td>
		</tr>
		<tr style="text-align: center;">
			<td rowspan="2">전체 신청자</td>
			<td colspan="2">예약상태</td>
			<td colspan="3">승인여부</td>
			<td colspan="3">결제상태</td>
		</tr>
		<tr style="text-align: center;">
			<td>예약신청</td>
			<td>예약취소</td>
			<td>대기</td>
			<td>승인</td>
			<td>반려</td>
			<td>결제대기</td>
			<td>결제완료</td>
			<td>결제취소</td>
		</tr>
		<tr style="text-align: center;">
			<td width="4.5%">${mem}</td>
			<td width="4.5%">${m1}</td>
			<td width="4.5%">${m2}</td>
			<td width="4.5%">${m3}</td>
			<td width="4.5%">${m4}</td>
			<td width="4.5%">${m5}</td>
			<td width="4.5%">${m6}</td>
			<td width="4.5%">${m7}</td>
			<td width="4.5%">${m8}</td>
		</tr>
	</table>
	<br><br>
	<form name="searchForm" method="post">
		<c:if test="${BOOKING_USEDAY == ''}">
			이용일자<input type="date" name="BOOKING_USEDAY" value="<%=sToday %>" onchange="dateCheck()" />
		</c:if>
		<c:if test="${BOOKING_USEDAY != ''}">
			이용일자<input type="date" name="BOOKING_USEDAY" value="${BOOKING_USEDAY}" onchange="dateCheck()" />
		</c:if>
		<select name="BOOKING_STATUS" onchange="statusCheck()">
			<option value=""${BOOKING_STATUS == '' ? 'selected' : '' }>예약상태</option>
			<option value="1"${BOOKING_STATUS == '1' ? 'selected' : '' }>예약신청</option>
			<option value="2"${BOOKING_STATUS == '2' ? 'selected' : '' }>예약완료</option>
			<option value="3"${BOOKING_STATUS == '3' ? 'selected' : '' }>예약취소</option>
		</select>
		<select name="BOOKING_APPROVAL" onchange="approvalCheck()">
			<option value=""${BOOKING_APPROVAL == '' ? 'selected' : '' }>승인여부</option>
			<option value="1"${BOOKING_APPROVAL == '1' ? 'selected' : '' }>대기</option>
			<option value="2"${BOOKING_APPROVAL == '2' ? 'selected' : '' }>승인</option>
			<option value="3"${BOOKING_APPROVAL == '3' ? 'selected' : '' }>반려</option>
		</select>
		<select name="BOOKING_PAYMENT" onchange="paymentCheck()">
			<option value=""${BOOKING_PAYMENT == '' ? 'selected' : '' }>결제상태</option>
			<option value="0"${BOOKING_PAYMENT == '0' ? 'selected' : '' }>결제대기</option>
			<option value="1"${BOOKING_PAYMENT == '1' ? 'selected' : '' }>결제완료</option>
			<option value="2"${BOOKING_PAYMENT == '2' ? 'selected' : '' }>결제취소</option>
		</select>
		<select name="GROUP">
			<option value="">전체</option>
			<option value="신청자">신청자</option>
			<option value="휴대전화">휴대전화</option>
		</select>
		<c:if test="${CW_USER_NAME != ''}"><input type="text" name="txt" value="${CW_USER_NAME}"/></c:if>
		<c:if test="${CW_USER_NUMBER != ''}"><input type="text" name="txt" value="${CW_USER_NUMBER}"/></c:if>
		<c:if test="${CW_USER_NUMBER == '' && CW_USER_NAME == ''}"><input type="text" name="txt"/></c:if>
		<c:forEach var="vo1" items="${vos}">
			<c:set var="FA_NO1" value="${vo1.FA_NO}"/>
		</c:forEach>
			<input type="hidden" name="FA_NO" value="${FA_NO1}" />
		<button type="button" onclick="find()">검색</button>
	</form>
	<br><br>
	<form name="myform" method="post">
		<table style="text-align: center; width:90%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>신청자</th>
					<th>휴대전화</th>
					<th>이용자수</th>
					<th>예약일시</th>
					<th>이용일시</th>
					<th>예약상태</th>
					<th>승인여부</th>
					<th>결제상태</th>
					<th>취소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${st.count}</td>
					<td>${vo.CW_USER_NAME}</td>
					<td>${vo.CW_USER_NUMBER}</td>
					<td>${vo.BOOKING_PERSONNEL}</td>
					<td>${vo.BOOKING_DAY}</td>
					<td>${vo.BOOKING_USEDAY}<br>${vo.BOOKING_USETIME}</td>
					<td>
						<c:if test="${vo.BOOKING_STATUS == '1'}">예약신청</c:if>
						<c:if test="${vo.BOOKING_STATUS == '2'}">예약완료</c:if>
						<c:if test="${vo.BOOKING_STATUS == '3'}">예약취소</c:if>
					</td>
					<td>
						<select name="BOOKING_APPROVAL" onchange="Check1(this)">
							<option value="1${vo.BOOKING_NO}" ${vo.BOOKING_APPROVAL == '1' ? 'selected' : '' }>대기</option>
							<option value="2${vo.BOOKING_NO}" ${vo.BOOKING_APPROVAL == '2' ? 'selected' : '' }>승인</option>
							<option value="3${vo.BOOKING_NO}" ${vo.BOOKING_APPROVAL == '3' ? 'selected' : '' }>반려</option>
						</select>
					</td>
					<td>
						<c:if test="${vo.BOOKING_PAYMENT == '0' || vo.BOOKING_PAYMENT == '1'}">
							<select name="BOOKING_PAYMENT" onchange="Check2(this)">
								<option value="0${vo.BOOKING_NO}" ${vo.BOOKING_PAYMENT == '0' ? 'selected' : '' }>결제대기</option>
								<option value="1${vo.BOOKING_NO}" ${vo.BOOKING_PAYMENT == '1' ? 'selected' : '' }>결제완료</option>
								<option value="2${vo.BOOKING_NO}" >결제취소</option>
							</select>
						</c:if>
						<c:if test="${vo.BOOKING_PAYMENT == '2'}">결제취소</c:if>
					</td>
					<td>
						<c:if test="${vo.BOOKING_DELETE == '1'}">환불요청</c:if>
						<c:if test="${vo.BOOKING_DELETE == '2'}">예약취소</c:if>
						<c:if test="${vo.BOOKING_DELETE == '3'}">취소완료</c:if>
						<c:if test="${vo.BOOKING_DELETE == '4'}">사용완료</c:if>
						<c:if test="${vo.BOOKING_DELETE == '5'}">환불</c:if>
						<c:if test="${vo.BOOKING_DELETE == '6'}">[관리자취소]</c:if>
					</td>
					<td><a href="${ctp}/admin/booUpdate?FA_NO=${vo.FA_NO}">[수정]</a></td>
					<td><a href="#" onclick="booDelete(${vo.BOOKING_NO})">[삭제]</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/admin/viewBooking?pag=1&pageSize=${pageSize}&FA_NO=${FA_NO}&BOOKING_USEDAY=${BOOKING_USEDAY}&BOOKING_STATUS=${BOOKING_STATUS}&BOOKING_APPROVAL=${BOOKING_APPROVAL}&BOOKING_PAYMENT=${BOOKING_PAYMENT}&CW_USER_NAME=${CW_USER_NAME}&CW_USER_NUMBER=${CW_USER_NUMBER}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/admin/viewBooking?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&FA_NO=${FA_NO}&BOOKING_USEDAY=${BOOKING_USEDAY}&BOOKING_STATUS=${BOOKING_STATUS}&BOOKING_APPROVAL=${BOOKING_APPROVAL}&BOOKING_PAYMENT=${BOOKING_PAYMENT}&CW_USER_NAME=${CW_USER_NAME}&CW_USER_NUMBER=${CW_USER_NUMBER}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/admin/viewBooking?pag=${i}&pageSize=${pageSize}&FA_NO=${FA_NO}&BOOKING_USEDAY=${BOOKING_USEDAY}&BOOKING_STATUS=${BOOKING_STATUS}&BOOKING_APPROVAL=${BOOKING_APPROVAL}&BOOKING_PAYMENT=${BOOKING_PAYMENT}&CW_USER_NAME=${CW_USER_NAME}&CW_USER_NUMBER=${CW_USER_NUMBER}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/admin/viewBooking?pag=${i}&pageSize=${pageSize}&FA_NO=${FA_NO}&BOOKING_USEDAY=${BOOKING_USEDAY}&BOOKING_STATUS=${BOOKING_STATUS}&BOOKING_APPROVAL=${BOOKING_APPROVAL}&BOOKING_PAYMENT=${BOOKING_PAYMENT}&CW_USER_NAME=${CW_USER_NAME}&CW_USER_NUMBER=${CW_USER_NUMBER}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/admin/viewBooking?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&FA_NO=${FA_NO}&BOOKING_USEDAY=${BOOKING_USEDAY}&BOOKING_STATUS=${BOOKING_STATUS}&BOOKING_APPROVAL=${BOOKING_APPROVAL}&BOOKING_PAYMENT=${BOOKING_PAYMENT}&CW_USER_NAME=${CW_USER_NAME}&CW_USER_NUMBER=${CW_USER_NUMBER}" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" class="page-link text-dark" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/admin/viewBooking?pag=${totPage}&pageSize=${pageSize}&FA_NO=${FA_NO}&BOOKING_USEDAY=${BOOKING_USEDAY}&BOOKING_STATUS=${BOOKING_STATUS}&BOOKING_APPROVAL=${BOOKING_APPROVAL}&BOOKING_PAYMENT=${BOOKING_PAYMENT}&CW_USER_NAME=${CW_USER_NAME}&CW_USER_NUMBER=${CW_USER_NUMBER}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<br><br>	
	<div style="text-align:center; font-size: 20pt">
		<a href="${ctp}/admin/view">목록</a>
		<a href="${ctp}/member/bookingGo?FA_NO=${FA_NO}">등록</a>
		<a href="${ctp}/member/main">홈으로</a>
	</div>
</body>
</html>