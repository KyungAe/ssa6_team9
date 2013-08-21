<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
    <%@ include file="/whereareyou/common/meta.jsp" %>
    <title><spring:message code="movieList.title"/></title>
	<meta name="heading" content="<spring:message code='movieList.heading'/>"/>       
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/jquery-1.9.1.min.js'/>"></script>    
	<script type="text/javascript">
		var i = 0;
		var prjNum = ${prjNum};
			<c:forEach var="project" items="${projects}">
				fncAddToAxis('${project.prjAddr}', '${project.prjSeq}');
			</c:forEach>			
		function fncAddToAxis(str, seq) {
			$.ajax({
				url : "http://apis.daum.net/local/geo/addr2coord",
				dataType : "jsonp",
				type : "post",
				jsonp : "callback",
				async : false,
				data : {
					apikey : "8b80df74756d980fe39cf01ca043ef1fe5968f85",// API KEY
					q : str,// 검색어
					output : "json" // JSONP 형식으로 호출하기 때문에 결과값 포맷은 json
				},
				success : function(r) {//검색결과 처리
					if (r.channel.item.length == 0) {
						str = str.substring(0, str.lastIndexOf(" "));
						if(str.length === 0){
							document.addrMappingForm["xPosArray[]"][i].value = '546069';
							document.addrMappingForm["yPosArray[]"][i].value = '317088';
							document.addrMappingForm["seqArray[]"][i].value = seq;
							i = i+1;
						}
						fncAddToAxis(str, seq);
					} else {
							fncWGStoKTM(r.channel.item[0].lng, r.channel.item[0].lat, seq);
					}
					
				}
			});
		}

		function fncWGStoKTM(lng, lat, seq) {
			$.ajax({
				url : "http://apis.daum.net/local/geo/transcoord",
				dataType : "jsonp",
				type : "post",
				jsonp : "callback",
				async :false,
				data : {
					apikey : "8b80df74756d980fe39cf01ca043ef1fe5968f85",// API KEY
					x : lng,
					y : lat,
					fromCoord : "WGS84",
					toCoord : "KTM",
					output : "json"
				},
				success : function(r) {//검색결과 처리
					document.addrMappingForm["xPosArray[]"][i].value = parseInt(r.y);
					document.addrMappingForm["yPosArray[]"][i].value = parseInt(r.x);
					document.addrMappingForm["seqArray[]"][i].value = seq;
					i = i+1;
					if (prjNum == i) {
						document.addrMappingForm.action = "<c:url value='/xlsImport.do?method=addrMappingToDB'/>";
						document.addrMappingForm.submit();
					}
				}
			});
		}
		
$(document).ready(function(){
	document.addrMappingForm.action = "<c:url value='/xlsImport.do?method=addrMappingToDB'/>";
	document.addrMapping.submit();
});
</script>
</head>
<form:form modelAttribute="project" name="addrMappingForm" method="post" enctype="multipart/form-data">
		<c:forEach var="project" items="${projects}">
			<input type="hidden" name=xPosArray[]>
		</c:forEach>
		<c:forEach var="project" items="${projects}">
			<input type="hidden" name=yPosArray[]>
		</c:forEach>
		<c:forEach var="project" items="${projects}">
			<input type="hidden" name=seqArray[]>
		</c:forEach>
</form:form>
<p style="font-size:20px"> 데이터베이스에 반영중입니다. 잠시만 기다려주세요. </p>