<%@ page language="java" errorPage="/whereareyou/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/whereareyou/common/taglibs.jsp"%>
<head>

    <%@ include file="/whereareyou/common/meta.jsp" %>
    <title><spring:message code="dice.name"/></title>
	<meta name="heading" content="<spring:message code='diceList.heading'/>"/>       
	<link rel="stylesheet" href="<c:url value='/whereareyou/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/whereareyou/javascript/CommonScript.js'/>"></script>    
<title>크랩스 게임</title>
<script>
		var cwidth = 400;
		var cheight = 200;
		var dx = 75;
		var dy = 50;
		var dicewidth = 100;
		var diceheight = 100;
		var dotrad = 6;
		var ctx;
		var dicex;
		var dicey;
		var firstturn = true;
		var point;
		
		function initDice(){
			dicex = dx;
			dicey = dy;
			drawface(1);
			dicex = dx + 150;
			drawface(1);
		}

		function throwdice(){
			var sum;
			var ch = 1 + Math.floor(Math.random() * 6);
			sum = ch;
			dicex = dx;
			dicey = dy;
			drawface(ch);
			dicex = dx + 150;
			ch = 1 + Math.floor(Math.random() * 6);
			sum += ch;
			drawface(ch);

			var bank = Number(document.f.bank.value);
			if (bank < 10)
			{
				alert("돈이 떨어졌습니다! 추가 금액을 걸고 다시 시도하세요.");
				return;
			}
			bank = bank - 10;

			document.f.bank.value = String(bank);

			if (firstturn)
			{
				switch (sum)
				{
					case 7:
					case 11:
						document.f.outcome.value = "이겼습니다!";
						bank = Number(document.f.bank.value);
						bank += 10 * sum;
						document.f.bank.value = String(bank);
						break;
					case 2:
					case 3:
					case 12:
						document.f.outcome.value = "졌습니다!";
						break;
					default:
						point = sum;
						document.f.pv.value = point;
						firstturn = false;
						document.f.stage.value = "다시 던지세요.";
						document.f.outcome.value = " ";				
				}
			}
			else
			{
				switch (sum)
				{
				case point:
					document.f.outcome.value = "이겼습니다!";
					document.f.stage.value = "새로 시작.";
					document.f.pv.value = " ";
					bank = Number(document.f.bank.value);
					bank += 10 * sum;
					document.f.bank.value = String(bank);
					firstturn = true;
					break;
				case 2:
				case 3:
				case 12:
					document.f.outcome.value = "졌습니다!";
					document.f.stage.value = "새로 시작.";
					document.f.pv.value = " ";
					firstturn = true;
				}
			}
		}

		function drawface(n){
			ctx = document.getElementById("canvas").getContext('2d');
			ctx.lineWidth = 5;
			ctx.clearRect(dicex, dicey, dicewidth, diceheight);
			ctx.strokeRect(dicex, dicey, dicewidth, diceheight);
			ctx.fillStyle = "#009966";

			switch (n)
			{
			case 1:
				draw1();
				break;
			case 2:
				draw2();
				break;
			case 3:
				draw2();
				draw1();
				break;
			case 4:
				draw4();
				break;
			case 5:
				draw4();
				draw1();
				break;
			case 6:
				draw4();
				draw2mid();
				break;
			}
		}

		function draw1(){
			var dotx;
			var doty;
			ctx.beginPath();
			dotx = dicex + dicewidth/2;
			doty = dicey + diceheight/2;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.fill();
		}

		function draw2(){
			var dotx;
			var doty;
			ctx.beginPath();
			dotx = dicex + 3 * dotrad;
			doty = dicey + 3 * dotrad;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			dotx = dicex + dicewidth - 3 * dotrad;
			doty = dicey + diceheight - 3 * dotrad;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.fill();
		}

		function draw4(){
			var dotx;
			var doty;
			ctx.beginPath();
			dotx = dicex + 3 * dotrad;
			doty = dicey + 3 * dotrad;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			dotx = dicex + dicewidth - 3 * dotrad;
			doty = dicey + diceheight - 3 * dotrad;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.fill();
			ctx.beginPath();
			dotx = dicex + 3 * dotrad;
			doty = dicey + diceheight - 3 * dotrad;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			dotx = dicex + dicewidth - 3 * dotrad;
			doty = dicey + 3 * dotrad;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.fill();
		}

		function draw2mid(){
			var dotx;
			var doty;
			ctx.beginPath();
			dotx = dicex + 3 * dotrad;
			doty = dicey + 0.5 * diceheight;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			dotx = dicex + dicewidth - 3 * dotrad;
			doty = dicey + 0.5 * diceheight;
			ctx.arc(dotx, doty, dotrad, 0, Math.PI * 2, true);
			ctx.closePath();
			ctx.fill();
		}
	</script>
</head>

<body onLoad="initDice()">
<table border="0" width="1000">
		<tr height="2"></tr>
		<tr height="25">
			<td width="250"></td>
			<td width="500" bgcolor="F0FFF0"><font color="4169E1"><b>&nbsp;&nbsp;Craps Game</b></font></td>
			<td width="250"></td>
		</tr>
		<tr>
			<td width="300"></td>
			<td width="400" align="center">
				<canvas id="canvas" width="400" height="200"> 이 브라우저에서 HTML5의 canvas기능을 지원하지않습니다. </canvas> <br />
				<p align="right">
					<button onClick="throwdice();">주사위 던지기</button>
				</p>
				<form name="f" align="right">
					<table width="400">
						<tr>
							<td align="right" width="350">판 :</td>
							<td><input name="stage" value="첫 번째 던지기" readOnly /></td>
						</tr>
						<tr>
							<td align="right" width="350">위닝넘버 :</td>
							<td><input name="pv" value=" " readOnly /></td>
						</tr>
						<tr>
							<td align="right" width="350">결과 :</td>
							<td><input name="outcome" value=" " readOnly /></td>
						</tr>
						<tr>
							<td align="right" width="350">가진 돈 :</td>
							<td><input name="bank" value="100 " readOnly /></td>
						</tr>
					</table>
				</form></td>
			<td width="300"></td>
		</tr>
		<tr height="2"></tr>
		<tr height="25">
			<td width="250"></td>
			<td width="500" bgcolor="EEEEEE"><font color="364c76"><b>&nbsp;&nbsp;Play Rule</b></font></td>
			<td width="250"></td>
		</tr>
		<tr height="2"></tr>
		<tr height="25">
			<td width="250"></td>
			<td width="500" bgcolor="F0FFF0"><font color="4169E1">
				<br/><b>&nbsp;&nbsp;◇. 패배 조건</b><br/><br/>
				&nbsp;&nbsp;&nbsp;- 주사위 눈의 합이 <b>2, 3, 12</b> 이면 패배합니다.<br/><br/>
				<b>&nbsp;&nbsp;◇. 승리 조건</b><br/><br/>
				&nbsp;&nbsp;&nbsp;- 주사위 눈의 합이 <b>7, 11</b> 이면 승리합니다.<br/><br/>
				&nbsp;&nbsp;&nbsp;- 이외의 경우 첫 번째 던졌을 때 나온 합이 <b>위닝 넘버</b>가 됩니다.<br/><br/>
				&nbsp;&nbsp;&nbsp;- <b>위닝 넘버</b>가 정해지면 위닝 넘버가 나왔을 때만 승리합니다.<br/><br/>
			</font></td>
			<td width="250"></td>
		</tr>
</table>
</body>
