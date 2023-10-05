<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill.jsp</title>
<style type="text/css">
#surface {
	font-family : monospace;
	font-size : 15pt;
	text-align : center;
	border-collapse: collapse;
	border-top: 15px solid cyan;
	background: url('/media/slime.png');
}

#surface td {
	opacity: 1;
	position: relative;
	
	top : 0px;
	left : 0px;
	
	transition : left 3s 500ms, transform 4s;
}
</style>

<script type="text/javascript">
function startBtn_click(e) {
	console.log("start")
	start.disabled = true;// start버튼을 클릭시 더이상 클릭이 되지 않도록 비활성화
	clear.disabled = true;
	
	let timer = setInterval(() => {
		seconds.innerText = ++seconds.innerText
	}, 1000)// start버튼을 클릭하게되면 seconds의 숫자가 1초씩 증가
	
	let tid = setInterval(() => {
		forCount.innerText = ++forCount.innerText;//Interval이 실행 될 때마다 forcount가 증가하면서 테이블에 있는 forcount의 수가 증가함
		if(count.innerText == 800) {
			clearInterval(tid);
			clearInterval(timer);
			start.disabled = false;
			clear.disabled = false;
			
			Array.from(surface.rows).forEach(function(row) {
				Array.from(row.cells).forEach(function(td) {
				    td.style.left='0px';
				})
			})
			return;
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/ani/data')
		xhr.responseType = 'json';
		
		xhr.onload = e => {
			let alpha = xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if(td.style.color =='black' && td.style.background=='black') {
				count.innerText = ++count.innerText;
				
// 				setTimeout(() => td.style.left = "700px", 1000);
				td.style.left = "700px"
				td.style.transform = `rotate(\${360*50}deg)`;
			}
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
		}
		xhr.send();
	}, 15);
}

function clearBtn_click(e) {
	console.log("clear")
	forCount.innerText = 0;
	count.innerText = 0;
	seconds.innerText = 0;
	
// 	for(let i=0; i<surface.rows.length; i++) {
// 		for(let j=0; j<surface.rows[i].cells.length; j++) {
// 			surface.rows[i].cells[j].style.color = 'black';
// 			surface.rows[i].cells[j].style.background = 'black';
// 		}
// 	}
	
	Array.from(surface.rows).forEach(function(row){
		Array.from(row.cells).forEach(function(td) {
			td.style.color = 'black';
			td.style.background = 'black';
		})
	})
}

</script>
</head>
<body>
<h1>Transition / Position </h1>
<hr>
<button id="start" onclick="startBtn_click(event)">start</button>
<button id="clear" onclick="clearBtn_click(event)">clear</button>
<hr>
<table border="1" width="480px">
	<thead>
		<tr>
			<th>forCount</th><th>Count</th><th>seconds</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td id="forCount" align="right">0</td>
			<td id="count" align="right">0</td>
			<td id="seconds" align="right">0</td>		
		</tr>
	</tbody>
</table>
<hr>
<table id="surface" onmousedown = event.preventDefault();>
	<tbody>
	<c:forEach var="row" items="${surface}"> <!--row는 1차원배열이다-->
		<tr>
		<c:forEach var="alpha" items="${row}">
			<td style="color:${alpha.fg};  background: ${alpha.bg};">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
<hr>
</body>
</html>