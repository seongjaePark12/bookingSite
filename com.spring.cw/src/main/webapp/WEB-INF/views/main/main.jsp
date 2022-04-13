<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function userDel(sMid){
	  	var ans = confirm("탈퇴하시겠습니까?");
	  	if(!ans) {
	  		return false;
	  	}
		var CW_USER_MID = myform.CW_USER_MID.value;
		$.ajax({
	  		type : "post",
	  		url  : "../member/userDel",
	  		data : {CW_USER_MID:CW_USER_MID},
	  		success:function(){
	  			alert("안녕히가세요~~~~~~~~~~");
				location.reload();
			},
	  		error:function() {
	  			alert("처리 실패!!");
	  		}
	  	});
	}
</script>
<style>
	table{border: 1px solid #444444;width:35%; margin-left: 33%;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: black;font-size: 30px;}
</style>
</head>
<body>
	<div style="text-align: center; margin-top: 150px;">
		<h1>철원군 연습</h1>
		<c:if test="${sMid == null}">
			<a href="${ctp}/member/login">로그인</a><br>
			<a href="${ctp}/member/join">회원가입</a>
		</c:if>
		<c:if test="${sMid != null}">
			<c:if test="${sLevel == 1}">
				<a href="${ctp}/admin/admin">관리자</a><br>
				<a href="${ctp}/member/booking">예약하기</a><br>
				<a href="${ctp}/member/bookingList">예약 리스트 전체</a>
			</c:if>
			<c:if test="${sLevel == 0}">
				<a href="${ctp}/member/bookingA?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=">예약하기</a><br>
				<a href="${ctp}/member/bookingListA">예약내역보기</a>
			</c:if>
			<div style="text-align: center; margin-top: 100px;">
			<table>
				<tr>
					<td style="width:15%; background-image: linear-gradient(120deg, #9C7521, #FFDF73); text-align: center;">이름</td>
					<td>${sName}</td>
				</tr>
				<tr>
					<td style="width:15%; background-image: linear-gradient(120deg, #9C7521, #FFDF73); text-align: center;">방문횟수</td>
					<td>${sVisitcnt}</td>
				</tr>
				<tr>
					<td style="width:15%; background-image: linear-gradient(120deg, #9C7521, #FFDF73); text-align: center;">가입일</td>
					<td>${sJoinday}</td>
				</tr>
				<tr>
					<td style="width:15%; background-image: linear-gradient(120deg, #9C7521, #FFDF73); text-align: center;">최근방문일</td>
					<td>${sLastday}</td>
				</tr>
				<tr>
					<td style="width:15%; background-image: linear-gradient(120deg, #9C7521, #FFDF73); text-align: center;">등급</td>
					<td>
						<c:if test="${sLevel == 0}">회원</c:if>
						<c:if test="${sLevel == 1}">관리자</c:if>
					</td>
				</tr>
			</table>
			<br><br>
			<form name="myform" method="post">
				<a href="${ctp}/member/logout">로그아웃</a>
				<a href="#" onclick="userDel()" style="margin-left: 400px">회원 탈퇴</a>
				<input type="hidden" name="CW_USER_MID" value="${sMid}" />
			</form>
			</div>
		</c:if>
	</div>
</body>
</html>