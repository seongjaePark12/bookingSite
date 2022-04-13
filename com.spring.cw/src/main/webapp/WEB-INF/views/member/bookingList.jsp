<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자요</title>
<style>
	table{border: 1px solid #444444;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: red;}
</style>
</head>
<body>
	<h2>예약 리스트 전체</h2><hr>
	<table style="text-align: center; width:80%">
		<thead>
			<tr>
				<th>번호</th>
				<th>시설 이름</th>
				<th>기관 이름</th>
				<th>이용날짜</th>
				<th>인원</th>
				<th>회원 이름</th>
				<th>결제상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td><a href="${ctp}/member/bookingListGo?BOOKING_NO=${vo.BOOKING_NO}&FA_FNAME=${vo.FA_FNAME}">${vo.FA_FNAME}</a></td>
				<td>${vo.FA_INAME}</td>
				<td>${vo.BOOKING_USEDAY}</td>
				<td>${vo.BOOKING_PERSONNEL}</td>
				<td>${vo.CW_USER_NAME}</td>
				<td>
					<c:if test="${vo.BOOKING_PAYMENT == '0'}">결제대기</c:if>
					<c:if test="${vo.BOOKING_PAYMENT == '1'}">결제완료</c:if>
					<c:if test="${vo.BOOKING_PAYMENT == '2'}">결제취소</c:if>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${ctp}/member/main" style="margin-left:50%; font-size: 20pt">홈으로</a>
</body>
</html>