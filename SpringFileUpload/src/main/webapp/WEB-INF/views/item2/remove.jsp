<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload multiple images</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("#item2");
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/item2/remove");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/item2/list";
		});
	});
</script>
</head>
<body>
	<h2>Delete item</h2>
	<form:form modelAttribute="item2" action="delete">
		<form:hidden path="itemId"/>
		<table>
			<tr>
				<td>Item name</td>
				<td><form:input path="itemName" disabled="true" /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><form:input path="price" disabled="true" /></td>
			</tr>
			<tr>
				<td>File 1</td>
				<td><img src="display?itemId=${item2.itemId}" width="210" height="240"></td>
			</tr>
			<tr>
				<td>File 2</td>
				<td><img src="display2?itemId=${item2.itemId}" width="210" height="240"></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:textarea path="description" disabled="true"/></td>
			</tr>
		</table>
	</form:form>
	<div>
		<button type="submit" id="btnRemove">Remove</button>
		<button type="submit" id="btnList">List</button>
	</div>
</body>
</html>