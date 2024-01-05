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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
		<spring:message code="codeDetail.header.list" />
	</h2>
	<a href="register"><spring:message code="action.new" /></a>
	<table border="1">
		<tr>
			<th align="center" width="160"><spring:message code="codeDetail.groupCode" /></th>
			<th align="center" width="160"><spring:message code="codeDetail.codeValue" /></th>
			<th align="center" width="160"><spring:message code="codeDetail.codeName" /></th>
			<th align="center" width="160"><spring:message code="codeDetail.sortSeq" /></th>
			<th align="center" width="180"><spring:message code="codeDetail.regdate" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="codeDetail">
					<tr>
						<td align="center">${codeDetail.groupCode}</td>
						<td align="center">${codeDetail.codeValue}</td>
						<td align="left">
						<a href="/codeDetail/read?groupCode=${codeDetail.groupCode}&codeValue=${codeDetail.codeValue}">${codeDetail.codeName}</a></td>
						<td align="center">${codeDetail.sortSeq}</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${codeDetail.regDate}" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	<!-- FOOTER AREA -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
</html>