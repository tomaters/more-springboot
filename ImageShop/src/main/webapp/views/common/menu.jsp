<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div align="center">
	<table>
		<tr>
			<td width="80"><a href="/">
			<spring:message	code="header.home" /></a></td>
			<td width="120"><a href="/codeGroup/list">
			<spring:message	code="menu.codeGroup.list" /></a></td>
			<td width="120"><a href="/codeDetail/list">
			<spring:message	code="menu.codeDetail.list" /></a></td>
			<td width="120"><a href="/codeDetail/register">
			<spring:message	code="menu.codeDetail.register"/></a></td>
		</tr>
	</table>
</div>
<hr>