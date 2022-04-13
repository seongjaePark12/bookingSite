<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
	<script>
		function loginCheck(){
			var CW_USER_MID = myform.CW_USER_MID.value;
			var CW_USER_PWD = myform.CW_USER_PWD.value;
			if(CW_USER_MID == "" || CW_USER_MID == null){
				alert("아이디를 입력하세요");
				myform.CW_USER_MID.focus();
				return;
			}
			else if(CW_USER_PWD == "" || CW_USER_PWD == null){
				alert("비밀번호를 입력하세요");
				myform.CW_USER_PWD.focus();
				return;
			}
			else if (CW_USER_MID != "" && CW_USER_PWD != ""){
				myform.submit();
			}
		}
		
	</script>
<style>
	.login{font-size: 20pt; }
	a{text-decoration: none;}
</style>
</head>
<body>
	<form name="myform" method="post">
		<div style="text-align: center;margin-top: 200px;">
			<h2>로그인</h2>
			<input type="text" id="CW_USER_MID" name="CW_USER_MID" value="${mid}" placeholder="아이디를 입력하세요" class="login" /><br><br>
			<input type="password" id="CW_USER_PWD" name="CW_USER_PWD" placeholder="비밀번호를 입력하세요" class="login" /><br>
			<input type="checkbox" name="remember" class="login"/> 아이디저장<br><br>
			<input type="button" onclick="loginCheck()" value="로그인" style="width:150px;">
		</div>
	</form>
	<br><br>
	<div style="text-align: center;font-size: 15pt">
		<a href="${ctp}/member/join">회원가입</a>
		<br>
		<a href="${ctp}/member/main">메인</a>
	</div>
</body>
</html>