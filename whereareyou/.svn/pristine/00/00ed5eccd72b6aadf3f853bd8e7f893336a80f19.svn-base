<%@ page language="java" 
	pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp"%>
<title><spring:message code="projectMapList.title" />
</title>
<meta name="heading"
	content="<spring:message code='projectMapList.heading'/>" />
<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
<script type="text/javascript">

	function fncUse(newprjNm, newprjAddr, newprjx, newprjy, joinform) {
		if (opener) {

			//opener.document.viewmapform.valnm.value = newprjNm;
			//opener.document.viewmapform.addr.value = newprjAddr;
			//opener.document.viewmapform.x.value = newprjx;
			//opener.document.viewmapform.y.value = newprjy;
			//var newdist = joinform.inputR.value;
						
			window.opener.fncSetCenter(newprjx, newprjy, joinform);

			window.close();
		}

	}
	function fncSearchProject(arg) {
	   	document.searchForm.action="<c:url value='/project.do?method=searchmap'/>";
	   	document.searchForm.submit();						
	}		
	
</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<!-- BEGIN OF Project Title -->
<!-- END OF Project Title -->

<form:form modelAttribute="project" method="post" name="searchForm">
<center>

<!-- 검색 테이블 시작 -->
		<table width="880">
			<tr height="10"></tr>
			<tr>
				<td>
					<p style="font-size: 15px; font-weight: bold; margin-bottom: 0px">
						검색조건</p></td>
			</tr>
			<tr height="30">
				<td width="120" align="right" bgcolor="#eeeeee" />
				<label><spring:message code="project.prjNm" />&nbsp;&nbsp;</label>
				</td>
				<td width="580" style="padding-left: 10"><form:input
						path="prjNm" cssClass="ct_input_g"
						cssErrorClass="text medium error" maxlength="50" size="50" onkeydown="if((arguments[0]||event).keyCode==13){fncSearchProject();return false}"/>
				</td>
				<td width="180" align="right"><input type="button" value="조회"
					name="search_prj" style="border: 2px solid #5A8DF3; margin: 0px"
					onClick="fncSearchProject();" />
				</td>
			</tr>
			<tr height="7"></tr>
			<tr>
				<td width="120" align="right" bgcolor="#eeeeee"><label>거리&nbsp;&nbsp;</label>
				</td>
				<td width="50" style="padding-left: 10"><input type="text"
					name="inputR" cssClass="ct_input_g"
					cssErrorClass="text medium error" maxlength="20"
					style="width: 100px" /> m&nbsp;이내의 프로젝트를 모두 검색합니다.</td>
			</tr>
		</table>


		<table class="scrollTable" width="880" border="0" cellspacing="0"
			cellpadding="0" style="margin-top: 10px;">
			<thead>
				<tr>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjSeq" />
					</th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjNm" />
					</th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjAddr" />
					</th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjRepIdEmpId" />
					</th>
				</tr>
			</thead>

			<!-- 게시물 목록 -->
			<tbody>
				<c:forEach var="project" items="${projects}">
					<tr class="board"
						onMouseOver="this.style.backgroundColor='#e4eaff';return true;"
						onMouseOut="this.style.backgroundColor=''; return true;">
						<td class="underline">${project.prjSeq}</td>
						<td class="underline"><a class="linkClass"
							href="javascript:fncUse('${project.prjNm}', '${project.prjAddr}', '${project.prjPosX}', '${project.prjPosY}', searchForm.inputR.value);">${project.prjNm}</a>
						</td>
						<td align="left">${project.prjAddr}</td>
						<td align="left">${project.prjRepEmpNm}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

		<table width="880" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td class="page" height="50" align="center"><anyframe:pagenavigator
						linkUrl="javascript:fncSearchProject();" pages="${resultPage}"
						firstImg="${ctx}/sample/images/pagenav/page_before1.gif"
						lastImg="${ctx}/sample/images/pagenav/page_after1.gif"
						prevImg="${ctx}/sample/images/pagenav/page_before.gif"
						nextImg="${ctx}/sample/images/pagenav/page_after.gif" /></td>
			</tr>
		</table>
</form:form>
