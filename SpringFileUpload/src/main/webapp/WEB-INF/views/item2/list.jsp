<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload file</title>
</head>
<body>
	<h2>Item list</h2>
	<a href="register">Register item</a>
	<table border="1">
		<tr>
			<th align="center" width="80">Item ID</th>
			<th align="center" width="320">Name</th>
			<th align="center" width="100">Price</th>
			<th align="center" width="80">Edit</th>
			<th align="center" width="80">Remove</th>
		</tr>
		<c:forEach items="${item2List}" var="item2">
			<tr>
				<td align="center">${item2.itemId}</td>
				<td align="left">${item2.itemName}</td>
				<td align="right">${item2.price}</td>
				<td align="center"><a href="modify?itemId=${item2.itemId}">Edit</a></td>
				<td align="center"><a href="remove?itemId=${item2.itemId}">Remove</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>