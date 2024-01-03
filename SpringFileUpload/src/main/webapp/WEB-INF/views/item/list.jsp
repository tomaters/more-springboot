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
<c:forEach items="${itemList}" var="item">
<tr>
<td align="center">${item.itemId}</td>
<td align="left">${item.itemName}</td>
<td align="right">${item.price}</td>
<td align="center"><a
href="modify?itemId=${item.itemId}">Edit</a></td>
<td align="center"><a
href="remove?itemId=${item.itemId}">Remove</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>