<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>
<style type="text/css">
#surface {
	font-family:monospace;
	font-size: 1.5em;
	border-collapse: collapse;
	border: 5px solid #F6DDFF;
 	background-image: url('/img/whale.png');/*url('/img/BackgroundFront.png'), url('/img/BackgroundBack.png'); */
	background-size: 100%;
	background-repeat: no-repeat;
	
}
#surface td {
     opacity: 0.4;
     
}

#startBtn{
	padding: 5px 10px;
	border : #F6DDFF;
	background-color: #F6DDFF;
}

#clearBtn{
	padding: 5px 10px;
	border : #F6DDFF;
	background-color: #F6DDFF;
}

section > table {
	float : left;
}
</style>
<script type="text/javascript">
function race(alpha) {
	console.log("exrace()..." + alpha)
	let speed = Math.random()*1000 +10;
	let direction = 0; // 0 : right, 1 : down 2 : left 3: up
	
	alpha.line = 1;
	alpha.column = 1;
	
	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;
	
	let tr 		= document.createElement('tr');
	let tdNo	= document.createElement('td');
	let tdAlpha = document.createElement('td');
	let tdCount	= document.createElement('td');
	
	tr.append(tdNo);
	tr.append(tdAlpha);
	tr.append(tdCount);
	
	stat.tBodies[0].append(tr);
	
	tdNo.align	  = 'right';
	tdAlpha.align = 'right';
	tdCount.align = 'right';
	
	tdNo.innerText = tr.parentElement.rows.length;
	tdAlpha.innerText 			= alpha.ch;
	tdAlpha.style.color 		= alpha.fg;
	tdAlpha.style.background 	= alpha.bg;
	
	tdCount.innerText = '0';
	
	setTimeout(function move() {
		
		let td = surface.rows[alpha.line-1].cells[alpha.column-1];
		td.style.color = 'black';
		td.style.background = 'black';
		
		switch(direction) {
			case 0:
					alpha.column++;
				if(alpha.line-1 === 0 && alpha.column-1 === 39) {
					direction = 1;
				}
				break;
			case 1:
					alpha.line++;
				if(alpha.line-1 === 19 && alpha.column-1 === 39) {
					direction = 2;
				}
				break;
			case 2:
				alpha.column--;
				if(alpha.line-1 === 19 && alpha.column-1 === 0) {
					direction = 3;
				}
				break;
			case 3:
				alpha.line--;
				if(alpha.line-1 === 0 && alpha.column-1 === 0) {
					direction = 0;
					tdCount.innerText = ++tdCount.innerText;
					roundCount.innerText = ++roundCount.innerText;
				}
				break;
		}
		console.log("After switch: direction = " + direction);
			
			td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
		
		
// 		switch(direction) {
// 		case 0:
// 			alpha.column++;
// 			break;
// 		case 1:
// 			alpha.line++;
// 			break;
// 		case 2:
// 			alpha.column--;
// 			break;
// 		case 3:
// 			alpha.line--;
// 			break;
// 		}
			
// 		if(alpha.line-1 === 0 && alpha.column-1 === 39) {
// 				direction = 1;
// 			}
// 		if(alpha.line-1 === 19 && alpha.column-1 === 39) {
// 				direction = 2;
// 			}
// 		if(alpha.line-1 === 19 && alpha.column-1 === 0) {
// 				direction = 3;
// 			}
// 		if(alpha.line-1 === 0 && alpha.column-1 === 0) {
// 				direction = 0;	
// 			}	
// 			td = surface.rows[alpha.line-1].cells[alpha.column-1];
// 			td.style.color = alpha.fg;
// 			td.style.background = alpha.bg;
// 			td.innerText = alpha.ch;	
		setTimeout(move, speed);
		
	}, 1000)
	
}	


window.onload = function() {
	
	startBtn.onclick = e => {
		
	
		count.innerText = ++count.innerText;
		fetch('/alpha/data')
		.then(response => response.json())
		.then(alpha =>  {
				race(alpha);
				
		if(count.innerText == 1)
			setInterval(() => {
				ellipse.innerText = ++ellipse.innerText	
			},1000)
		})
		
	}
}
</script>
</head>
<body>
<h1>Ajax fetch 활용</h1>
<hr>
<button id="startBtn" onclick="startBtn_click(event)">start</button>
<button id="clearBtn" onclick="clearBtn_click(event)">clear</button>
<hr>
<table border = "1" width = "400">
	<thead>
		<tr>
			<th>roundCount</th>
			<th>count</th>
			<th>ellipse</th>
		</tr> 
	</thead>
	<tbody>
		<tr>
			<td id="roundCount" align="right">0</td>
			<td id="count" align="right">0</td>
			<td id="ellipse" align="right">0</td>
		</tr>
	</tbody>
</table>
<hr>
<section>
<!-- <div style="width: 40%; float: left;"> -->
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();"> <!-- 자식에서발생된것이 조상까지올라가는것을 이벤트 버블링이라한다 -->
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
			<c:set var="alpha" value="${surface[i][j]}"/>
			<td  style="color:black; background: black;">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
<!-- </div> -->
<!-- <div style="width: 60%; float: left;"> -->
<table id="stat" border ="1" width="200">
	<thead>
		<tr>
			<th>no</th>
			<th>Alpha</th>
			<th>roundCount</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<!-- </div> -->
</section>
</body>
</html>