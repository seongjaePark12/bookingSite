<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="ctp" value="${pageContext.request.contextPath}" />
	 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약내역</title>
<script>
	function find(){
		var FA_NM = searchForm.FA_NM.value;
		var txt = searchForm.txt.value;
		var FA_FNAME='';
		if(FA_NM == ''){
			location.href="${ctp}/member/bookingListA?FA_GROUP=&FA_FNAME=";
		}
		if(FA_NM == '시설명'){
			location.href="${ctp}/member/bookingListA?FA_GROUP=&FA_FNAME="+txt;
		}
	}
</script>
<style>
	table{border: 1px solid #444444;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: red;}
</style>
</head>
<body>
	<h2>나의 예약내역</h2><hr>
	<br><br>
	<div style="text-align: center;">
		<form name="searchForm" method="post">
			<select name="FA_NM">
				<option value="">전체</option>
				<option value="시설명">시설명</option>
			</select>
			<c:if test="${FA_FNAME != ''}"><input type="text" name="txt" value="${FA_FNAME}" onkeyup="find()" /></c:if>
			<c:if test="${FA_FNAME == ''}"><input type="text" name="txt" onkeyup="find()" /></c:if>
			<button type="button" onclick="find()">검색</button>
		</form>
	</div><br>
	<h3>예약내역</h3>
	<table style="text-align: center; width:80%">
		<thead>
			<tr>
				<th>번호</th>
				<th>시설명</th>
				<th>운영일시</th>
				<th>예약상태</th>
				<th>승인여부</th>
				<th>취소</th>
				<th>결제상태</th>
				<th>결제금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.FA_FNAME}</td>
				<td>${vo.BOOKING_USEDAY}(${vo.BOOKING_USETIME})</td>
				<td>
					<c:if test="${vo.BOOKING_STATUS==1}">예약신청</c:if>
					<c:if test="${vo.BOOKING_STATUS==2}">예약완료</c:if>
					<c:if test="${vo.BOOKING_STATUS==3}">예약취소</c:if>
				</td>
				<td>
					<c:if test="${vo.BOOKING_APPROVAL==1}">승인대기</c:if>
					<c:if test="${vo.BOOKING_APPROVAL==2}">승인</c:if>
					<c:if test="${vo.BOOKING_APPROVAL==3}"><a href="${ctp}/">[반려]</a></c:if>
					<c:if test="${vo.BOOKING_APPROVAL==4}">선착순(승인)</c:if>
				</td>
				<td>
					<c:if test="${vo.BOOKING_DELETE==0}">환불중</c:if>
					<c:if test="${vo.BOOKING_DELETE==1}"><a href="${ctp}/member/refund?BOOKING_NO=${vo.BOOKING_NO}&FA_FNAME=${vo.FA_FNAME}">[환불요청]</a></c:if>
					<c:if test="${vo.BOOKING_DELETE==2}">예약취소</c:if>
					<c:if test="${vo.BOOKING_DELETE==3}">취소완료</c:if>
					<c:if test="${vo.BOOKING_DELETE==4}">사용완료</c:if>
					<c:if test="${vo.BOOKING_DELETE==5}">환불</c:if>
				</td>
				<td>
					<c:if test="${vo.BOOKING_PAYMENT==0}">결제하기</c:if>
					<c:if test="${vo.BOOKING_PAYMENT==1}">결제대기</c:if>
					<c:if test="${vo.BOOKING_PAYMENT==2}">결제완료</c:if>
					<c:if test="${vo.BOOKING_PAYMENT==3}">결제취소</c:if>
				</td>
				<td>${vo.FA_PAY}</td>
				<td><a href="${ctp}/member/bookingListGoA?BOOKING_NO=${vo.BOOKING_NO}&FA_FNAME=${vo.FA_FNAME}">상세보기</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${ctp}/member/main" style="margin-left:50%; font-size: 20pt">홈으로</a>
</body>
</html>