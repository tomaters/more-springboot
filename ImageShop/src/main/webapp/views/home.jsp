<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="/views/common/header.jsp" %>
	<!-- menu -->
	<%@ include file="/views/common/menu.jsp" %>
	<!-- MAIN -->
	<div class="container-fluid p-3">
	<h1>
		<spring:message code="common.homeWelcome" />
	</h1>
	<p>${serverTime}</p>
	</div>
	<hr>
	<!-- FOOTER -->
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>