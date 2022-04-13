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
<title>휴관일등록</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function inputOn(){
	    var FA_CLOSE_DAY = [];
	    var FA_NO = myform.FA_NO.value;
	    var FA_FNAME = myform.FA_FNAME.value;
	    var FA_CLOSE_START = myform.FA_CLOSE_START.value;
	    var FA_CLOSE_END = myform.FA_CLOSE_END.value;
	    $("input[name='FA_CLOSE_DAY']:checked").each(function(i){
	    	FA_CLOSE_DAY.push($(this).val());
	    })
	    $.ajax({
			type : "post",
			url : "${ctp}/admin/closeInputUP",
			data:{
				FA_NO : FA_NO,
				FA_FNAME : FA_FNAME,
				FA_CLOSE_START : FA_CLOSE_START,
				FA_CLOSE_END : FA_CLOSE_END,
				FA_CLOSE_DAY : FA_CLOSE_DAY
				},
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
	h2{margin-left: 50px;}
	h3{margin-left: 100px;}
	table{border: 1px solid #444444;width:80%; margin-left: 100px;}
	td{border: 1px solid #444444;}
</style>
</head>
<body>
	<h2>휴관일 등록</h2><hr>
	<form name="myform" method="post">
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">시설명</td>
				<td><input type="text" id="FA_FNAME" name="FA_FNAME" value="${vo.FA_FNAME}" readonly /> </td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">기간</td>
				<td>
					<c:if test="${vo.FA_CLOSE_START == ''}">
						<input type="date" name="FA_CLOSE_START" id="FA_CLOSE_START" value="<%=sToday %>" />
						<input type="date" name="FA_CLOSE_END" id="FA_CLOSE_END" value="<%=sToday %>" />
					</c:if>
					<c:if test="${vo.FA_CLOSE_START != ''}">
						<input type="date" name="FA_CLOSE_START" id="FA_CLOSE_START" value="${vo.FA_CLOSE_START}" />
						<input type="date" name="FA_CLOSE_END" id="FA_CLOSE_END" value="${vo.FA_CLOSE_END}" />
					</c:if>
				</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">휴관일</td>
				<td>
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="월요일" <c:if test="${vo.FA_CLOSE_DAY.contains('월요일')}">checked</c:if>/>월요일
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="화요일" <c:if test="${vo.FA_CLOSE_DAY.contains('화요일')}">checked</c:if>/>화요일
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="수요일" <c:if test="${vo.FA_CLOSE_DAY.contains('수요일')}">checked</c:if>/>수요일
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="목요일" <c:if test="${vo.FA_CLOSE_DAY.contains('목요일')}">checked</c:if>/>목요일
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="금요일" <c:if test="${vo.FA_CLOSE_DAY.contains('금요일')}">checked</c:if>/>금요일
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="토요일" <c:if test="${vo.FA_CLOSE_DAY.contains('토요일')}">checked</c:if>/>토요일
					<input type="checkBox" name="FA_CLOSE_DAY" id="FA_CLOSE_DAY" value="일요일" <c:if test="${vo.FA_CLOSE_DAY.contains('일요일')}">checked</c:if>/>일요일
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">			
					<button type="reset" >취소</button>
					<button type="button" onclick="inputOn()" >저장</button>
				</td>
			</tr>
		</table>		
		<input type="hidden" name="FA_NO" id="FA_NO" value="${vo.FA_NO}" />
		<br><br>
		<div style="text-align: center;">
			<a href="${ctp}/admin/closeView?FA_NO=${FA_NO}">휴관일관리</a>
			<a href="${ctp}/member/main">홈으로</a>
		</div>
	</form>
</body>
</html>