<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css" />
		<meta charset="UTF-8">
		<title>单位管理</title>
	</head>
	<body>
		<h2>单位管理</h2>
		<a href="${contextPath}/">返回主页</a><br>
		<a href="${contextPath}/orgUnit/addOrgUnit">新增单位</a>
		<table border="1">
			<thead>
			<tr>
				<td>ID</td>
				<td>单位名</td>
				<td>描述</td>
				<td colspan="2">操作</td>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="orgUnit" items="${orgUnitPage.content}">	
					<tr>
						<td>${orgUnit.id}</td>
						<td>${orgUnit.name}</td>
						<td>${orgUnit.description}</td>
						<td><form action="${contextPath}/orgUnit/delete/${orgUnit.id}" method="POST"><input type="submit" value="删除" onclick="return confirm('确认删除');"></input></form></td>
						<td><form action="${contextPath}/orgUnit/editOrgUnit/${orgUnit.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<c:set var="paginationPreUrl" value="${contextPath}/orgUnit/" scope="request"/>
						<jsp:include page="${jspRootPath}/include/paginationBar.jsp"/>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>