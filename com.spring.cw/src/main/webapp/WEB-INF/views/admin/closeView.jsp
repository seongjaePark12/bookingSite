<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function viewDel(FA_NO){
		var ans = confirm("정말로 삭제 하시겠습니까?");
		if(!ans) return false;
		$.ajax({
			type : "post",
			url : "${ctp}/admin/closeDelete",
			data:{FA_NO : FA_NO},
			success:function(){
				location.reload();
			},
			error:function(){
				alert("전송오류");
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
	<h2>휴관일 관리</h2>
	<div>
		<a class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); font-size: 15pt; margin-left: 20px; color: white;" href="${ctp}/admin/viewBooking?FA_NO=${FA_NO}&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=">예약현황</a>
		<a class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); font-size: 15pt; color: white;" href="${ctp}/admin/refund?FA_NO=${FA_NO}">환불관리</a>
		<a class="text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73); font-size: 15pt; color: white;" href="${ctp}/admin/closeView?FA_NO=${FA_NO}">휴관일관리</a>
	</div>
	<br><br>
	<h4>휴관일 관리</h4>
	<br>
	<form name="myform" method="post">
		<table style="text-align: center; width:80%">
			<thead>
				<tr>
					<th>번호</th>
					<th>시설명</th>
					<th>기간</th>
					<th>휴관일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${st.count}</td>
					<td>${vo.FA_FNAME}</td>
					<td>${vo.FA_CLOSE_START} ~ ${vo.FA_CLOSE_END}</td>
					<td>${vo.FA_CLOSE_DAY}</td>
					<td><a href="${ctp}/admin/closeInput?FA_NO=${vo.FA_NO}">[등록 및 수정]</a></td>
					<td><a href="#" onclick="viewDel(${vo.FA_NO})" >[삭제]</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>	
	<br><br>
	<div style="text-align:center; font-size: 20pt">
		<a href="${ctp}/admin/view">목록</a>
		<a href="${ctp}/member/main">홈으로</a>
	</div>
</body>
</html>