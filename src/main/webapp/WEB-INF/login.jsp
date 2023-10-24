<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style type="text/css">
section {
	width: 50%;
	margin : auto;
}

fieldset {
	margin: 10px;
}

input {
	padding : 0.5em;
}

.error {
	font-size: 1em;
	color : red;
	padding: 0.5em
}

#id, #pw {
	border-width : 0 0 1px 0;
	outline:none 
}
</style>
</head>
<body>
<section>
	<h1>Login</h1>
	<hr>
	<c:if test="${param.error == ''}">
		<div class="error">사용자 Id 또는 Password를 확인해 주세요</div>
	</c:if>
	<form action="/login" method = "post">
		<fieldset >
			<legend><label for="id">ID</label></legend>
			<input id="id" name="username"/>
		</fieldset>
		<fieldset>
			<legend><label for="pw">PASSWORD</label></legend>
			<input id="pw" type="password" name="password"/>
		</fieldset>
		<fieldset>
			<input type="submit" value="로그인">
		</fieldset>
	</form>
</section>
</body>
</html>