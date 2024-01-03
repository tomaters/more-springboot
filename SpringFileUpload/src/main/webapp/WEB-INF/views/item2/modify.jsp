<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload multiple files</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("#item2");
		$("#btnModify").on("click", function() {
			formObj.attr("action", "/item2/modify");
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
	<h2>Edit item</h2>
	<form:form modelAttribute="item2" action="modify"
		enctype="multipart/form-data">
		<form:hidden path="itemId" />
		<form:hidden path="pictureUrl" />
		<form:hidden path="pictureUrl2" />
		<table>
			<tr>
				<td>Item name</td>
				<td><form:input path="itemName" /></td>
				<td><font color="red"><form:errors path="itemName" /></font></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><form:input path="price" />&nbsp;원</td>
				<td><font color="red"><form:errors path="price" /></font></td>
			</tr>
			<tr>
				<td>File 1</td>
				<td><img src="display?itemId=${item2.itemId}" width="210" height="240"></td>
			</tr>
			<tr>
				<td>File 2</td>
				<td><input type="file" name="pictures" /></td>
				<td></td>
			</tr>
			<tr>
				<td>File</td>
				<td><img src="display2?itemId=${item2.itemId}" width="210" height="240"></td>
			</tr>
			<tr>
				<td>Files</td>
				<td><input type="file" name="pictures" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:textarea path="description" /></td>
				<td><font color="red"><form:errors path="description" /></font></td>
			</tr>
		</table>
	</form:form>
	<div>
		<button type="submit" id="btnModify">Modify</button>
		<button type="submit" id="btnList">List</button>
	</div>
</body>
</html>