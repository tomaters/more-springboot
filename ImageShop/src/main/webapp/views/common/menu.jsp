<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div align="center" class="container-fluid">
	<div class="d-flex flex-row justify-content-between">
		<div></div>
		<div class="d-flex flex-row justify-content-evenly p-3">
			<div>
				<a href="/" class="btn btn-light btn-outline-secondary text-dark">
				<spring:message	code="header.home" /></a>
			</div>
			<div>
				<a href="/codeGroup/list" class="btn btn-light btn-outline-secondary text-dark">
				<spring:message	code="menu.codeGroup.list" /></a>
			</div>
			<div>
				<a href="/codeDetail/list" class="btn btn-light btn-outline-secondary text-dark">
				<spring:message	code="menu.codeDetail.list" /></a>
			</div>
			<div>
				<a href="/codeDetail/register" class="btn btn-light btn-outline-secondary text-dark">
				<spring:message	code="menu.codeDetail.register"/></a>
			</div>
			<div>
				<a href="/user/list" class="btn btn-light btn-outline-secondary text-dark">
				<spring:message code="menu.user.admin"/></a>
			</div>
		</div>
	</div>
</div>
<hr>