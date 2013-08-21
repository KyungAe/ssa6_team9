<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
    <%@ include file="/whereareyou/common/meta.jsp" %>
    <title><spring:message code="projectDetail.title"/></title>
    <meta name="heading" content="<spring:message code='projectDetail.heading'/>"/>   
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">            
	<script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=6b17b6ef286c69cacb92900e76064ad0"></script>

	<script type="text/javascript">
	
	/* 프로젝트 수정 기능 함수 */
	function fncUpdatePosition() {
		//폼 action 속성 변경
	    document.projectForm.action="<c:url value='/project.do?method=updatePointFromInfo'/>";
	    /* 폼 전송 */
	    document.projectForm.submit();
	}

	/* 등록 기능 함수 */
	function fncCreateProject() {
	    document.projectForm.action="<c:url value='/projectInfo.do?method=create'/>";
	        
	    /* 유효성 검사 시작부분 */
	    
	    var prjNm = document.projectForm.prjNm.value;
	    var prjAddr = document.projectForm.prjAddr.value;
	    var prjRepIdEmpId = document.projectForm.prjRepIdEmpId.value;
	    var prjPosX = document.projectForm.prjPosX.value;
	    var prjPosY = document.projectForm.prjPosY.value;
	    
	    //빈 폼은 있는가

	    if(isEmptyPrjNm(prjNm) || isEmptyPrjAddr(prjAddr) || isEmptyPrjRepIdEmpId(prjRepIdEmpId) ||
	    		isEmptyPrjPosX(prjPosX) || isEmptyPrjPosY(prjPosY))
	    	return;
	    
	    /* 폼 전송 */
	    document.projectForm.submit();
	}
	/* 수정 기능 함수 */
	function fncUpdateProject() {
		
		//폼 action 속성 변경
	    document.projectForm.action="<c:url value='/projectInfo.do?method=update'/>";
	    
	    /* 유효성 검사 시작부분 */
	    
	    var prjNm = document.projectForm.prjNm.value;
	    var prjAddr = document.projectForm.prjAddr.value;
	    var prjRepIdEmpId = document.projectForm.prjRepIdEmpId.value;
	    var prjPosX = document.projectForm.prjPosX.value;
	    var prjPosY = document.projectForm.prjPosY.value;
	    
	    //빈 폼은 있는가

	    if(isEmptyPrjNm(prjNm) || isEmptyPrjAddr(prjAddr) || isEmptyPrjRepIdEmpId(prjRepIdEmpId) ||
	    		isEmptyPrjPosX(prjPosX) || isEmptyPrjPosY(prjPosY))
	    	return;
	    
	    /* 폼 전송 */
	    document.projectForm.submit();
	}
	/* 제거 기능 함수 */
	function fncRemoveProject(){	
		if(confirmDelete('project')) {
		    document.projectForm.action="<c:url value='/projectInfo.do?method=remove'/>";
		    document.projectForm.submit();
		}	    
	}
	/* 검색 기능 함수 */
	function fncSearchProject(){
		popWin = window.open("<c:url value='/employeeFinder.do?method=search'/>","popWin", "left=300,top=200,width=800,height=400,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
	}
	
	/* 주소 검색 기능 함수 */
	function fncSearchAddress(){
		popWin = window.open("<c:url value='/project.do?method=searchAddress'/>","popWin", "left=300,top=200,width=800,height=400,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
	}
	
	/* 유효성 검사 관련 함수 */
	function isEmptyPrjNm(args) {
		if(args.length == 0) {
			alert("프로젝트 명을 입력해 주세요.");
			return true; }
		else 
			return false;
	}
	function isEmptyPrjAddr(args) {
		if(args.length == 0) {
			alert("주소를 입력해 주세요.");	
			return true; }
		else 
			return false;
	}
	function isEmptyPrjRepIdEmpId(args) {
		if(args == 0) {
			alert("사원번호를 입력해 주세요.");
			return true; }
		else 
			return false;
	}
	function isEmptyPrjPosX(args) {
		if(args == 0) {
			alert("X좌표를 입력해 주세요.");
			return true; }
		else 
			return false;
	}
	function isEmptyPrjPosY(args) {
		if(args == 0) {
			alert("Y좌표를 입력해 주세요.");
		return true; }
		else 
			return false;
	}
	function fncClearEmployee() {
		this.prjRepIdEmpId.value = "";
		this.prjRepEmpNm.value ="";
	} 
	

	</script>         
</head>
<!--************************** begin of contents *****************************-->
<body>
	<!--begin of title-->
	<table width="1370" height="37" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>
				<table width="1370" height="24" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
							<c:if test="${empty project.prjSeq}">
				 	<img
					src="<c:url value='/whereareyou/images/prj_info.png'/>">
				 	<c:set var="readonly" value="false" />
							</c:if> <c:if test="${not empty project.prjSeq}">	
					<img
					src="<c:url value='/whereareyou/images/prj_cha.png'/>">
					<c:set var="readonly" value="true" />
							</c:if></td>
					</tr>


				</table></td>
		</tr>
	</table>
	</br>
	</br>
	<form:form modelAttribute="project" name="projectForm" method="post" enctype="multipart/form-data">
		<p style="font-size:14px">* 로 표시된 항목은 필수 입력 항목입니다. (사번은 자동으로 입력됩니다) </p>
		<table width="1370" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr height="50">
				<td width="150" class="ct_td" align="right" style="font-size: 15px">프로젝트&nbsp;번호*&nbsp;</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><c:if test="${not empty project.prjSeq}">
						<form:input path="prjSeq" cssClass="ct_input_s" size="40"
							maxlength="50" readonly="true" />
					</c:if> <c:if test="${empty project.prjSeq}">
						<form:input path="prjSeq" cssClass="ct_input_s" size="40"
							maxlength="50" readonly="true" value="${lastSeq}" />
					</c:if></td>
			</tr>
			<tr height="50">
				<td width="150" class="ct_td" align="right" style="font-size: 15px">프로젝트&nbsp;이름*&nbsp;</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><form:input path="prjNm"
						cssClass="ct_input_s" size="50" maxlength="100" name="prjNm" />
				</td>
			</tr>
			<tr height="50">
				<td width="150" class="ct_td" align="right" style="font-size: 15px">프로젝트&nbsp;주소*&nbsp;</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><form:input path="prjAddr"
						cssClass="ct_input_s" size="50" maxlength="150" name="prjAddr"/> <input
					type="button" value="찾기" name="insert"
					style="height: 25; font-size: 12; font-weight: bold"
					onClick="fncSearchAddress();">
				</td>
			</tr>
			<tr height="50">
				<td width="150" class="ct_td" align="right" style="font-size: 15px">프로젝트&nbsp;담당자*&nbsp;</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><form:input path="prjRepIdEmpId"
						cssClass="ct_input_s" size="7" maxlength="50" readonly="true" />
					<form:input path="prjRepEmpNm" cssClass="ct_input_s" size="40"
						maxlength="50" readonly="true" /> <input type="button" value="찾기"
					name="insert" style="height: 25; font-size: 12; font-weight: bold"
					onClick="fncSearchProject();"> &nbsp;<input type="button"
					name="init_prj" value="초기화"
					style="height: 25; font-size: 12; font-weight: bold"
					onClick="fncClearEmployee();" />
				</td>
			</tr>
			<tr>
				<td width="150" class="ct_td" align="right" style="font-size: 15px">프로젝트&nbsp;위치&nbsp;</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					</br>
					<p style="font-size:14px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지도에서 마커를 드래그하여 더 정확한 위치에 표시할 수 있습니다.
					<c:if test="${empty project.prjNm}">초기 위치는 '삼성동 아셈타워'입니다.</c:if>
					<c:if test="${not empty project.prjNm}">드래그를 한 후 수정버튼을 누르면 위치변경이 완료됩니다.</c:if></p>
					<div id="testMap" style="border: 1px solid #000; width: 600px; height: 320px; margin: 20px;"></div>
					<form:input type="hidden" path="prjPosX" cssClass="ct_input_pos" size="8" maxlength="40" />&nbsp;
					<form:input type="hidden" path="prjPosY" cssClass="ct_input_pos" size="8" maxlength="40" />
				</td>
			</tr>

			<tr>
				<td width="150" class="ct_td" align="right" style="font-size: 15px">투입된&nbsp; 사원&nbsp;</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01" style="font-size:14px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="employee" items="${employees}">
						<a class="linkClass" href="${ctx}/employee.do?method=get&empId=${employee.empId}">${employee.empNm}</a>&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<c:if test="${empty project.prjNm}">
					<!-- 프로젝트 등록 버튼 -->
					<td height="24" colspan="2" align="center"><a id="createlink"
						href="javascript:fncCreateProject();"><img
							src="<c:url value='/whereareyou/images/btn_add.png'/>" width="80"
							height="32" border="0" /> </a> <script type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'createlink',
							event : 'onclick'
						}));
					</script> <a href="javascript:history.go(-1)"><img
							src="<c:url value='/whereareyou/images/btn_back.png'/>"
							width="80" height="32" border="0" /> </a></td>
				</c:if>

				<c:if test="${not empty project.prjNm}">
					<!-- 프로젝트 수정 버튼 -->
					<td height="24" colspan="2" align="center"><a id="createlink"
						href="javascript:fncUpdateProject();"><img
							src="<c:url value='/whereareyou/images/btn_update.png'/>"
							width="80" height="32" border="0" /> </a> <script
							type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'createlink',
							event : 'onclick'
						}));
					</script> <!-- 프로젝트 삭제 버튼 --> <a id="createlink"
						href="javascript:fncRemoveProject();"><img
							src="<c:url value='/whereareyou/images/btn_delete.png'/>"
							width="80" height="32" border="0" /> </a> <script
							type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'createlink',
							event : 'onclick'
						}));
					</script></td>
				</c:if>
			</tr>
		</table>
		
		<!-- 지도 API 자바 스크립트 시작 -->
		<script>
			/* 지도  */
			var initPosX = ${project.prjPosX};
			var initPosY = ${project.prjPosY};

			if (initPosX == 0 && initPosY == 0) {
				initPosX = 317088;
				initPosY = 546069;
				document.projectForm.prjPosX.value = initPosX;
				document.projectForm.prjPosY.value = initPosY;
			}

			oPoint = new nhn.api.map.TM128(initPosX, initPosY);
			nhn.api.map.setDefaultPoint('TM128');
			oMap = new nhn.api.map.Map('testMap', {
				point : oPoint,
				zoom : 7,
				enableWheelZoom : true,
				enableDragPan : true,
				enableDblClickZoom : false,
				mapMode : 0,
				activateTrafficMap : false,
				activateBicycleMap : false,
				minMaxLevel : [ 1, 14 ],
				size : new nhn.api.map.Size(600, 320)
			});

			var testdefaultSpriteIcon = {
				url : "<c:url value='/whereareyou/images/mark.png'/>",
				size : {
					width : 24.37,
					height : 29.85
				},
				spriteSize : {
					width : 48.75,
					height : 29.85
				},
				imgOrder : 1,
				offset : {
					width : 10,
					height : 24
				}
			};
			// - 위에서 지정한 기본값을 이용해 실제로 SpriteIcon 을 생성한다.
			var testDupSpriteIcon_first = new nhn.api.map.SpriteIcon(
					testdefaultSpriteIcon.url, testdefaultSpriteIcon.size,
					testdefaultSpriteIcon.spriteSize, 0,
					testdefaultSpriteIcon.offset);

			var DraggableMarker = new nhn.api.map.DraggableMarker(
					testDupSpriteIcon_first, {
						title : '아셈타워',
						point : new nhn.api.map.TM128(initPosX, initPosY),
						zIndex : 1,
						smallSrc : testDupSpriteIcon_first
					});

			oMap.addOverlay(DraggableMarker);
			oMap.setCenter(oPoint);

			DraggableMarker.attach("changePosition", function(oEvent) {
				document.projectForm.prjPosX.value = oEvent.newPoint.getX();
				document.projectForm.prjPosY.value = oEvent.newPoint.getY();
				oMap.setCenter(oEvent.newPoint);
			});

			var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
			mapZoom.setPosition({
				left : 15,
				bottom : 7
			}); // - 줌 컨트롤 위치 지정
			oMap.addControl(mapZoom); // - 줌 컨트롤 추가.
		</script>
		
	</form:form>
</body>

<script>
		// 네이버 api를 가져오는 과정에서, 완료가 안되는 이슈가 있음
		setTimeout("window.stop();", 5000);
	</script>