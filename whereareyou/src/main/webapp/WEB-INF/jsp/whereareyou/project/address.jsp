<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>
    <%@ include file="/whereareyou/common/meta.jsp" %>
    <title><spring:message code="address.title"/></title>
	<meta name="heading" content="<spring:message code='addressList.heading'/>"/>       
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/jquery-1.9.1.min.js'/>"></script>
    <script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=6b17b6ef286c69cacb92900e76064ad0"></script>
    
 	    
	<script type="text/javascript">		
		function fncUse(val) {
			if(opener) {
				opener.document.projectForm.prjNm.value = val;
			}
			
			window.close();
		}
		
		var arrayStr = new Array();

		function fncSearchAddress(str){
			document.getElementById("result").innerHTML = "";
			while(arrayStr.length != 0){
				arrayStr.pop();
			}
			$.ajax({url : "http://apis.daum.net/local/geo/addr2coord",     
				dataType : "jsonp",
				type : "post",
				jsonp : "callback",
				data : {apikey : "8b80df74756d980fe39cf01ca043ef1fe5968f85",// API KEY
						q : str,// 검색어
						output : "json"                // JSONP 형식으로 호출하기 때문에 결과값 포맷은 json
						},     
				success : function(r){//검색결과 처리
					if(r.channel.item.length == 0){
						str = str.substring(0, str.lastIndexOf(" "));
						if(str.length === 0){
							alert("검색결과가 없습니다.")
						}
						fncSearchAddress(str);
					}else{
						for(var i=0; i<r.channel.item.length; i++){
							arrayStr.push(escapeHtml(r.channel.item[i].title));
							document.getElementById("result").innerHTML = document.getElementById("result").innerHTML +"<table><tr><td><a href=\"javascript:fncWGStoKTM("+ r.channel.item[i].lng + "," + r.channel.item[i].lat + "," + i +");\">" + (i+1) +". "+ arrayStr[i] + "</a></td></tr></table>";
							//alert(document.getElementById("result").innerHTML);
						}
						//fncWGStoKTM(r.channel.item[0].lng, r.channel.item[0].lat);
					}
				}
			}); 
		}
		
		function escapeHtml(str){
			str = str.replace(/&lt;b&gt;/g, "");
			str = str.replace(/&lt;\/b&gt;/g, "");
			return str;
		}
		
		function fncWGStoKTM(lng, lat, i){
			$.ajax({url : "http://apis.daum.net/local/geo/transcoord",     
				dataType : "jsonp",
				type : "post",
				jsonp : "callback",
				data : {apikey : "8b80df74756d980fe39cf01ca043ef1fe5968f85",// API KEY
						x : lng,
						y : lat,
						fromCoord : "WGS84",
						toCoord : "KTM",
						output : "json"
						},     
				success : function(r){//검색결과 처리
					var tmx = parseInt(r.x);
					var tmy = parseInt(r.y);
					if(opener) {
						opener.document.projectForm.prjPosX.value = tmx;
						opener.document.projectForm.prjPosY.value = tmy;
						opener.document.projectForm.prjAddr.value = arrayStr[i];
						var tmPoint = new nhn.api.map.TM128(tmx, tmy);
						opener.oMap.setCenter(tmPoint);
						opener.DraggableMarker.setPoint(tmPoint);
					}
					window.close();
				}
			}); 
		}
		 


	</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<!-- BEGIN OF Project Title -->
<form name="addressform" , method="post">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td">주소&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><input type="text" name="val" id="search" cssClass="ct_input_g" size="40" maxlength="50" onkeydown="if((arguments[0]||event).keyCode==13){fncSearchAddress(this.form.val.value);return false}"/> <input
				type="button" value="찾기" name="insert" onClick="fncSearchAddress(this.form.val.value);">
			</td>
		</tr>
	</table>
	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">주소</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>	
</form>

<table>

<div id="result">
</div>

</table>

<!-- END OF Project Title -->

<script>
	//네이버 api를 가져오는 과정에서, 완료가 안되는 이슈가 있음
	//window.stop();
	
</script>
