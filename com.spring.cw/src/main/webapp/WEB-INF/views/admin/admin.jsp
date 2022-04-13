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
	a{margin-top: 10px; margin-left:15px; text-decoration: none; color: black;}
</style>
</head>
<body>
	<div style="text-align: center; margin-top: 300px; font-size: 15pt">
		<a href="${ctp}/admin/input">1.시설 등록</a>
		<a href="${ctp}/admin/view?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=">2.시설 현황</a>
		<a href="${ctp}/admin/inputBank">3.시설 은행 등록</a>
		<a href="${ctp}/admin/member">4.회원 관리</a>
		<br><br>
		<a href="${ctp}/member/main" style="font-size: 20pt">홈으로</a>
	</div>
</body>
</html>