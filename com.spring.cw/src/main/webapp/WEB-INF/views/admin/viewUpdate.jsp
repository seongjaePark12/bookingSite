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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function inputhalin(){
		var FA_TARGET1 = document.getElementById("FA_TARGET1").checked;
		if(FA_TARGET1 == true){
			document.getElementById("FA_TARGET2").checked = false;
			document.getElementById("FA_TARGET3").checked = false;
			document.getElementById("FA_TARGET4").checked = false;
			document.getElementById("FA_TARGET5").checked = false;
			document.getElementById("FA_TARGET6").checked = false;
			document.getElementById("FA_TARGETSELF").readOnly = false;
		}
		else{
			FA_TARGET1.checked = false;
			document.getElementById("FA_TARGETSELF").value = "";
			document.getElementById("FA_TARGETSELF").readOnly = true;
		}
	}
	function payCheck(){
		var FA_PAY1 = document.getElementById("FA_PAY1").checked;
		if(FA_PAY1 == true){
			document.getElementById("FA_PAY").value = 0;
		}
		else{
			document.getElementById("FA_PAY").value = "";
		}
	}
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            if(data.userSelectedType === 'R'){
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	 }
	function inputOn(){
		var FA_GROUP = myform.FA_GROUP.value;
		var FA_FNAME = myform.FA_FNAME.value;
		var FA_INAME = myform.FA_INAME.value;
		var FA_AP_START1 = myform.FA_AP_START1.value;
		var FA_AP_START2 = myform.FA_AP_START2.value;
		var FA_AP_START3 = myform.FA_AP_START3.value;
		var FA_AP_END1 = myform.FA_AP_END1.value;
		var FA_AP_END2 = myform.FA_AP_END2.value;
		var FA_AP_END3 = myform.FA_AP_END3.value;
		var FA_AP_CH = myform.FA_AP_CH.value;
		var FA_OP_START = myform.FA_OP_START.value;
		var FA_OP_END = myform.FA_OP_END.value;
		var FA_OPTIME_STRAT = myform.FA_OPTIME_STRAT.value;
		var FA_OPTIME_END = myform.FA_OPTIME_END.value;
		var FA_OPTIME_CH = myform.FA_OPTIME_CH.value;
		var FA_METHOD = myform.FA_METHOD.value;
		var FA_PEOPLE_NO = myform.FA_PEOPLE_NO.value;
		var FA_NUMBER = myform.FA_NUMBER.value;
		
	    var FA_TARGET = [];
	    $("input[name='FA_TARGET']:checked").each(function(i){
	    	FA_TARGET.push($(this).val());
	    })
		
		var FA_PAY = myform.FA_PAY.value;
		var FA_DETAILED = myform.FA_DETAILED.value;
		var FA_ATTENTION = myform.FA_ATTENTION.value;
		var file = myform.file.value;
		var FA_SHOW = myform.FA_SHOW.value;
		
		if(FA_GROUP == ""){
			alert("분류를 선택하세요");
			myform.FA_GROUP.focus();
			return;
		}
		else if(FA_FNAME == ""){
			alert("시설명을 입력하세요");
			myform.FA_FNAME.focus();
			return;
		}
		else if(FA_INAME == ""){
			alert("기관명을 입력하세요");
			myform.FA_INAME.focus();
			return;
		}
		else if(FA_AP_START1 == ""){
			alert("접수 기간을 입력하세요");
			myform.FA_AP_START1.focus();
			return;
		}
		else if(FA_AP_START2 == ""){
			alert("접수 기간을 입력하세요");
			myform.FA_AP_START2.focus();
			return;
		}
		else if(FA_AP_END1 == ""){
			alert("접수 기간을 입력하세요");
			myform.FA_AP_END1.focus();
			return;
		}
		else if(FA_AP_END2 == ""){
			alert("접수 기간을 입력하세요");
			myform.FA_AP_END2.focus();
			return;
		}
		else if(FA_OP_START == ""){
			alert("운영 기간을 입력하세요");
			myform.FA_OP_START.focus();
			return;
		}
		else if(FA_OP_END == ""){
			alert("운영 기간을 입력하세요");
			myform.FA_OP_END.focus();
			return;
		}
		else if(FA_OPTIME_STRAT == ""){
			alert("운영 시간을 입력하세요");
			myform.FA_OPTIME_STRAT.focus();
			return;
		}
		else if(FA_OPTIME_END == ""){
			alert("운영 시간을 입력하세요");
			myform.FA_OPTIME_END.focus();
			return;
		}
		else if(FA_METHOD == ""){
			alert("접수 방법을 입력하세요");
			myform.FA_METHOD.focus();
			return;
		}
		else if(FA_PEOPLE_NO == ""){
			alert("모집 인원을 입력하세요");
			myform.FA_PEOPLE_NO.focus();
			return;
		}
		else if(FA_NUMBER == ""){
			alert("문의 전화를 입력하세요");
			myform.FA_NUMBER.focus();
			return;
		}
		else if(FA_TARGET == ""){
			alert("이용대상을 입력하세요");
			myform.FA_TARGET.focus();
			return;
		}
		else if(FA_PAY == ""){
			alert("이용요금을 입력하세요");
			myform.FA_PAY.focus();
			return;
		}
		else if(FA_SHOW == ""){
			alert("표시여부를 입력하세요");
			myform.FA_SHOW.focus();
			return;
		}
		else if(file == ""){
			alert("파일을 선택해주세요");
			return;
		}
 		else if(document.getElementById("file").value != ""){
			var maxSize = 30 * 1024 * 1024;
			var fileSize = document.getElementById("file").files.size;
			var ext = file.substring(file.lastIndexOf(".")+1) // 확장자 구하는거
			var uExt = ext.toUpperCase();
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 30MB 이내로 등록 가능합니다.");
				return;
			}
			else if(uExt != "JPG" && uExt != "JPEG" && uExt != "PNG" && uExt != "GIF" && uExt != "BMP"){
				alert("업로드 가능한 파일이 아닙니다");
				return;
			}
			else{
				var sample6_postcode = myform.sample6_postcode.value;
    			var sample6_address = myform.sample6_address.value;
    			var sample6_detailAddress = myform.sample6_detailAddress.value;
    			var sample6_extraAddress = myform.sample6_extraAddress.value;
    			FA_ADDRESS = sample6_postcode + "/" + sample6_address + "/" + sample6_extraAddress + "/" + sample6_detailAddress
    			if(FA_ADDRESS == "///") FA_ADDRESS ="";
    			myform.FA_ADDRESS.value = FA_ADDRESS;
				var FA_AP_START = FA_AP_START1+"/"+FA_AP_START2+"/"+FA_AP_START3;
				var FA_AP_END = FA_AP_END1+"/"+FA_AP_END2+"/"+FA_AP_END3;
				myform.FA_AP_START.value = FA_AP_START;
				myform.FA_AP_END.value = FA_AP_END;
				myform.submit();
			}
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
	<h2>시설정보 수정</h2><hr>
	<div style="text-align: right; margin-right: 300px">* 표시는 필수 입력 항목 입니다.</div>
		<form name="myform" method="post" enctype="multipart/form-data" >
			<table>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">분류 *</td>
					<td>
						<select id="FA_GROUP" name="FA_GROUP">
							<option value="체육관" ${vo.FA_GROUP == '체육관' ? 'selected' : '' }>체육관</option>
							<option value="골프장" ${vo.FA_GROUP == '골프장' ? 'selected' : '' }>골프장</option>
							<option value="축구장" ${vo.FA_GROUP == '축구장' ? 'selected' : '' }>축구장</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">시설명 *</td>
					<td><input type="text" id="FA_FNAME" name="FA_FNAME" value="${vo.FA_FNAME}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">기관명 *</td>
					<td><input type="text" id="FA_INAME" name="FA_INAME" value="${vo.FA_INAME}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">장소/위치 *</td>
					<td>
						<input type="hidden" name="FA_ADDRESS"/>
			          	<input type="text" name="sample6_postcode" id="sample6_postcode" value="${fn:split(vo.FA_ADDRESS,'/')[0]}" placeholder="우편번호" readonly />
			          	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br>
			          	<input type="text" name="sample6_address" id="sample6_address" value="${fn:split(vo.FA_ADDRESS,'/')[1]}" placeholder="도로명주소" readonly />
				        <input type="text"  name="sample6_extraAddress" id="sample6_extraAddress" value="${fn:split(vo.FA_ADDRESS,'/')[2]}" placeholder="참고항목" readonly />
			       		<input type="text" name ="sample6_detailAddress" id="sample6_detailAddress" value="${fn:split(vo.FA_ADDRESS,'/')[3]}" placeholder="상세주소" />
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">접수기간 *</td>
					<td>
						<input type="date" name="FA_AP_START1" id="FA_AP_START1" value="<%=sToday %>" />
						<select id="FA_AP_START2" name="FA_AP_START2">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}시</option>
						</c:forEach>
						</select>
						<select id="FA_AP_START3" name="FA_AP_START3">
						<c:forEach var="j" begin="0" end="59">
							<option value="${j}">${j}분</option>
						</c:forEach>
						</select>~
						<input type="date" name="FA_AP_END1" id="FA_AP_END1" value="<%=sToday %>" />
						<select id="FA_AP_END2" name="FA_AP_END2">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}시</option>
						</c:forEach>
						</select>
						<select id="FA_AP_END3" name="FA_AP_END3">
						<c:forEach var="j" begin="0" end="59">
							<option value="${j}">${j}분</option>
						</c:forEach>
						</select>
						<c:if test="${vo.FA_AP_CH == 'N'}"><input type="checkbox" id="FA_AP_CH" name="FA_AP_CH" value="Y" /> 상시접수</c:if>
						<c:if test="${vo.FA_AP_CH == 'Y'}"><input type="checkbox" id="FA_AP_CH" name="FA_AP_CH" value="Y" checked /> 상시접수</c:if>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">운영기간 *</td>
					<td>
						<input type="date" name="FA_OP_START" id="FA_OP_START" value="<%=sToday %>" class="form-control"/>~
						<input type="date" name="FA_OP_END" id="FA_OP_END" value="<%=sToday %>" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">운영시간 *</td>
					<td>
						<select id="FA_OPTIME_STRAT" name="FA_OPTIME_STRAT">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}:00</option>
						</c:forEach>
						</select>~
						<select id="FA_OPTIME_END" name="FA_OPTIME_END">
						<c:forEach var="i" begin="0" end="24">
							<option value="${i}">${i}:00</option>
						</c:forEach>
						</select>
						<select id="FA_OPTIME_CH" name="FA_OPTIME_CH">
							<option value="30분" ${vo.FA_OPTIME_CH == '30분' ? 'selected' : '' }>30분</option>
							<option value="1시간" ${vo.FA_OPTIME_CH == '1시간' ? 'selected' : '' }>1시간</option>
							<option value="2시간" ${vo.FA_OPTIME_CH == '2시간' ? 'selected' : '' }>2시간</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">접수방법 *</td>
					<td>
						<select id="FA_METHOD" name="FA_METHOD">
							<option value="1" ${vo.FA_METHOD == '1' ? 'selected' : '' }>승인</option>
							<option value="2" ${vo.FA_METHOD == '2' ? 'selected' : '' }>선착순</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">운영시간별 모집인원 *</td>
					<td><input type="number" id="FA_PEOPLE_NO" name="FA_PEOPLE_NO" value="${vo.FA_PEOPLE_NO}" />명</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">문의전화 *</td>
					<td><input type="text" id="FA_NUMBER" name="FA_NUMBER" value="${vo.FA_NUMBER}" /></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">이용대상 *</td>
					<td>
						<input type="checkBox" name="FA_TARGET" id="FA_TARGET2" value="일반" onclick="inputhalin()" <c:if test="${vo.FA_TARGET.contains('일반')}">checked</c:if> />일반
						<input type="checkBox" name="FA_TARGET" id="FA_TARGET3" value="아동" onclick="inputhalin()" <c:if test="${vo.FA_TARGET.contains('아동')}">checked</c:if> />아동
						<input type="checkBox" name="FA_TARGET" id="FA_TARGET4" value="청소년" onclick="inputhalin()" <c:if test="${vo.FA_TARGET.contains('청소년')}">checked</c:if> />청소년
						<input type="checkBox" name="FA_TARGET" id="FA_TARGET5" value="장애인" onclick="inputhalin()" <c:if test="${vo.FA_TARGET.contains('장애인')}">checked</c:if> />장애인
						<input type="checkBox" name="FA_TARGET" id="FA_TARGET6" value="외국인" onclick="inputhalin()" <c:if test="${vo.FA_TARGET.contains('외국인')}">checked</c:if> />외국인
						<input type="checkBox" name="FA_TARGET" id="FA_TARGET1" value="직접입력" onclick="inputhalin()" <c:if test="${vo.FA_TARGET.contains('직접입력')}">checked</c:if> />직접입력
						<c:if test="${fn:split(vo.FA_TARGET,',')[0] == '직접입력'}">
							<input type="text" id="FA_TARGETSELF" name="FA_TARGET" value="${fn:split(vo.FA_TARGET,',')[1]}" readonly >
						</c:if>
						<c:if test="${fn:split(vo.FA_TARGET,',')[0] != '직접입력'}">
							<input type="text" id="FA_TARGETSELF" name="FA_TARGET" readonly >
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">이용요금 *</td>
					<td><input type="number" id="FA_PAY" name="FA_PAY" value="${vo.FA_PAY}" />원 | <input type="checkbox" id="FA_PAY1" name="FA_PAY1" value="0" onclick="payCheck()" />무료</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">상세정보</td>
					<td><textarea id="FA_DETAILED" name="FA_DETAILED" >${vo.FA_DETAILED}</textarea></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">유의사항</td>
					<td><textarea id="FA_ATTENTION" name="FA_ATTENTION" >${vo.FA_ATTENTION}</textarea></td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">사진파일</td>
					<td>			
						<input type="file" id="file" name="file" accept=".jpg,.png,.jpeg,.gif,.bmp" />
						<img src="${ctp}/resources/data/${vo.FA_PHOTO}" alt="image" width="100px"/>		
					</td>
				</tr>
				<tr>
					<td style="width:15%; background-color: #ddd; text-align: center;">표시여부 *</td>
					<td>
						<select id="FA_SHOW" name="FA_SHOW">
							<option value="N" ${vo.FA_SHOW == 'N' ? 'selected' : '' }>미표시</option>
							<option value="Y" ${vo.FA_SHOW == 'Y' ? 'selected' : '' }>표시</option>
						</select>
					</td>
				</tr>
			</table>	
			<div style="text-align: center;">
				<button type="button" onclick="inputOn()">저장</button>
				<button type="button" onclick="location.href='${ctp}/admin/view?FA_GROUP=&FA_FNAME=&FA_METHOD=&FA_DATE=&start=&end=';">취소</button>
			</div>
			<input type="hidden" id="FA_AP_START" name="FA_AP_START" /> 
			<input type="hidden" id="FA_AP_END" name="FA_AP_END" /> 
			<input type="hidden" id="FA_NO" name="FA_NO" value="${vo.FA_NO}"/> 
		</form>
</body>
</html>