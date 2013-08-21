<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
	<%@ include file="/whereareyou/common/meta.jsp"%>
	<title><spring:message code="projectMapList.title" /></title>
	<meta name="heading" content="<spring:message code='projectMapList.heading'/>" />
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
	<script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript"
		src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=6b17b6ef286c69cacb92900e76064ad0"></script>
	<script type="text/javascript">
		function fncSearchProject(arg) {
		   	document.searchForm.action="<c:url value='/project.do?method=mapView'/>";
		   	document.searchForm.submit();						
		}		
	</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<img src="<c:url value='/whereareyou/images/map_title.png'/>">
	<script>
		var circle;
		var oIndex = 0;
		var arrayInfo = new Array();
		var arrayMarker = new Array();
		var arrayLabel = new Array();
		var arrayProjectSeq = new Array();
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
		// - Draggable Marker 의 경우 Icon 인자는 Sprite Icon이 된다.
		// - 따라서 Sprite Icon 을 사용하기 위해 기본적으로 사용되는 값을 지정한다.
		// - Sprite Icon 을 사용하기 위해서 상세한 내용은 레퍼런스 페이지의 nhn.api.map.SpriteIcon 객체를 참조하면 된다.
		var testdefaultSpriteIcon = {
				url:"<c:url value='/whereareyou/images/mark.png'/>", 
				size:{width:24.37, height:29.85},
				spriteSize:{width:48.75, height:29.85},
				imgOrder:1, 
				offset : {width: 10, height: 24}
		};
		// - 위에서 지정한 기본값을 이용해 실제로 SpriteIcon 을 생성한다.
		var testDupSpriteIcon_first = new nhn.api.map.SpriteIcon(testdefaultSpriteIcon.url, testdefaultSpriteIcon.size, testdefaultSpriteIcon.spriteSize, 1, testdefaultSpriteIcon.offset);
	</script>
	
<style>
#testMap {
	position: relative;
	z-index: 1;
}

#Pop {
	position: absolute;
	top: 20px;
	left: 1130px;
	z-index: 2;
}

#Pop_add{
	position: absolute;
	top:50px;
	left: 1130px;
	z-index: 2;
	}
</style>

	<center>
	<div id="testMap"
		style="border: 1px solid #000; width: 1250px; height: 700px; margin: 20px;">
		
		<div id="Pop">
				<input type="image" src="${ctx}/whereareyou/images/btn_map_search.png" name="search" onclick=fncSearchProjectName()  style="width:100px; height:30px" />
				
			</div>
		
		
		
		</div>

	</center>
		<script>
		var oPoint = null;
		var corrX = ${prjPosX};
		var corrY = ${prjPosY};
		
		if(${prjPosX} == 0) {
			oPoint = new nhn.api.map.TM128(317088, 546069);
		}
		else {
			oPoint = new nhn.api.map.TM128(corrX, corrY);
		}
		
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
				size : new nhn.api.map.Size(1250, 700)
			});
	</script>


<!-- 게시판 목록을 나타낸다. (디버깅용! 나중에 지우자
	<form:form modelAttribute="project" method="post" name="searchForm">
		<table class="scrollTable" width="100%" border="0" cellspacing="0"
			cellpadding="0" style="margin-top: 10px;">
			<thead>
				<tr>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjSeq" /></th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjNm" /></th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjPosX" /></th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjPosY" /></th>
					<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message
							code="project.prjCnt" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="project" items="${projects}">
					<tr class="board"
						onMouseOver="this.style.backgroundColor='#e4eaff';return true;"
						onMouseOut="this.style.backgroundColor=''; return true;">
						<td class="underline">${project.prjSeq}</td>
						<td class="underline"><a class="linkClass"
							href="javascript:fncUse('${project.prjNm}', '${project.prjPosX}', '${project.prjPosY}');">${project.prjNm}</a>
						</td>
						<td align="center">${project.prjPosX}</td>
						<td align="center">${project.prjPosY}</td>
						<td align="left">${project.prjCnt}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td class="page" height="50" align="center"><anyframe:pagenavigator
						linkUrl="javascript:fncSearchProject();" pages="${resultPage}"
						firstImg="${ctx}/sample/images/pagenav/page_before1.gif"
						lastImg="${ctx}/sample/images/pagenav/page_after1.gif"
						prevImg="${ctx}/sample/images/pagenav/page_before.gif"
						nextImg="${ctx}/sample/images/pagenav/page_after.gif" />
				</td>
			</tr>
		</table>
게시판 목록 끝 -->
		<!-- 각 프로젝트에 해당하는 마커를 하나씩 나타낸다 -->
		
		<c:forEach var="project" items="${projects}">
		<script>
				var testDupSpriteIcon_second = new nhn.api.map.SpriteIcon(testdefaultSpriteIcon.url, testdefaultSpriteIcon.size, testdefaultSpriteIcon.spriteSize, 0, testdefaultSpriteIcon.offset);
				var oPointMarker = new nhn.api.map.TM128(${project.prjPosX}, ${project.prjPosY});
				var DraggableMarker2 = new nhn.api.map.DraggableMarker(testDupSpriteIcon_second , {	
					title : "${project.prjNm}".substring(0,10) + "...[" + ${project.prjCnt} + "명]",
					point : oPointMarker,
					zIndex : 1,
					smallSrc :  testDupSpriteIcon_second});		
				oMap.addOverlay(DraggableMarker2); 
				var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
				oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
				oLabel.setVisible(true, DraggableMarker2); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
				
				var mapInfoTestWindow2 = new nhn.api.map.InfoWindow(); // - info window 생성.
				mapInfoTestWindow2.setVisible(false); // - infowindow 표시 여부 지정.
				oMap.addOverlay(mapInfoTestWindow2);	// - 지도에 info window를 추가한다.	 
				mapInfoTestWindow2.setContent(
						'<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
						'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
						'${project.prjNm}<br />' + 
						'대표자: ' + '${project.prjRepEmpNm}<br/>' +
						'<a class="linkClass" href="${ctx}/projectInfo.do?method=get&seq=${project.prjSeq}">상세정보</a>' +
						'<span></div>');
				mapInfoTestWindow2.setPoint(oPointMarker);
				mapInfoTestWindow2.autoPosition();
				
				DraggableMarker2.attach("changePosition" , function (oEvent) {
					
					for(var i=0; i < arrayInfo.length; i++){
						if(oEvent.oldPoint.equals(arrayInfo[i].getPoint())){
							// 정보창 이동&보기
							if(arrayInfo[i].getVisible() != false){
								arrayInfo[i].setVisible(false); 
								arrayInfo[i].setPoint(oEvent.newPoint);
								arrayInfo[i].setVisible(true);
								arrayInfo[i].autoPosition();
							}else{
								arrayInfo[i].setPoint(oEvent.newPoint);
								arrayInfo[i].autoPosition();
							}
							
							// 라벨 이동
							arrayLabel[i].setVisible(false, arrayMarker[i]);
							arrayLabel[i].setVisible(true, arrayMarker[i]);
							
							document.mapForm.prjSeq.value = arrayProjectSeq[i];
							document.mapForm.prjPosX.value = oEvent.newPoint.getX();
							document.mapForm.prjPosY.value = oEvent.newPoint.getY();
							
							// NewPoint Update
							fncUpdateProject();
						}
					}
				});
				arrayMarker.push(DraggableMarker2);
				arrayInfo.push(mapInfoTestWindow2);
				arrayLabel.push(oLabel);
				arrayProjectSeq.push('${project.prjSeq}');
				oIndex++;
					
			</script>
	</c:forEach>
	<!--</form:form>-->

	<!-- END OF Project Title -->

	<form:form modelAttribute="map" name="mapForm" method="post"
		enctype="multipart/form-data">
		<form:input type="hidden" path="prjSeq" name="mapSeq" cssClass="ct_input_s"
			size="40" maxlength="50" readonly="false" />
		<form:input type="hidden" path="prjPosX" cssClass="ct_input_s" size="8"
			maxlength="50" />
		<form:input type="hidden" path="prjPosY" cssClass="ct_input_s" size="8"
			maxlength="50" />
		<!--<button value="searchName" name="search" onclick=fncUpdateProject()>-->
	</form:form>



	<script type="text/javascript">
		var DraggableMarker = new nhn.api.map.DraggableMarker(testDupSpriteIcon_first , {	
			title : '아셈타워',
			point : new nhn.api.map.TM128(317088, 546069),
			zIndex : 2,
			smallSrc :  testDupSpriteIcon_first});		
		oMap.addOverlay(DraggableMarker); 
	
		var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
		oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
		oLabel.setVisible(true, DraggableMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
		
		var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성.
		mapInfoTestWindow.setVisible(true); // - infowindow 표시 여부 지정.
		oMap.addOverlay(mapInfoTestWindow);	// - 지도에 info window를 추가한다.	
		
		oMap.attach('click', function(oCustomEvent) {
			var oPointClick = oCustomEvent.point;
			var oTarget = oCustomEvent.target;
			mapInfoTestWindow.setVisible(false);
			// 마커를 클릭했을 때.
			if (oTarget instanceof nhn.api.map.DraggableMarker) {
				// 겹침 마커를 클릭했을 때.
				if (oCustomEvent.clickCoveredMarker) {
					return;
				}
				
				for(var i=0; i < arrayInfo.length; i++){
					if(oTarget.getPoint().equals(arrayInfo[i].getPoint())){
						if(arrayInfo[i].getVisible()){
							arrayInfo[i].setVisible(false);
						}else{
							arrayInfo[i].setVisible(true);
						}							
					}
				}
				return;
			}
		});
		
		var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
		mapZoom.setPosition({left:15, bottom:7}); // - 줌 컨트롤 위치 지정
		oMap.addControl(mapZoom); // - 줌 컨트롤 추가.

		var posX,posY;

		function fncSearchProjectName() {
			popWin = window
					.open(
							"<c:url value='/project.do?method=searchmap'/>",
							"popWin",
							"left=300,top=200,width=900,height=450,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
		}

		function fncSetCenter(x, y, d) {
			// 좌표값에 해당하는 위치로 이동
			posX = x;
			posY = y;
			
			var basicP2 = new nhn.api.map.TM128(x, y);
			var level=(d/700)*100;
		
			if(level>0 && level<=13)
				level=14;
			else if(level>13 && level<=25)
				level=13;
			else if(level>25 && level<=50)
				level=12;
			else if(level>50 && level<=100)
				level=11;
			else if((level==0) || (level>100 && level<=200))
				level=10;
			else if(level>200 && level<=400)
				level=9;
			else if(level>400 && level<=800)
				level=8;
			else if(level>800 && level<=1600)
				level=7;
			else if(level>1600 && level<=3200)
				level=6;
			else if(level>3200 && level<=6400)
				level=5;
			else if(level>6400 && level<=12800)
				level=4;
			else if(level>12800 && level<=25600)
				level=3;
			else if(level>25600 && level<=51200)
				level=2;
			else 
				level=1;
						
			oMap.setCenterAndLevel(basicP2,level);
			
			if(circle!=null){
				oMap.removeOverlay(circle);	
			}
			
			circle = new nhn.api.map.Circle({
				strokeColor : "red",
				strokeOpacity : 1,
				strokeWidth : 1,
				fillColor : "blue",
				fillOpacity : 0.5
			});
			//var radius=100;
			var radius = d; // - radius의 단위는 meter
			circle.setCenterPoint(basicP2); // - circle 의 중심점을 지정한다.
			circle.setRadius(radius); // - circle 의 반지름을 지정하며 단위는 meter이다.
			circle.setStyle("strokeColor", "blue"); // - 선의 색깔을 지정함.
			circle.setStyle("strokeWidth", 2); // - 선의 두께를 지정함.
			circle.setStyle("strokeOpacity", 1); // - 선의 투명도를 지정함.
			circle.setStyle("fillColor", "gray"); // - 채우기 색상. none 이면 투명하게 된다.
			oMap.addOverlay(circle);
			
		}


		function fncSearchAddress(joinform) {
			alert("주소찾기");
		}
		
		/* 수정 기능 함수 */
		function fncUpdateProject() {
			//폼 action 속성 변경
		    document.mapForm.action="<c:url value='/project.do?method=updatePoint'/>";
		    /* 폼 전송 */
		    document.mapForm.submit();
		}
		oMap.setCenter(oPoint);
	</script>
	
	
	<script>
		// 네이버 api를 가져오는 과정에서, 완료가 안되는 이슈가 있음
		setTimeout("window.stop();", 5000);
	</script>