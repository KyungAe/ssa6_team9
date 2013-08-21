<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<div id="left">
<style type="text/css">
<!--
.menus {
	background-image:
		url("<c:url value='/whereareyou/images/top_menus.png'/>");
}

.depth01 a:hover {
	background: #dadada
		url("<c:url value='/whereareyou/images/menu_hover.png'/>") left top
		no-repeat;
}
-->
</style>
<table border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee">
	<tr>
		<td>
		<table width="177" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
			<tr>
				<td height="23" bgcolor="#eeeeee" class="menus"></td>
			</tr>
			<tr>
				<td valign="top" bgcolor="#eeeeee" class="depth01">
				<a href="${ctx}/employeeFinder.do?method=list">사 원</a>
				</td>
			</tr>
			<tr>
				<td valign="top" bgcolor="#eeeeee" class="depth01">
				<a href="${ctx}/project.do?method=list">프로젝트</a>
				</td>
			</tr>
			<tr>
				<td  valign="top" bgcolor="#eeeeee" class="depth01">
				<a href="${ctx}/game.do">주사위 게임</a>
				</td>
			</tr>
			<tr>
				<td valign="top" bgcolor="#eeeeee" class="depth01">
				<a href="${ctx}/project.do?method=mapView">지도</a>
				</td>
			</tr>
			<tr>
				<td valign="top" bgcolor="#eeeeee" class="depth01">
				<a href="${ctx}/xlsImport.do?method=init">Import EXCEL</a>
				</td>
			</tr>
			
			<!--Add new menu here-->
		</table>
		</td>
	</tr>
</table>
</div>
