<%@ page language="java" errorPage="/sample/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="boardList.title"/></title>
	<meta name="heading" content="<spring:message code='boardList.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>    
	<script type="text/javascript">
		function fncCreateBoardView() {
			document.location.href="<c:url value='/board.do?method=createView'/>";
		}	
		function fncSearchBoard() {
			var conditions = ["boardId","boardMasterId","boardTopics"]	
			if(!listFormValidation(conditions)) return;				
		   	document.searchForm.action="<c:url value='/board.do?method=list'/>";
		   	document.searchForm.submit();						
		}		
	</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="24">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of Board</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="search" method="post" name="searchForm">   
<!--begin of search-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;vertical-align: center;">
	<tr>
		<td align="right">
			<form:select path="searchCondition" id="searchCondition" cssClass="ct_input_g" cssStyle="width:114px;">
				<form:option value="All">ALL</form:option>
				<form:option value="id.boardId"><spring:message code="board.id.boardId"/></form:option>            	
				<form:option value="id.boardMasterId"><spring:message code="board.id.boardMasterId"/></form:option>            	
				<form:option value="boardName"><spring:message code="board.boardName"/></form:option>
				<form:option value="boardTopics"><spring:message code="board.boardTopics"/></form:option>
			</form:select>
			<form:input path="searchKeyword" id="searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="255"/>
		</td>
		<td align="right" width="80">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"><img src="<c:url value='/sample/images/ct_btnbg01.gif'/>" width="17" height="23"></td>
					<td background="<c:url value='/sample/images/ct_btnbg02.gif'/>" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncSearchBoard();">Search</a>
					</td>
					<td width="14" height="23"><img src="<c:url value='/sample/images/ct_btnbg03.gif'/>" width="14" height="23"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!--end of search-->
<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<thead>
		<tr>
			<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="board.id.boardId" /></th>
			<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="board.boardDesc" /></th>
			<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="board.boardName" /></th>
			<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="board.boardOrder" /></th>
			<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="board.boardTopics" /></th>
			<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="board.regDate" /></th>
		</tr>
	</thead>		
	<tbody>
		<c:forEach var="board" items="${boardList}">
		<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >			
			<td class="underline">
				<a class="linkClass" href="${ctx}/board.do?method=get&id.boardId=${board.id.boardId}&id.boardMasterId=${board.id.boardMasterId}">${board.id.boardId}</a>
			</td>
			<td align="left">${board.boardDesc}</td>
			<td align="left">${board.boardName}</td>
			<td align="left">${board.boardOrder}</td>
			<td align="left">${board.boardTopics}</td>
			<td align="left">${board.regDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:fncSearchBoard();"
					pages="${resultPage}" 
					firstImg="${ctx}/sample/images/pagenav/page_before1.gif" 
					lastImg="${ctx}/sample/images/pagenav/page_after1.gif" 
					prevImg="${ctx}/sample/images/pagenav/page_before.gif" 
					nextImg="${ctx}/sample/images/pagenav/page_after.gif"/>
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td align="right"><a href='<c:url value="javascript:fncCreateBoardView();"/>'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
</form:form>