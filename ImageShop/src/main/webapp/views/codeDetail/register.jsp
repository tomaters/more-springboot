<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- HEADER AREA -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- MENU AREA -->
	<%@ include file="/views/common/menu.jsp"%>
	<!-- MAIN -->
	<h2>
		<spring:message code="codeDetail.header.register" />
	</h2>
	<form:form modelAttribute="codeDetail" action="/codeDetail/register">
		<table>
			<tr>
				<td><spring:message code="codeDetail.groupCode" /></td>
				<td><form:select path="groupCode" items="${groupCodeList}"
						itemValue="value" itemLabel="label" /></td>
				<td><font color="red"><form:errors path="groupCode" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="codeDetail.codeValue" /></td>
				<td><form:input path="codeValue" /></td>
				<td><font color="red"><form:errors path="codeValue" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="codeDetail.codeName" /></td>
				<td><form:input path="codeName" /></td>
				<td><font color="red"><form:errors path="codeName" /></font></td>
			</tr>
		</table>
	</form:form>
	<div>
		<button type="submit" id="btnRegister">
			<spring:message code="action.register" />
		</button>
		<button type="submit" id="btnList">
			<spring:message code="action.list" />
		</button>
	</div>

	<hr>
	<!-- FOOTER AREA -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {
		var formObj = $("#codeDetail");
		$("#btnRegister").on("click", function() { 
			formObj.submit();
		});
		$("#btnList").on("click", function() { 
			self.location = "/codeDetail/list";
		});
	});
</script>
</html>