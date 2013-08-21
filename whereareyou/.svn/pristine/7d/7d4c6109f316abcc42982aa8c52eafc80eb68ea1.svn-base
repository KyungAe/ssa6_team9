<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
    <%@ include file="/whereareyou/common/meta.jsp" %>
    <title><spring:message code="movieList.title"/></title>
	<meta name="heading" content="<spring:message code='movieList.heading'/>"/>       
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>    
	<script type="text/javascript">
		function goInsert() {
			var f = document.excelUploadForm;
			
			document.excelUploadForm.action="<c:url value='/dbController.do'/>";
			
			if(f.excelFile.value =="") {
				alert("파일을 선택해 주세요.");
				return;
			}
			
			var fileNameLength = f.excelFile.value.length;
			
			if(f.excelFile.value.substring(fileNameLength-3, fileNameLength) != "xls") {
				alert("확장자가 xls인 엑셀파일을 선택해 주세요.");
				return;
			}
			f.submit();
		}
	</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->


<p style="font-size:15px;margin-top:30px">
쏘엔맵-"쏘엔팀은 어디에 있을까" 서비스는 삼성SDS SW.Eng 팀원들이 현재 어떤 프로젝트를 하고 있으며
어디에서 프로젝트를 진행중인지 검색할 수 있는 기능입니다. </br>
특히 네이버 지도 서비스와 연동하여 지도를 통해 팀원들의 위치를 한눈에 파악할 수 있는 뛰어난 기능도 제공합니다.
</p>

<table style="position:relative;left:350px;margin-top:50px">
<tr>
<td>
<a href="${ctx}/project.do?method=list"><img
					src="<c:url value='/whereareyou/images/project_img.png'/>" width="256px"
					height="256px" border="0" /></a>
</td>
<td>
<a href="${ctx}/employeeFinder.do?method=list"><img
					src="<c:url value='/whereareyou/images/emp_img.png'/>" width="256px"
					height="256px" border="0" /></a>
</td>
</tr>

<tr>
<td align="center" style="font-size:18px;font-weight:bold">
프로젝트
</td>
<td align="center" style="font-size:18px;font-weight:bold">
사원
</td>
</tr>
</table>



<form:form name="excelUploadForm" method="post" enctype="multipart/form-data">
	<table border="0">
		<tr><td colspan="2"><b>**엑셀 디비 자동반영 테스트**</b></br></br></td></tr>
		<tr>
			<td>파일명</td>
			<td><input type="file" name="excelFile" size="40"></td>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:goInsert();">
					업로드
				</a>
			</td>
		</tr>
	</table>
</form:form>
