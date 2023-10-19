<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link rel="icon" type="image/png" href="favicon.png"/>
<link rel="stylesheet" href="/css/cube.css">
<style type="text/css">

/*
nav {
	border: 1px solid black;
}

ul {
	border: 1px solid red;
}

ol {
	border: 1px solid blue;
}

li {
	border: 1px solid orange;
}

li > div, li > a {
	border: 5px solid purple;
}
*/
.menu {
	display: flex;
	list-style: none;
	color:	#9D71BD;
	align-items: flex-start;
	
	width:90%;
	position: fixed;
	top: 0px;
	left: 0px;
	text-align: center;
}

.menu-logo {
	width: 100px;
/* 	padding : 0px 20px;  */
	flex-shrink: 0;  /*화면을 줄여도 flex를 줄이지 않는다*/
}

.menu-item {
	width: 200px;
	height : auto;
	flex-shrink: 0;  /*화면을 줄여도 flex를 줄이지 않는다*/
	background : #ddddff;
}

.menu-item:hover > .menu-title {
	text-shadow:  10px 10px 5px silver;
}

.menu-item:hover > .sub-menu {
	max-height: 300px;
	
	transition : max-height 1s;
}

.menu-item:last-child {
	margin-left : auto;
	margin-right: 10px;
}

.menu-title {
	padding: 10px;
	font-size: 15pt;
}

.menu-maintitle {
	padding: 10px;
	font-size: 15pt;
}

.menu-maintitle > a {
	color: #9D71BD;
	text-decoration: none;
}

.menu-title:hover + .sub-menu {
	display: block;
}

.sub-menu {
	max-height : 0px;
	overflow : hidden;
	list-style: none;
	padding-left: 0px;
}

.sub-menu-item {
	
}

.sub-menu-item > a {
	display: block;
	padding: 10px;
	font-size: 12pt;
	text-decoration: none;
	color: gray;
}

.sub-menu-item:hover > a {
	background: #9D71BD;
	color: white;
}

iframe {
	margin-top : 100px;
}

body {
	background-image: url("/img/pastell.jpg");
	background-size: 100%;
}
</style>
<script type="text/javascript">

function resize() {
	let iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
}

window.onload = function() {
	
	setInterval(resize, 100);
	
}

</script>
</head>
<body>
<nav>
<ul class="menu">
	<li class="menu-logo">
		<section class="perspective">
		<article class="cube">
		<div class="base">Juno</div>
		<div class="base front"></div>
		<div class="base back"></div>
		<div class="base left"></div>
		<div class="base right"></div>
		<div class="base top"></div>
		<div class="base bottom"></div>
		</article>
		</section>
	</li>
	<li class="menu-item">
		<div class="menu-title">Alpha</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Animation</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/cube.jsp">cube</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="jquery_attr.jsp">placehorder</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">React</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/fill.jsp">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/sort.jsp">sort</a></li>
			<li class="sub-menu-item"><a target="content" href="/move.jsp">move</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Employee</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
			<li class="sub-menu-item"><a target="content" href="/salgrade/list">salgrade</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">City</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
			<li class="sub-menu-item"><a target="content" href="/language/list">language</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Aws</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/aws.jsp">aws</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-maintitle"><a target="content" href="main.jsp">Main</a></div>
	</li>
	<li class="menu-item">
	 <div  class="menu-title">Login</div>
	</li>
</ul>
</nav>

<iframe src="main.jsp" 
		name="content"
		width="100%"
		scrolling ="no"
		frameborder='0'
		sendbox="allow-same-origin"
		onload="resize()">
iframe 태그를 지원하지 않는 브라우저는 이 글이 보입니다.
</iframe>
</body>
</html>