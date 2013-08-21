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
			if (confirm("엑셀파일 반영을 선택하셨습니다. 올바른 서식과 포맷인지 다시 확인해 주세요. 계속 진행할까요?") != 0)
				document.excelUploadForm.action = "<c:url value='/xlsImport.do?method=importExcelFile'/>";
			else {
				alert("취소하였습니다.");
				return;
			}

			var f = document.excelUploadForm;
			if (f.excelFile.value == "") {
				alert("파일을 선택해 주세요.");
				return;
			}
			var fileNameLength = f.excelFile.value.length;
			if (f.excelFile.value.substring(fileNameLength - 4, fileNameLength) != "xlsx") {
				alert("확장자가 xlsx인 엑셀파일을 선택해 주세요.");
				return;
			}
			f.submit();
		}
	</script>
</head>

<body>
<br><br>
<center>
<form:form name="excelUploadForm" method="post" enctype="multipart/form-data">
<TABLE width="900" border="1" cellspacing="0" cellpadding="2" bgcolor="#E8EBF4" style="border-color:#D6E0FF;">
  <TR><TD> 

    <TABLE width="100%" border="1" cellspacing="0" cellpadding="2" align="CENTER" style="border-color:#DEEBF9">
      <TR>
        <TD align=center height="25px"><font color=#F28B7B style="font-size:20px; font-weight:bold">주 의 사 항</font></TD>
     </TR>
      <tr>
			<td><h3><font color=#2F9D27 style="padding-left:10; font-weight:bold">엑셀파일을 자동으로 임포트(Import)하여 데이터베이스에 반영합니다.<br/>
				<font style="padding-left : 10;">단, 기존의 데이터베이스는 모두 삭제되고 입력하신 엑셀파일을 기준으로 갱신되니 주의하시기 바랍니다.</font> </br>
				<font style="padding-left : 10;">지원되는 엑셀파일은 <b>xlsx</b> 형식입니다.</font></font></h3>
			</td>
		</tr> 
		<tr>
			<td><h3><font color=#635FDA style="padding-left:10; font-weight:bold">첫번째 시트에는 <b>사원의 정보</b>, 두번째 시트에는 <b>프로젝트의 정보</b>가 담겨있어야 합니다.</br>
				<font style="padding-left : 10;">
				구체적인 서식은 아래를 참조하시기 바랍니다.</font>
			</font></h3>
			</td>
		</tr>
		<tr>
			<td><p style="padding-left: 10; font-size:15px; font-weight:bold">파일명</p>
			<input type="file" name="excelFile" size="34" class="f3" style="padding-left: 10;">
			<input type="button" style="margin-left:20; margin-bottom:10"value="반영시작" name="excelImport" onClick="javascript:goInsert();"/>
			</td>
		</tr>
		<c:if test="${not empty successCategory}">
		<tr>
			<td align=center><p style="padding-left: 10; font-size:17px;font-weight:bold">${successCategory} 입력이 정상적으로 수행되었습니다.</p></td>
		</tr>
		</c:if>
		<tr>
			<td align=center>
				</br>
				<img src="<c:url value='/whereareyou/images/excel_example.jpg'/>" width="850px" height="450" border="0" />
			</td>
		</tr>
    </TABLE>

  </TD></TR>
</TABLE>
</form:form>
</center>
</body>