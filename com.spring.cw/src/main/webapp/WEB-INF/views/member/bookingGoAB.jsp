<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>예약신청</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	//결제수단 라디오버튼 클릭시
	function paymentChange() {
	  if($('input:radio[id=infor]').is(':checked')){
	    $("#Infor").show();
	    $("#Notice").hide();
	    $("#Map").hide();
	  }
	  else if($('input:radio[id=notice]').is(':checked')){
	    $("#Notice").show();
	    $("#Infor").hide();
	    $("#Map").hide();
	  }
	  else if($('input:radio[id=map]').is(':checked')){
	    $("#Map").show();
	    $("#Notice").hide();
	    $("#Infor").hide();
	  }
	}
	function gogog(){
		var FA_NO = myform.FA_NO.value;
		var BOOKING_USEDAY = myform.BOOKING_USEDAY.value;
		var BOOKING_USETIME2 = myform.BOOKING_USETIME2.value;
		var BOOKING_USETIME1 = myform.BOOKING_USETIME1.value;
		BOOKING_USETIME1 = BOOKING_USETIME1+":00";
		BOOKING_USETIME2 = BOOKING_USETIME2+":00";
		$.ajax({
			type : "post",
			url : "${ctp}/member/bookingBooking",
			data:{
				FA_NO : FA_NO,
				BOOKING_USEDAY : BOOKING_USEDAY,
				BOOKING_USETIME1 : BOOKING_USETIME1,
				BOOKING_USETIME2 : BOOKING_USETIME2
				},
			success:function(){
				location.href="${ctp}/member/bookingGoA?FA_NO="+FA_NO+"&BOOKING_USEDAY="+BOOKING_USEDAY+"&BOOKING_USETIME1="+BOOKING_USETIME1+"&BOOKING_USETIME2="+BOOKING_USETIME2+"";
			},
			error:function(){
				alert("전송오류");
			}
		});
	}
</script>
<style>
	a{margin-top: 10px; text-decoration: none; color: black;}
	h2{margin-left: 50px;}
	h3{margin-left: 100px;}
	table{border: 1px solid #444444;width:80%; margin-left: 100px;}
	td{border: 1px solid #444444;}
</style>
</head>
<body>
	<form name="myform" method="post">
		<h2>예약신청</h2><hr><br>
		<h1>${vo.FA_FNAME}</h1>
		<table>
			<tr><td><img src="${ctp}/resources/data/${vo.FA_PHOTO}" width="40%" alt="image" /></td></tr>
			<tr><td>이용날짜</td></tr>
			<tr><td><input type="date" name="BOOKING_USEDAY" value="<%=sToday %>" /></td></tr>
			<tr><td>이용시간</td></tr>
			<tr>
				<td>
					<select id="BOOKING_USETIME1" name="BOOKING_USETIME1">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}:00</option>
						</c:forEach>
					</select>
					<select id="BOOKING_USETIME2" name="BOOKING_USETIME2">
						<c:forEach var="j" begin="0" end="24">
							<option value="${j}">${j}:00</option>
						</c:forEach>
					</select>
					<input type="hidden" name="FA_NO" value="${vo.FA_NO}"/>
				</td>
			</tr>
		</table>
		<h3><b>기본정보</b></h3>
		<table>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">시설명</td>
				<td>${vo.FA_FNAME}</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">기관</td>
				<td>${vo.FA_INAME}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">접수기간</td>
				<td>${fn:split(vo.FA_AP_START,'/')[0]} | ${fn:split(vo.FA_AP_START,'/')[1]}:${fn:split(vo.FA_AP_START,'/')[2]} ~ ${fn:split(vo.FA_AP_END,'/')[0]} | ${fn:split(vo.FA_AP_END,'/')[1]}:${fn:split(vo.FA_AP_END,'/')[2]}</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">장소/위치</td>
				<td>${vo.FA_ADDRESS}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">운영기간</td>
				<td>${vo.FA_OP_START} ~ ${vo.FA_OP_END}</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">운영시간</td>
				<td>${vo.FA_OPTIME_STRAT}:00~${vo.FA_OPTIME_END}:00</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">예약방식</td>
				<td>
					<c:if test="${vo.FA_METHOD == '1'}">승인</c:if>
					<c:if test="${vo.FA_METHOD == '2'}">선착순</c:if>
				</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용정원</td>
				<td>${vo.FA_PEOPLE_NO}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">예약문의</td>
				<td>${vo.FA_NUMBER}</td>
				<td style="width:15%; background-color: #ddd; text-align: center;">이용대상</td>
				<td>${vo.FA_TARGET}</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: #ddd; text-align: center;">예약문의</td>
				<td colspan="3">${vo.FA_PAY}</td>
			</tr>
		</table><br>
		<table style="font-size: 0.95em;">
			<tbody>
	            <tr>
		            <td style="text-align: center;">
			            <input type="radio" name="zz" id="infor" onchange="paymentChange()" checked  >
			            <label for="infor">상세정보</label> &nbsp;
			            <input type="radio" name="zz" id="notice" onchange="paymentChange()" >
			            <label for="notice">유의사항</label> &nbsp;
			            <input type="radio" name="zz" id="map" onchange="paymentChange()" >
			            <label for="map">위치보기</label>
		            </td>
	            </tr>
		         <tr>
		            <td style="height: 120px;">
		              <div id="Infor">
		              	<c:if test="${vo.FA_DETAILED == ''}">상세내용이 없습니다</c:if>
		              	<c:if test="${vo.FA_DETAILED != ''}">${vo.FA_DETAILED}</c:if>
		              </div>
		              <div id="Notice" style="display:none;">
		              	<c:if test="${vo.FA_ATTENTION == ''}">유의사항이 없습니다</c:if>
		              	<c:if test="${vo.FA_ATTENTION != ''}">${vo.FA_ATTENTION}</c:if>
		              </div>
		              <div id="Map" style="display:none;">
		              	-지도-
		              </div>
		            </td>
		         </tr>
			</tbody>
		</table>
		<div style="text-align: center;">
			<%-- <button type="button" onclick="location.href='${ctp}/member/bookingGoA?FA_NO=${vo.FA_NO}';" style="width:200px;">예약신청</button> --%>
			<button type="button" onclick="gogog()" style="width:200px;">예약신청</button>
		</div>
	</form>	
</body>
</html>