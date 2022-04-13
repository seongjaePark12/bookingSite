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
	function userDel(CW_USER_NO){
		var ans = confirm("회원을 삭제 하시겠습니까?");
		if(!ans) return false;
		$.ajax({
			type : "post",
			url : "${ctp}/admin/userDel",
			data:{CW_USER_NO : CW_USER_NO},
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
</style>
</head>
<body>
	<h2>회원 관리</h2><hr>
	<table style="text-align: center; width:80%">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>본인인증</th>
				<th>등급</th>
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.CW_USER_NAME}</td>
				<td>${vo.CW_USER_BIRTH}</td>
				<td>${vo.CW_USER_NUMBER}</td>
				<td>${vo.CW_USER_ADDRESS}</td>
				<c:if test="${vo.CW_USER_CHECK == 1}">
					<td>인증전</td>
				</c:if>
				<c:if test="${vo.CW_USER_CHECK == 2}">
					<td>인증후</td>
				</c:if>
				<c:if test="${vo.CW_USER_LEVEL == 0}">
					<td>회원</td>
				</c:if>
				<c:if test="${vo.CW_USER_LEVEL == 1}">
					<td>관리자</td>
				</c:if>
				<td><a href="#" onclick="userDel(${vo.CW_USER_NO})">탈퇴</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${ctp}/member/main" style="margin-left:50%; font-size: 20pt">홈으로</a>
</body>
</html>