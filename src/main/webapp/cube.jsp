<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cube.jsp</title>
<style type="text/css">

.perspective {
/* 	border: 10px solid green; */
 	display: inline-block;
	margin: 300px 0px 50px 100px;
	margin-left : 40%;
	
	perspective: 500px;
}

.cube {
/* 	border: 10px solid blue; */
 	display: inline-block;
	
   	transform-style: preserve-3d;

/* 	transform: rotateX(45deg); */
	animation: rotate 10s infinite linear;
}

.base {
/* 	border:10px solid red; */
	width: 400px;
	height: 400px;
	font-size: 1em;
	text-align: center;
	line-height: 200px;
}

.front, .back, .left, .right, .top, .bottom {
	position: absolute;
	top: 0px;
	left: 0px;
	
	opacity: 0.5;
	box-shadow: 0px 0px 10px 5px plum;
}

.front {
	transform: translateZ(200px);
	background: #FFB6C1;
}

.back {
	transform: rotateY(180deg) translateZ(200px);
	background: #87CEFA;
}

.left {
	transform: rotateY(-90deg) translateZ(200px);
	background: lime;
}

.right {
	transform: rotateY(90deg) translateZ(200px);
	background: #EE82EE;
}

.top {
	transform: rotateX(90deg) translateZ(200px);
	background: yellow;
}

.bottom {
	transform: rotateX(-90deg) translateZ(200px);
	background: orange;
}

@keyframes rotate {
	from {
		transform: rotateX(0deg) rotateY(360deg) rotateZ(0deg);
	}
	to {
		transform: rotateX(360deg) rotateY(0deg) rotateZ(360deg);
	}
}

body {
	margin : 100px auto;
	width : 1000px;
	height: 1000px;
}

h1 {
	text-align : center;
	color: white;
}

</style>
</head>
<body>
<h1>CSS 3D 응용 큐브 만들기</h1>
<hr>
<section class="perspective">
	<article class="cube">
		<div class="base"> </div>
		<div class="base front"> </div>
		<div class="base back"> </div>
		<div class="base left"> </div>
		<div class="base right"> </div>
		<div class="base top"> </div>
		<div class="base bottom"> </div>
	</article>
</section>
</body>
</html>