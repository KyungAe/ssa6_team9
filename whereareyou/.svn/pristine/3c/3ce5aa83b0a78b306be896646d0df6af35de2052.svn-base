<%@ page language="java" errorPage="/whereareyou/common/error.jsp"
	pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
<%@ include file="/whereareyou/common/meta.jsp"%>
<title><spring:message code="projectList.title" />
</title>
<meta name="heading"
	content="<spring:message code='projectList.heading'/>" />
<link rel="stylesheet"
	href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
<script type="text/javascript"
	src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
<script type="text/javascript">
	function fncRegisterProject() {
		document.location.href = "<c:url value='/projectInfo.do?method=createView'/>";
	}
	function fncSearchProject(arg) {
		document.searchForm.action = "<c:url value='/project.do?method=list'/>";
		document.searchForm.submit();
	}
</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->



<form:form modelAttribute="project" method="post" name="searchForm">
	<!-- BEGIN OF Project Title -->

	<table width="1000" height="24" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="24">
				<table width="100%" height="24" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img
							src="<c:url value='/whereareyou/images/prj_title.png'/>">
						</td>
					</tr>
					<tr>
						<td><img
							src="<c:url value='/whereareyou/images/prj_title2.png'/>"></td>
					</tr>
				</table></td>
		</tr>
	</table>
<br>
	<!-- END OF Project Title -->

	<!-- 검색 테이블 -->
	<table width="1370">
		<tr height="30">
			<td width="120" align="right" bgcolor="#eeeeee"
				style="font-weight: bold; font-size: 17" />
			<label><spring:message code="project.prjNm" />&nbsp;&nbsp;</label>
			</td>
			<td width="680" style="padding-left: 10"><form:input
					path="prjNm" cssClass="ct_input_g"
					onkeydown="if((arguments[0]||event).keyCode==13){fncSearchProject();return false}"
					cssErrorClass="text medium error" maxlength="50" size="50" />
			</td>
			<td width="200" align="right"><input type="button" value="조회"
				name="search_prj" onClick="fncSearchProject();" />
			</td>
		</tr>
		<tr height="30">
			<td width="120" align="right" bgcolor="#dadada"
				style="font-weight: bold; font-size: 17" />
			<label><spring:message code="project.prjAddr" />&nbsp;&nbsp;</label>
			</td>
			<td width="680" style="padding-left: 10"><form:input
					path="prjAddr" cssClass="ct_input_g"
					cssErrorClass="text medium error" maxlength="50" size="70"
					onkeydown="if((arguments[0]||event).keyCode==13){fncSearchProject();return false}" />
			</td>
			<td width="200" align="right"><input type="button" value="신규등록"
				name="insert_prj" onClick="fncRegisterProject();" />
			</td>
		</tr>
	</table>
	<!-- 검색 테이블 끝 -->



	<table class="scrollTable" width="1370" border="0" cellspacing="0"
		cellpadding="0" style="margin-top: 10px;">
		<thead>
			<tr>
				<th scope="col" width="110" style="height: 30px; font-size: 16;"><spring:message
						code="project.prjSeq" />
				</th>
				<th scope="col" width="600" style="height: 30px; font-size: 16;"><spring:message
						code="project.prjNm" />
				</th>
				<th scope="col" width="580" style="height: 30px; font-size: 16;"><spring:message
						code="project.prjAddr" />
				</th>
				<th scope="col" width="80" style="height: 30px; font-size: 16;"><spring:message
						code="project.prjRepIdEmpId" />
				</th>
			</tr>
		</thead>

		<!-- 게시물 목록 -->
		<tbody>
			<c:forEach var="project" items="${projects}">
				<tr class="board" height="30"
					onMouseOver="this.style.backgroundColor='#e4eaff';return true;"
					onMouseOut="this.style.backgroundColor=''; return true;">
					<td align="center" class="underline" width="110"
						style="font-size: 17">${project.prjSeq}</td>
					<td align="left" style="padding-left: 10px; font-size: 17"
						class="underline" width="600"><a style="font-size: 17"
						class="linkClass"
						href="${ctx}/projectInfo.do?method=get&seq=${project.prjSeq}">${project.prjNm}</a>
					</td>
					<td align="left" width="580"
						style="padding-left: 10; font-size: 17">${project.prjAddr}</td>
					<td align="center" width="80"
						style="border-right: 0px; font-size: 17">${project.prjRepEmpNm}<c:if
							test="${empty project.prjRepEmpNm}">
							<center>-</center>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<table width="1370" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">
		<tr>
			<td class="page" height="50" align="center"><anyframe:pagenavigator
					linkUrl="javascript:fncSearchProject();" pages="${resultPage}"
					firstImg="${ctx}/whereareyou/images/pagenav/page_before1.gif"
					lastImg="${ctx}/whereareyou/images/pagenav/page_after1.gif"
					prevImg="${ctx}/whereareyou/images/pagenav/page_before.gif"
					nextImg="${ctx}/whereareyou/images/pagenav/page_after.gif" /></td>
		</tr>
	</table>
</form:form>
