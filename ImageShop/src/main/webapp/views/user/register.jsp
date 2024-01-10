<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- HEADER AREA -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- MENU AREA -->
	<%@ include file="/views/common/menu.jsp"%>

	<h2>
		<spring:message code="user.header.register" />
	</h2>

	<form:form modelAttribute="member" action="register" method="post">
		<table>
			<tr>
				<td><spring:message code="user.userId" /></td>
				<td><form:input path="userId" /></td>
				<td><font color="red"><form:errors path="userId" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userPw" /></td>
				<td><form:input path="userPw" /></td>
				<td><font color="red"> <form:errors path="userPw" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userName" /></td>
				<td><form:input path="userName" /></td>
				<td><font color="red"><form:errors path="userName" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.job" /></td>
				<td><form:select path="job" items="${jobList}"
						itemValue="value" itemLabel="label" /></td>
				<td><font color="red"><form:errors path="job" /></font></td>
			</tr>
		</table>
	</form:form>

	<div>
		<button type="submit" id="btnRegister">
			<spring:message code="action.register" />
		</button>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</sec:authorize>
	</div>
	<hr>
	<!-- FOOTER AREA -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {
		var formObj = $("#member");
		$("#btnRegister").on("click", function() { 
			formObj.submit();
		});
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			$("#btnList").on("click", function() { 
				self.location = "list";
			});
		</sec:authorize>
	});
</script>
</html>