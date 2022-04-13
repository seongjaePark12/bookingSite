<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<style>
	table{border: 1px solid #444444;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: red;}
</style>
</head>
<body>
	<h2>예약하기</h2><hr>
	<table style="text-align: center; width:80%">
		<thead>
			<tr>
				<th>번호</th>
				<th>시설분류</th>
				<th>시설이름</th>
				<th>기관이름</th>
				<th>시설 위치</th>
				<th>모집 인원</th>
				<th>이용요금</th>
				<th>사진</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.FA_GROUP}</td>
				<td><a href="${ctp}/member/bookingGo?FA_NO=${vo.FA_NO}">${vo.FA_FNAME}</a></td>
				<td>${vo.FA_INAME}</td>
				<td>${vo.FA_ADDRESS}</td>
				<td>${vo.FA_PEOPLE_NO}</td>
				<td>${vo.FA_PAY}</td>
				<td><img src="${ctp}/resources/data/${vo.FA_PHOTO}" alt="image" width="100px"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${ctp}/member/main" style="margin-left:50%; font-size: 20pt">홈으로</a>
</body>
</html>