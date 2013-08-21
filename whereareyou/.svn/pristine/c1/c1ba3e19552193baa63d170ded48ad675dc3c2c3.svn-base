<%@ page language="java" errorPage="/whereareyou/common/error.jsp"
	pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
<%@ include file="/whereareyou/common/meta.jsp"%>
<title><spring:message code="employee.name" /></title>
<meta name="heading"
	content="<spring:message code='employeeList.heading'/>" />
<link rel="stylesheet"
	href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
<script type="text/javascript"
	src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
<script type="text/javascript">
	function fncCreateEmployeeView() {
		document.location.href = "<c:url value='/employee.do?method=createView'/>";
	}
	function fncSearchEmployee(arg) {
		document.employeeListForm.action = "<c:url value='/employeeFinder.do?method=list'/>";
		document.employeeListForm.submit();
	}
	function fncSearchProject() {
		popWin = window
				.open(
						"<c:url value='/project.do?method=search'/>",
						"popWin",
						"left=300,top=200,width=900,height=400,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
	}
	function fncClearProject() {
		this.empPrjSeq.value = "";
		this.empPrjNm.value = "";
	}
</script>
</head>

<form:form modelAttribute="employee" method="post"
	name="employeeListForm">

	<!-- 타이틀 -->
	<table width="1370" height="24" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="12">
				<table width="1370" height="24" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><img
					src="<c:url value='/whereareyou/images/emp_title.png'/>"></td>
					</tr>
					<tr>
						<td><img
							src="<c:url value='/whereareyou/images/emp_title2.png'/>"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<!-- 타이틀 끝 -->
<br>

			<!-- 검색 테이블 -->
			<table width="1370">
						<tr height="30">
					<td width="120" align="right" bgcolor="#eeeeee" style="font-weight: bold; font-size:17px"/>
					<label><spring:message code="employee.id" />&nbsp;&nbsp;</label>
					</td>
					<td width="180" style="padding-left: 10px; "><form:input
							path="empId" cssClass="ct_input_g"
							cssErrorClass="text medium error" maxlength="12" size="12"
							onkeydown="if((arguments[0]||event).keyCode==13){fncSearchEmployee();return false}" />
					</td>
					<td width="120" align="right" bgcolor="#eeeeee" style="font-weight: bold; font-size:17px"/>
					<label><spring:message code="employee.name" />&nbsp;&nbsp;</label>
					</td>
					<td width="380" style="padding-left: 10px;"><form:input
							path="empNm" cssClass="ct_input_g"
							cssErrorClass="text medium error" maxlength="12" size="12"
							onkeydown="if((arguments[0]||event).keyCode==13){fncSearchEmployee();return false}" />
						<form:hidden path="empPrjSeq" />
					</td>
					<td width="200" align="right" ><input type="button"
						name="search_emp" value="조회" 
						onClick="javascript:fncSearchEmployee();" />
					</td>
				</tr>
				<tr height="30">
					<td width="120" align="right" bgcolor="#dadada" style="font-weight: bold; font-size:17px"/>
					<label><spring:message code="employee.order" />&nbsp;&nbsp;</label>
					</td>
					<td width="180" style="padding-left: 10px; font-weight: bold; font-size: 13"><form:input
							path="empEntSeq" cssClass="ct_input_g"
							cssErrorClass="text medium error" maxlength="12" size="12" 
							onkeydown="if((arguments[0]||event).keyCode==13){fncSearchEmployee();return false}"/>
					</td>
					<td width="140" align="right" bgcolor="#dadada" style="font-weight: bold; font-size:17px"/>
					<label><spring:message code="employee.projectname" />&nbsp;&nbsp;</label>
					</td>
					<td width="600" style="padding-left: 10px"><form:input
							path="empPrjNm" cssClass="ct_input_g"
							cssErrorClass="text medium error" maxlength="12" size="40"
							readonly="true" /> &nbsp;<input type="button" name="search_prj"
						value="찾기" style="height:25;font-size:12;font-weight:bold" onClick="fncSearchProject();" /> &nbsp;<input
						type="button" name="init_prj" value="초기화" style="height:25;font-size:12;font-weight:bold"
						onClick="fncClearProject();" /></td>
					<td width="150" align="right"><input type="button"
						name="add_emp" value="신규등록"
						onClick="javascript:fncCreateEmployeeView();" /></td>
				</tr>
			</table>
			<!-- 검색 테이블 끝 -->

	</br>
			<table class="scrollTable" width="1370" border="0" cellspacing="0"
				cellpadding="0" style="margin-top: 10px;">
				<thead>
					<tr>
						<th scope="col" width="154" style="height: 30px; font-size: 16;"><spring:message
								code="employee.id" /></th>
						<th scope="col" width="154" style="height: 30px; font-size: 16;"><spring:message
								code="employee.name" /></th>
						<th scope="col" width="154" style="height: 30px; font-size: 16;"><spring:message
								code="employee.order" /></th>
						<th scope="col" width="600" style="height: 30px; font-size: 16;"><spring:message
								code="employee.projectname" /></th>
						<th scope="col" width="154" style="height: 30px; font-size: 16;"><spring:message
								code="employee.dept" /></th>
						<th scope="col" width="154" style="height: 30px; font-size: 16;"><spring:message
								code="employee.code" /></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="employee" items="${employees}">
						<tr class="board" height="30"
							onMouseOver="this.style.backgroundColor='#e4eaff';return true;"
							onMouseOut="this.style.backgroundColor=''; return true;">
							<td align="center" width="154" class="underline"
								style="font-size: 17">${employee.empId}</td>
							<td align="center" width="154" class="underline"
								style="font-size: 17"><a class="linkClass"
								href="${ctx}/employee.do?method=get&empId=${employee.empId}"
								style="font-size: 17">${employee.empNm}</a></td>

							<td align="center" width="154" style="font-size: 17">${employee.empEntSeq}</td>
							<td align="left" width="600"
								style="padding-left: 10; font-size: 17">${employee.empPrjNm}<c:if
									test="${empty employee.empPrjNm}">투입 중인 프로젝트 없음</c:if>
							</td>
							<td align="center" width="154" style="font-size: 17">${employee.empDeptNm}</td>
							<td align="center" width="154"
								style="border-right: 0; font-size: 17"><c:if
									test="${employee.empSendCode==0}">해당없음</c:if> <c:if
									test="${employee.empSendCode==1}">파견옴</c:if> <c:if
									test="${employee.empSendCode==2}">파견감</c:if> <c:if
									test="${not (employee.empSendCode==0||employee.empSendCode==1||employee.empSendCode==2)}">-</c:if>


							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<table width="1370" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td class="page" height="50" align="center"><anyframe:pagenavigator
							linkUrl="javascript:fncSearchEmployee();" pages="${resultPage}"
							firstImg="${ctx}/whereareyou/images/pagenav/page_before1.gif"
							lastImg="${ctx}/whereareyou/images/pagenav/page_after1.gif"
							prevImg="${ctx}/whereareyou/images/pagenav/page_before.gif"
							nextImg="${ctx}/whereareyou/images/pagenav/page_after.gif" />
					</td>
				</tr>
			</table>
			</form:form>