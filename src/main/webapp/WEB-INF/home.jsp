<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>submenu5.jsp</title>
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
	color:maroon;
	align-items: flex-start;
	
	width:90%;
	position: fixed;
	top: 10px;
	left: 10px;
}

.menu-logo {
	width: 100px;
/* 	padding : 0px 20px;  */
	flex-shrink: 0;  /*화면을 줄여도 flex를 줄이지 않는다*/
}

.menu-item {
	width: 150px; 
	flex-shrink: 0;  /*화면을 줄여도 flex를 줄이지 않는다*/
	background : teal;
}

.menu-item:hover > .menu-title {
	text-shadow:  10px 10px 5px red;
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
	color: black;
}

.sub-menu-item:hover > a {
	background: orange;
	color: green;
}

iframe {
	margin-top : 100px;
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
<hr>
<nav>
<ul class="menu">
	<li class="menu-logo">
		<section class="perspective">
		<article class="cube">
		<div class="base">Base</div>
		<div class="base front">Front</div>
		<div class="base back">Back</div>
		<div class="base left">Left</div>
		<div class="base right">Right</div>
		<div class="base top">Top</div>
		<div class="base bottom">Bottom</div>
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
			<li class="sub-menu-item"><a target="content" href="/ani/cube">cube</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/cross">cross</a></li>
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
			<li class="sub-menu-item"><a target="content" href="/people/list">people</a></li>
			<li class="sub-menu-item"><a target="content" href="/list/list">list</a></li>
		</ol>
	</li>
	<li class="menu-item">
	 <div  class="menu-title">Login</div>
	</li>
</ul>
</nav>

<iframe src="/alpha/fill" 
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