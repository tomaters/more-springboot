<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring security</title>
</head>
<body>
	<h3>Only for logged in members</h3>
	<form action="/logout" method="post">
		<sec:csrfInput />
		<p>
			principal :
			<sec:authentication property="principal" />
		</p>
		<p>
			Member :
			<sec:authentication property="principal.member" />
		</p>
		<p>
			Name :
			<sec:authentication property="principal.member.userName" />
		</p>
		<p>
			Username :
			<sec:authentication property="principal.username" />
		</p>
		<p>
			Authorization list :
			<sec:authentication property="principal.member.authList" />
		</p>
		<div>
			<a href="/">HOME</a>
		</div>
		<button>Log out</button>
	</form>
</body>
</html>