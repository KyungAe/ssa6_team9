<%@ page language="java" errorPage="/whereareyou/common/error.jsp"
	pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
<%@ include file="/whereareyou/common/meta.jsp"%>
<title><spring:message code="employee.name" /></title>
<meta name="heading"
	content="<spring:message code='employeeDetail.heading'/>" />
<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
<script type="text/javascript">
	/* 등록 기능 함수 */
	function fncCreateEmployee() {
		document.employeeListForm.action = "<c:url value='/employee.do?method=create'/>";
		
	    /* 유효성 검사 시작부분 */
	    
	    var empId = document.employeeListForm.empId.value;
	    var empNm = document.employeeListForm.empNm.value;
	    var empEntSeq = document.employeeListForm.empEntSeq.value;
	    var empDeptNm = document.employeeListForm.empDeptNm.value;
	    var empPrjSeq = document.employeeListForm.empPrjSeq.value;
	    
	    //빈 폼은 있는가

	    if(isEmptyEmpId(empId) || isEmptyEmpNm(empNm) || isEmptyEmpEntSeq(empEntSeq) ||
	    		isEmptyEmpDeptNm(empDeptNm) || isEmptyEmpPrjSeq(empPrjSeq))
	    	return;
	    
	    /* 폼 전송 */
		
		document.employeeListForm.submit();
	}
	/* 수정 기능 함수 */
	function fncUpdateEmployee() {
		document.employeeListForm.action = "<c:url value='/employee.do?method=update'/>";
		
	    /* 유효성 검사 시작부분 */
	    
	    var empId = document.employeeListForm.empId.value;
	    var empNm = document.employeeListForm.empNm.value;
	    var empEntSeq = document.employeeListForm.empEntSeq.value;
	    var empDeptNm = document.employeeListForm.empDeptNm.value;
	    var empPrjSeq = document.employeeListForm.empPrjSeq.value;
	    
	    //빈 폼은 있는가

	    if(isEmptyEmpId(empId) || isEmptyEmpNm(empNm) || isEmptyEmpEntSeq(empEntSeq) ||
	    		isEmptyEmpDeptNm(empDeptNm) || isEmptyEmpPrjSeq(empPrjSeq))
	    	return;
	    
	    /* 폼 전송 */
		
		document.employeeListForm.submit();
	}
	/* 제거 기능 함수 */
	function fncRemoveEmployee() {
		if (confirmDelete('employee')) {
			document.employeeListForm.action = "<c:url value='/employee.do?method=remove'/>";
			document.employeeListForm.submit();
		}
	}
	
	/* 유효성 검사 관련 함수 */
	function isEmptyEmpId(args) {
		if(args.length == 0) {
			alert("사원번호를 입력해 주세요.");
			return true; }
		else 
			return false;
	}
	function isEmptyEmpNm(args) {
		if(args.length == 0) {
			alert("사원이름을 입력해 주세요.");	
			return true; }
		else 
			return false;
	}
	function isEmptyEmpEntSeq(args) {
		if(args.length == 0) {
			document.employeeListForm.empEntSeq.value = "";
			return false; }
		else 
			return false;
	}
	function isEmptyEmpDeptNm(args) {
		if(args.length == 0) {
			alert("부서명을 입력해 주세요.");
			return true; }
		else 
			return false;
	}
	function isEmptyEmpPrjSeq(args) {
		if(args.length == 0) {
			alert("프로젝트 정보를 입력해 주세요.");
		return true; }
		else 
			return false;
	}
	function fncSearchProject(){
		popWin = window.open("<c:url value='/project.do?method=search'/>","popWin", "left=300,top=200,width=900,height=400,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
	}
	function fncClearProject(){
		this.empPrjSeq.value = "";
		this.empPrjNm.value = "";
	}
</script>
</head>
<!--************************** begin of contents *****************************-->

<!--begin of title-->
<table width="1370" height="37" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>
			<table width="1370" height="24" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td><c:if
							test="${empty employee.empId}">
				 	<img
					src="<c:url value='/whereareyou/images/emp_info.png'/>">
				 	<c:set var="readonly" value="false" />
						</c:if> <c:if test="${not empty employee.empId}">	
					<img
					src="<c:url value='/whereareyou/images/emp_cha.png'/>">
					<c:set var="readonly" value="true" />
						</c:if>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</br>
</br>

<form:form modelAttribute="employee" name="employeeListForm" method="post" enctype="multipart/form-data">
	<p style="font-size:14px">* 로 표시된 항목은 필수 입력 항목입니다. (사번은 자동으로 입력됩니다) </p>
	<table width="1370" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr height="50">
			<td width="150" class="ct_td" align="right" style="font-size:15px">사번*&nbsp;</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<c:if test="${not empty employee.empId}">
				<form:input path="empId" cssClass="ct_input_s" size="40" maxlength="50" readonly="true"/>
				</c:if>
				<c:if test="${empty employee.empId}">
				<form:input path="empId" cssClass="ct_input_s" size="40" maxlength="50" readonly="false"/>
				</c:if>
			</td>
		</tr>
		<tr height="50">
			<td width="150" class="ct_td" align="right" style="font-size:15px">이름*&nbsp;</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="empNm"
					cssClass="ct_input_s" size="50" maxlength="100" /></td>
		</tr>
		<tr height="50">
			<td width="150" class="ct_td" align="right" style="font-size:15px">기수&nbsp;</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="empEntSeq"
					cssClass="ct_input_s" size="50" maxlength="150" /></td>
		</tr>
		<tr height="50">
			<td width="150" class="ct_td" align="right" style="font-size:15px">부서*&nbsp;</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="empDeptNm"
					cssClass="ct_input_s" size="50" maxlength="150" /></td>
		</tr>
		<tr height="50">
			<td width="150" class="ct_td" align="right" style="font-size:15px">프로젝트명*&nbsp;</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="empPrjNm"
					cssClass="ct_input_s" size="40" maxlength="50" readonly="true"/> <input
				type="button" value="찾기" name="search" style="height:25;font-size:12;font-weight:bold"
				onClick="fncSearchProject();">
				&nbsp;<input type="button" name="init_prj" value="초기화" style="height:25;font-size:12;font-weight:bold" onClick="fncClearProject();"/></td>
				<form:hidden path="empPrjSeq" />
		</tr>
		<tr height="50">
			<td width="150" class="ct_td" align="right" style="font-size:15px">파견코드&nbsp;</td>

			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" >
				<form:select path="empSendCode" >
					<form:option value="0" label="해당없음" />
					<form:option value="1" label="파견옴" />
					<form:option value="2" label="파견감" />
				</form:select>
			</td>
		</tr>
	</table>

	<!--begin of button-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center"><c:if
					test="${empty employee.empNm}">
					<a id="createlink" href="javascript:fncCreateEmployee();"><img
						src="<c:url value='/whereareyou/images/btn_add.png'/>" width="80"
						height="32" border="0" /> </a>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'createlink',
							event : 'onclick'
						}));
					</script>
					<a href="javascript:history.go(-1)"><img
						src="<c:url value='/whereareyou/images/btn_back.png'/>" width="80"
						height="32" border="0" /> </a>
				</c:if> <c:if test="${not empty employee.empNm}">
					<a id="updatelink" href="javascript:fncUpdateEmployee();"><img
						src="<c:url value='/whereareyou/images/btn_update.png'/>" width="80"
						height="32" border="0" /> </a>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'updatelink',
							event : 'onclick'
						}));
					</script>
					<a href="javascript:fncRemoveEmployee();"><img
						src="<c:url value='/whereareyou/images/btn_delete.png'/>" width="80"
						height="32" border="0" /> </a>
				</c:if>
			</td>
		</tr>
	</table>
</form:form>