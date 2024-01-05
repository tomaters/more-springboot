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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <!-- HEADER AREA -->
    <%@ include file="/views/common/header.jsp"%>
    <!-- MENU AREA -->
    <%@ include file="/views/common/menu.jsp"%>
    <!-- MAIN -->
    <form:form modelAttribute="codeGroup" action="modify">
    	<table>
    		<tr>
    			<td><spring:message code="codeGroup.groupCode"/></td>
    			<td><form:input path="groupCode"/></td>
    			<td><font color="red"><form:errors path="groupCode"/></font></td>
    		</tr>
    		<tr>
    			<td><spring:message code="codeGroup.groupName"/></td>
    			<td><form:input path="groupName"/></td>
    			<td><font color="red"><form:errors path="groupName"/></font></td>
    		</tr>
    	</table>
    </form:form>
    <div>
		<button type="submit" id="btnModify"><spring:message code="action.modify" /></button>
		<button type="submit" id="btnList"><spring:message code="action.list"/></button>
	</div> <hr>
    <!-- FOOTER AREA -->
    <%@ include file="/views/common/footer.jsp"%>
</body>
<script>
	$(document).ready(function() {
		var formObj = $("#codeGroup");
		$("#btnModify").on("click", function() { 
			formObj.submit();
		});
		$("#btnList").on("click", function() { 
			self.location = "list";
		});
	});
</script>
</html>