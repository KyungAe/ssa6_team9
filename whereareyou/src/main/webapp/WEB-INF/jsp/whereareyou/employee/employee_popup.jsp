<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
    <%@ include file="/whereareyou/common/meta.jsp" %>
    <title><spring:message code="employeeList.title"/></title>
	<meta name="heading" content="<spring:message code='employeeList.heading'/>"/>       
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>    
	<script type="text/javascript">		
		function fncUse(repId, repNm) {
			if(opener) {
				opener.document.projectForm.prjRepIdEmpId.value = repId;
				opener.document.projectForm.prjRepEmpNm.value = repNm;
			}
			
			window.close();
		}
		function fncSearchEmployee(arg) {
		   	document.searchForm.action="<c:url value='/employeeFinder.do?method=search'/>";
		   	document.searchForm.submit();						
		}
	</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<!-- BEGIN OF Project Title -->
<!-- END OF Project Title -->
<form:form modelAttribute="employee" method="post" name="searchForm">
<!-- 검색 테이블 시작 -->
<center>
<table width="780">
	<tr height="10"></tr>
	<tr>
		<td>
			<p style="font-size:15px; font-weight:bold; margin-bottom:0px"> 검색조건 </p>
		</td>
	</tr>
	<tr height="30">
		<td width="120" align="right" bgcolor="#eeeeee" style="font-weight: bold; font-size: 13"/><label><spring:message code="employee.id" />&nbsp;&nbsp;</label></td>
		<td width="180" style="padding-left:10px"><form:input path="empId" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="12" size="10" onkeydown="if((arguments[0]||event).keyCode==13){fncSearchEmployee();return false}"/></td>
		<td width="120" align="right" bgcolor="#eeeeee" style="font-weight: bold; font-size: 13"/><label><spring:message code="employee.name" />&nbsp;&nbsp;</label></td>
		<td width="180" style="padding-left:10px"><form:input path="empNm" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="12" size="12" onkeydown="if((arguments[0]||event).keyCode==13){fncSearchEmployee();return false}"/><form:hidden path="empPrjSeq"/></td>
		<td width="280" align="right"><input type="button" name="search_emp" value="조회" onClick="javascript:fncSearchEmployee();"/></td>
	</tr>
	<tr height="7"></tr>
</table>
<!-- 검색 테이블 끝 -->



	<table class="scrollTable" width="780" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="employee.id" /></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="employee.name" /></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="employee.order" /></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="employee.projectname" /></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="employee.dept" /></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="employee.code" /></th>
			</tr>
		</thead>
		
		<!-- 게시물 목록 -->
		<tbody>
			<c:forEach var="employee" items="${employees}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >
					<td class="underline" align="center">${employee.empId}</td>
					<td class="underline">
						<a class="linkClass" href="javascript:fncUse(${employee.empId}, '${employee.empNm}');">${employee.empNm}</a>
					</td>
					<td align="center">${employee.empEntSeq}</td>
					<td align="left">${employee.empPrjNm}<c:if
									test="${empty employee.empPrjNm}">투입 중인 프로젝트 없음</c:if></td>
					<td align="center">${employee.empDeptNm}</td>
					<td align="center">
					<c:if test="${employee.empSendCode==0}">해당없음</c:if>
					<c:if test="${employee.empSendCode==1}">파견옴</c:if>
					<c:if test="${employee.empSendCode==2}">파견감</c:if>
					<c:if test="${not (employee.empSendCode==0||employee.empSendCode==1||employee.empSendCode==2)}">-</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:fncSearchEmployee();"
					pages="${resultPage}" 
					firstImg="${ctx}/whereareyou/images/pagenav/page_before1.gif" 
					lastImg="${ctx}/whereareyou/images/pagenav/page_after1.gif" 
					prevImg="${ctx}/whereareyou/images/pagenav/page_before.gif" 
					nextImg="${ctx}/whereareyou/images/pagenav/page_after.gif"/>
			</td>
		</tr>
	</table>
</center>
</form:form>
