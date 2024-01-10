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
	<a href="/board/list">Board list</a>
	<a href="/notice/list">Notice list</a>
	<!-- if not logged in -->
	<sec:authorize access="isAnonymous()">
		<a href="/login">Log in</a>
	</sec:authorize>
	<!-- if logged in -->
	<sec:authorize access="isAuthenticated()">
		<a href="/logout">Log out</a>
	</sec:authorize>

</body>
</html>