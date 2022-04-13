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
<title>은행정보등록</title>
<script>
	function inputOn(){
		var FA_FNAME = myform.FA_FNAME.value;
		var FA_BANK_NAME = myform.FA_BANK_NAME.value;
		var FA_BANK_NUM = myform.FA_BANK_NUM.value;
		var FA_BANK_MASTER = myform.FA_BANK_MASTER.value;
		
		if(FA_FNAME == ""){
			alert("시설 이름을 입력하세요");
			myform.FA_FNAME.focus();
			return;
		}
		else if(FA_BANK_NAME == ""){
			alert("은행명을 입력하세요");
			myform.FA_BANK_NAME.focus();
			return;
		}
		else if(FA_BANK_NUM == ""){
			alert("계좌번호를 입력하세요");
			myform.FA_BANK_NUM.focus();
			return;
		}
		else if(FA_BANK_MASTER == ""){
			alert("예금주를 입력하세요");
			myform.FA_BANK_MASTER.focus();
			return;
		}
		else{
			myform.submit();
		}
	}
</script>
<style>
	h2{margin-left: 50px;}
	h3{margin-left: 100px;}
	table{border: 1px solid #444444;width:80%; margin-left: 100px;}
	td{border: 1px solid #444444;}
</style>
</head>
<body>
	<h2>시설 은행정보등록</h2><hr>
	<form name="myform" method="post">
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">시설명</td>
				<td>
					<select id="FA_FNAME" name="FA_FNAME">
						<option value="">선택</option> 
					<c:forEach var="vo" items="${vos}">	
						<option value="${vo.FA_FNAME}">${vo.FA_FNAME}</option> 
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">은행명</td>
				<td><input type="text" id="FA_BANK_NAME" name="FA_BANK_NAME" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">계좌번호</td>
				<td><input type="number" id="FA_BANK_NUM" name="FA_BANK_NUM" /></td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">예금주</td>
				<td><input type="text" id="FA_BANK_MASTER" name="FA_BANK_MASTER" /></td>
			</tr>
		</table>
		<br><br>
		<div style="text-align: center;">
			<button type="button" onclick="location.href='${ctp}/admin/admin';">이전</button>
			<button type="button" onclick="inputOn()">저장</button>
			<button type="reset" >취소</button>
		</div>
	</form>
</body>
</html>