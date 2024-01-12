<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- HEADER AREA -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- MENU AREA -->
	<%@ include file="/views/common/menu.jsp"%>
	<div align="center">
		<h2><spring:message code="auth.header.logout" /></h2>
	
		<form action="/logout" method="post">
			<sec:csrfInput />
			<button><spring:message code="action.logout" /></button>
		</form>

	</div>
	<hr>
	<!-- FOOTER AREA -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>