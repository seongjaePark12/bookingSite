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
<title>예약 하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
 	function orderDateSearch(){
		var start = searchForm.start.value;
		var end = searchForm.end.value;
		var FA_DATE = searchForm.FA_DATE.value;
		location.href="${ctp}/member/bookingA?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE="+FA_DATE+"&start="+start+"&end="+end;
	} 
 	function FAGROUPCheck(){
		var FA_GROUP = searchForm.FA_GROUP.value;
		location.href="${ctp}/member/bookingA?FA_GROUP="+FA_GROUP+"&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=";
	} 
 	function find(){
		var FA_NM = searchForm.FA_NM.value;
		var txt = searchForm.txt.value;
		var FA_FNAME='';
		var FA_METHOD='';
		if(FA_NM == ''){
			location.href="${ctp}/member/bookingA?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=";
		}
		if(FA_NM == '시설명'){
			location.href="${ctp}/member/bookingA?FA_GROUP=&FA_FNAME="+txt+"&FA_METHOD=&FA_DATE=&start=&end=";
		}
		if(FA_NM == '접수방법'){
			if(txt == '승인'){
				txt = 1;
				location.href="${ctp}/member/bookingA?FA_GROUP=&FA_FNAME=&FA_METHOD="+txt+"&FA_DATE=&start=&end=";
			}
			if(txt == '선착순'){
				txt = 2;
				location.href="${ctp}/member/bookingA?FA_GROUP=&FA_FNAME=&FA_METHOD="+txt+"&FA_DATE=&start=&end=";
			}
		}
	}
</script>
<style>
	table{border: 1px solid #444444;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: red;}
</style>
</head>
<body>
	<h2>시설 현황</h2><hr>
	<form name="searchForm" method="post">
		<select name="FA_DATE">
			<option value="접수기간"${FA_DATE == '접수기간' ? 'selected' : '' }>접수기간</option>
			<option value="운영기간"${FA_DATE == '운영기간' ? 'selected' : '' }>운영기간</option>
		</select>
		<c:if test="${start != '' && end != ''}">
			<input type="date" name="start" id="start" value="${start}"/> ~ <input type="date" name="end" id="end" value="${end}"/>
		</c:if>
		<c:if test="${start == '' && end == ''}">
			<input type="date" name="start" id="start" value="<%=sToday%>"/> ~ <input type="date" name="end" id="end" value="<%=sToday%>"/>
		</c:if>
       	<button type="button" onclick="orderDateSearch()">조회</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="FA_GROUP" onchange="FAGROUPCheck()">
			<option value=""${FA_GROUP == '' ? 'selected' : '' }>분류선택</option>
			<option value="체육관"${FA_GROUP == '체육관' ? 'selected' : '' }>체육관</option>
			<option value="골프장"${FA_GROUP == '골프장' ? 'selected' : '' }>골프장</option>
			<option value="축구장"${FA_GROUP == '축구장' ? 'selected' : '' }>축구장</option>
		</select>
		<select name="FA_NM">
			<option value="">전체</option>
			<option value="시설명">시설명</option>
			<option value="접수방법">접수방법</option>
		</select>
			<c:if test="${FA_FNAME != ''}"><input type="text" name="txt" value="${FA_FNAME}"/></c:if>
		<c:if test="${FA_METHOD == 1}">
			<c:if test="${FA_METHOD != ''}"><input type="text" name="txt" value="승인"/></c:if>
		</c:if>
		<c:if test="${FA_METHOD == 2}">
			<c:if test="${FA_METHOD != ''}"><input type="text" name="txt" value="선착순"/></c:if>
		</c:if>
		<c:if test="${FA_FNAME == '' && FA_METHOD == ''}"><input type="text" name="txt"/></c:if>
	<button type="button" onclick="find()">검색</button>
	</form>
	<br><br>
	<div class="row">
		<c:forEach var="vo" items="${vos}">
			<div class="col-lg-4 m-8">
				<div class="card border-0">
					<div class="card-header p-0 ml-4">
						<img src="${ctp}/resources/data/${vo.FA_PHOTO}" class="card-img-bottom img-fluid" alt="image" /><br>
						&nbsp;&nbsp;시설명&nbsp;&nbsp;${vo.FA_FNAME}<br>
						&nbsp;&nbsp;접수기간&nbsp;&nbsp;${vo.FA_AP_START}~${vo.FA_AP_END}<br>
						&nbsp;&nbsp;운영기간&nbsp;&nbsp;${vo.FA_OP_START}~${vo.FA_OP_END}<br>
						&nbsp;&nbsp;접수방법&nbsp;&nbsp;<c:if test="${vo.FA_METHOD == '1'}">승인</c:if><c:if test="${vo.FA_METHOD == '2'}">선착순</c:if><br>
						<div style="text-align: center;">
							<%-- <button type="button" onclick="location.href='${ctp}/member/bookingGoA?FA_NO=${vo.FA_NO}';" style="width:200px; text-align: center;">예약신청</button> --%>
							<button type="button" onclick="location.href='${ctp}/member/bookingGoAB?FA_NO=${vo.FA_NO}';" style="width:200px; text-align: center;">예약신청</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/member/bookingA?pag=1&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/member/bookingA?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/member/bookingA?pag=${i}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/member/bookingA?pag=${i}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/member/bookingA?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" class="page-link text-dark" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/member/bookingA?pag=${totPage}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<a href="${ctp}/member/main" style="margin-left:50%; font-size: 20pt">홈으로</a>
</body>
</html>