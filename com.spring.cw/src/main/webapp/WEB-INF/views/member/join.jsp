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
		var idCheck = 0;
		function idCheckOn(){
			var CW_USER_MID = myform.CW_USER_MID.value;
			$.ajax({
		  		type : "post",
		  		url  : "../member/idCheck",
		  		data : {CW_USER_MID:CW_USER_MID},
		  		success:function(data){
		  			if(data == "1"){
			  			alert("중복된 아이디 입니다");
						$("#CW_USER_MID").focus();		  				
		  			}
		  			else{
			  			alert("사용 가능한 아이디 입니다");
			  			idCheck = 1;
		  			}
				},
		  		error:function() {
		  			alert("처리 실패!!");
		  		}
		  	});
		}
		function join(){
			var CW_USER_MID = myform.CW_USER_MID.value;
			var CW_USER_PWD = myform.CW_USER_PWD.value;
			var CW_USER_NAME = myform.CW_USER_NAME.value;
			var CW_USER_BIRTH = myform.CW_USER_BIRTH.value;
			var CW_USER_HOBBY = myform.CW_USER_HOBBY.value;
			var CW_USER_NUMBER = myform.CW_USER_NUMBER.value;
			var CW_USER_ADDRESS = myform.CW_USER_ADDRESS.value;
			
			if(CW_USER_MID == ""){
				alert("아이디를 입력하세요");
				return;
			}
			else if(CW_USER_PWD == ""){
				alert("비밀번호를 입력하세요");
				return;
			}
			else if(CW_USER_NAME == ""){
				alert("이름를 입력하세요");
				return;
			}
			else if(CW_USER_NUMBER == ""){
				alert("전화번호를 입력하세요");
				return;
			}
			else{
				if(idCheck == 1){
					myform.submit();
				}
				else{
					alert("아이디 중복체크를 해주세요");
				}
			}
		}
	</script>
	<style>
		h2{margin-left: 50px;}
		h3{margin-left: 100px;}
		table{border: 1px solid #444444;width:30%; margin-left: 35%;}
		td{border: 1px solid #444444;}
		a{text-decoration: none;}
	</style>
</head>
<body>
	<h2>회원가입</h2><hr>
	<form name="myform" method="post">
		<table >
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">아이디 *</td>
				<td><input type="text" id="CW_USER_MID" name="CW_USER_MID" placeholder="아이디 입력" />&nbsp;&nbsp;&nbsp;<button type="button" onclick="idCheckOn()">ID중복체크</button></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">비밀번호 *</td>
				<td><input type="password" id="CW_USER_PWD" name="CW_USER_PWD" placeholder="비밀번호 입력" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">이름 *</td>
				<td><input type="text" id="CW_USER_NAME" name="CW_USER_NAME" placeholder="이름 입력" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">생년월일</td>
				<td><input type="date" id="CW_USER_BIRTH" name="CW_USER_BIRTH" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">단체/동호회</td>
				<td><input type="text" id="CW_USER_HOBBY" name="CW_USER_HOBBY" placeholder="단체/동호회 입력" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">전화번호 *</td>
				<td><input type="text" id="CW_USER_NUMBER" name="CW_USER_NUMBER" placeholder="전화번호 입력" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">주소</td>
				<td><input type="text" id="CW_USER_ADDRESS" name="CW_USER_ADDRESS" placeholder="주소 입력" /></td>
			</tr>
			<tr><td colspan="2"><button type="button" onclick="join()">회원가입</button></td></tr>
		</table>
		<br><br>
		<div style="text-align: center;">
			<a href="${ctp}/member/main">메인</a>
		</div>
	</form>
</body>
</html>