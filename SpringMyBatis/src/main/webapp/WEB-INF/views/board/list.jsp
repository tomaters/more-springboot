<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBatis</title>
</head>
<body>
	<h2>Board</h2>
	<a href="register">New</a>
	<table border="1">
		<tr>
			<th align="center" width="80">NO</th>
			<th align="center" width="320">TITLE</th>
			<th align="center" width="100">WRITER</th>
			<th align="center" width="180">REGDATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">The list is empty</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="board">
					<tr>
						<td align="center">${board.boardNo}</td>
						<td align="left"><a
							href='/board/read?boardNo=${board.boardNo}'>${board.title}</a></td>
						<td align="right">${board.writer}</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${board.regDate}" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>