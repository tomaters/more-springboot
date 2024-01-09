<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring security</title>
</head>
<body>
	<a href="/notice/list">Notice list</a>	
	<form action="/logout" method="post">
		<sec:csrfInput/>
		<button>Log out</button>
	</form>
</body>
</html>