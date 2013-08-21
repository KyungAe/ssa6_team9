<%@ page language="java" errorPage="/sample/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="boardDetail.title"/></title>
    <meta name="heading" content="<spring:message code='boardDetail.heading'/>"/>   
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">        
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript">
	function fncCreateBoard() {		    		    
        document.boardForm.action="<c:url value='/board.do?method=create'/>";
        document.boardForm.submit();
	}
	
	function fncUpdateBoard() {	    
        document.boardForm.action="<c:url value='/board.do?method=update'/>";
        document.boardForm.submit();
	}
	
	function fncRemoveBoard(){	
		if(confirmDelete('board')) {
		    document.boardForm.action="<c:url value='/board.do?method=remove'/>";
		    document.boardForm.submit();
		}	    
	}
	</script>         
</head>

<!--************************** begin of contents *****************************-->

<!--begin of title-->
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="<c:url value='/sample/images/ct_ttl_img02.gif'/>" width="100%" style="padding-left: 10px;">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">		

				 	<c:if test="${empty board.id.boardId}">				 	
				 	Add Board Information
				 	<c:set var="readonly" value="false"/>
					</c:if>
			
					<c:if test="${not empty board.id.boardId}">					
					Update Board Information
					<c:set var="readonly" value="true"/>				 
					</c:if>					 				 
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<form:form modelAttribute="board" method="post" action="board.do" id="boardForm" name="boardForm">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">

		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>		
			<td width="150" class="ct_td"><spring:message code="board.id.boardId"/>*</td><td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="id.boardId" cssClass="ct_input_g" cssErrorClass="text medium error" readonly="${readonly}" />
				<form:errors path="id.boardId" cssClass="errors" />		
			</td>			
		</tr>		
		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>		
			<td width="150" class="ct_td"><spring:message code="board.id.boardMasterId"/>*</td><td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="id.boardMasterId" cssClass="ct_input_g" cssErrorClass="text medium error" readonly="${readonly}" />
				<form:errors path="id.boardMasterId" cssClass="errors" />		
			</td>			
		</tr>		
		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>
			<td width="150" class="ct_td">
			
			<spring:message code="board.boardDesc"/></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">									        
	        	<form:input path="boardDesc" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="255"/>
	        	<form:errors path="boardDesc" cssClass="errors" />
			</td>
		</tr>
		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>
			<td width="150" class="ct_td">
			
			<spring:message code="board.boardName"/>*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">									        
	        	<form:input path="boardName" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="150"/>
	        	<form:errors path="boardName" cssClass="errors" />
			</td>
		</tr>
		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>
			<td width="150" class="ct_td">
			
			<spring:message code="board.boardOrder"/></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">									        
	        	<form:input path="boardOrder" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="255"/>
	        	<form:errors path="boardOrder" cssClass="errors" />
			</td>
		</tr>
		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>
			<td width="150" class="ct_td">
			
			<spring:message code="board.boardTopics"/>*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">									        
	        	<form:input path="boardTopics" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="255"/>
	        	<form:errors path="boardTopics" cssClass="errors" />
			</td>
		</tr>
		<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
		<tr>
			<td width="150" class="ct_td">
			
			<spring:message code="board.regDate"/></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">									        
	        	<form:input path="regDate" cssClass="ct_input_g" size="11"/>
	        	<form:errors path="regDate" cssClass="errors" />	        	
	        	<c:if test="${empty board.regDate}">
					<anyframe:validate id="regDate" type="Date" value="currentDate" />
				</c:if>
				<c:if test="${not empty board.regDate}">
					<anyframe:validate id="regDate" type="Date" />
				</c:if>
					        	
			</td>
		</tr>
	<tr><td height="1" colspan="3" bgcolor="D6D6D6"></td></tr>
	<input type="hidden" name="rootPath" value="<c:url value='/'/>"/>		
</table>

<!--begin of button-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
			<td height="24" colspan="2" align="center">	
					<c:if test="${empty board.id.boardId}">
					  <a href="javascript:fncCreateBoard();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
        			</c:if>
        					
					<c:if test="${not empty board.id.boardId}">
					  <a href="javascript:fncUpdateBoard();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					  <a href="javascript:fncRemoveBoard();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
        			</c:if>
		</td>
	</tr>
</table>

</form:form>