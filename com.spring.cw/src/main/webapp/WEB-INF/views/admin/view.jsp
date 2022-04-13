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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	table{border: 1px solid #444444;}
	td{border: 1px solid #444444;}
	a{margin-top: 10px; text-decoration: none; color: red;}
</style>
<script type="text/javascript">
 	function orderDateSearch(){
		var start = searchForm.start.value;
		var end = searchForm.end.value;
		var FA_DATE = searchForm.FA_DATE.value;
		location.href="${ctp}/admin/view?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE="+FA_DATE+"&start="+start+"&end="+end;
	} 
 	function FAGROUPCheck(){
		var FA_GROUP = searchForm.FA_GROUP.value;
		location.href="${ctp}/admin/view?FA_GROUP="+FA_GROUP+"&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=";
	} 
 	function find(){
		var FA_NM = searchForm.FA_NM.value;
		var txt = searchForm.txt.value;
		var FA_FNAME='';
		var FA_METHOD='';
		if(FA_NM == ''){
			location.href="${ctp}/admin/view?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=";
		}
		if(FA_NM == '시설명'){
			location.href="${ctp}/admin/view?FA_GROUP=&FA_FNAME="+txt+"&FA_METHOD=&FA_DATE=&start=&end=";
		}
		if(FA_NM == '접수방법'){
			if(txt == '승인'){
				txt = 1;
				location.href="${ctp}/admin/view?FA_GROUP=&FA_FNAME=&FA_METHOD="+txt+"&FA_DATE=&start=&end=";
			}
			if(txt == '선착순'){
				txt = 2;
				location.href="${ctp}/admin/view?FA_GROUP=&FA_FNAME=&FA_METHOD="+txt+"&FA_DATE=&start=&end=";
			}
		}
	}
	function show(FA_NO){
		var FA_SHOW = 'Y';
		$.ajax({
			type : "post",
			url : "${ctp}/admin/showUpdate",
			data:{
					FA_NO : FA_NO,
					FA_SHOW : FA_SHOW
				},
			success:function(){
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});
	}
 	function show1(FA_NO){
		var FA_SHOW = 'N';
		$.ajax({
			type : "post",
			url : "${ctp}/admin/showUpdate",
			data:{
					FA_NO : FA_NO,
					FA_SHOW : FA_SHOW
				},
			success:function(){
				location.reload();
			},
			error:function(){
				alert("전송오류");
			}
		});
	} 
	function viewDel(FA_NO){
		var ans = confirm("정말로 삭제 하시겠습니까?");
		if(!ans) return false;
		$.ajax({
			type : "post",
			url : "${ctp}/admin/showDelete",
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
	<form name="myform" method="post">
		<table style="text-align: center; width:80%">
			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>시설명</th>
					<th>접수기간</th>
					<th>운영기간</th>
					<th>접수방법</th>
					<th>예약현황</th>
					<th>표시여부</th>
					<th>수정/삭제</th>
					<th>은행등록여부</th>
					<th>사진</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${st.count}</td>
					<td>${vo.FA_GROUP}</td>
					<td>${vo.FA_FNAME}</td>
					<c:set var="aa" value="${fn:split(vo.FA_AP_START,'/')[0]}" />
					<c:set var="bb" value="${fn:split(vo.FA_AP_START,'/')[1]}" />
					<c:set var="cc" value="${fn:split(vo.FA_AP_START,'/')[2]}" />
					<c:set var="dd" value="${fn:split(vo.FA_AP_END,'/')[0]}" />
					<c:set var="ee" value="${fn:split(vo.FA_AP_END,'/')[1]}" />
					<c:set var="ff" value="${fn:split(vo.FA_AP_END,'/')[2]}" />
					<td>${aa}/${bb}:00~${cc}:00 ~ ${dd}/${ee}:00~${ff}:00</td>
					<td>${vo.FA_OP_START} ~ ${vo.FA_OP_END}</td>
					<td>
						<c:if test="${vo.FA_METHOD == 1}">승인</c:if>
						<c:if test="${vo.FA_METHOD == 2}">선착순</c:if>
					</td>
					<td><a href="${ctp}/admin/viewBooking?FA_NO=${vo.FA_NO}&BOOKING_USEDAY=&BOOKING_STATUS=&BOOKING_APPROVAL=&BOOKING_PAYMENT=&CW_USER_NAME=&CW_USER_NUMBER=">[보기]</a></td>
					<td>
						<c:if test="${vo.FA_SHOW == 'N'}"><a href="#" onclick="show(${vo.FA_NO})" >[표시안함]</a></c:if>
						<c:if test="${vo.FA_SHOW == 'Y'}"><a href="#" onclick="show1(${vo.FA_NO})" >[표시]</a></c:if>
					</td>
					<td><a href="${ctp}/admin/viewUpdate?FA_NO=${vo.FA_NO}">[수정]</a><a href="#" onclick="viewDel(${vo.FA_NO})" >[삭제]</a>
					</td>
					<td>
						<c:if test="${vo.FA_BANK_NAME == null}">등록전</c:if>
						<c:if test="${vo.FA_BANK_NAME != null}">등록완료</c:if>
					</td>
					<td><img src="${ctp}/resources/data/${vo.FA_PHOTO}" alt="image" width="100px"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>	
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="${ctp}/admin/view?pag=1&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="${ctp}/admin/view?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/admin/view?pag=${i}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='${ctp}/admin/view?pag=${i}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="${ctp}/admin/view?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" class="page-link text-dark" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="${ctp}/admin/view?pag=${totPage}&pageSize=${pageSize}&FA_GROUP=${FA_GROUP}&FA_FNAME=${FA_FNAME}&FA_METHOD=${FA_METHOD}&FA_DATE=${FA_DATE}&start=${start}&end=${end}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<br><br>
	<a href="${ctp}/admin/input" style="margin-left:70%; font-size: 15pt">등록</a>
	<a href="${ctp}/member/main" style="margin-left:50%; font-size: 20pt">홈으로</a>
</body>
</html>