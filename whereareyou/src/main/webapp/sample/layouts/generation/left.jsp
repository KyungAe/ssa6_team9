<%@ page language="java" errorPage="/sample/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<div id="left">
<style type="text/css">
<!--
.menus {
	background-image:
		url("<c:url value='/sample/images/top_menus.png'/>");
}

.depth01 a:hover {
	background: #dadada
		url("<c:url value='/sample/images/menu_hover.png'/>") left top
		no-repeat;
}
-->
</style>
<table border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee">
	<tr>
		<td>
		<table width="177" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
			<tr>
				<td height="23" bgcolor="#eeeeee" class="menus">&nbsp;</td>
			</tr>

			

  <!--Board-START-->
      <tr>
				<td valign="top" bgcolor="#eeeeee" class="depth01"><a href="${ctx}/board.do?method=list">Board List</a></td>
			</tr>

<!--Board-END-->

  <!--Add new menu here-->
		</table>
		</td>
	</tr>
</table>
</div>
