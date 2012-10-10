<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>单位管理</title>
</head>
<body>
	<h2>单位管理</h2>
	<a href="${contextPath}/orgUnit/addOrgUnit">新增单位</a>
	<table border="1">
		<thead>
		<tr>
			<td>ID</td>
			<td>单位名</td>
			<td>描述</td>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="orgUnit" items="${orgUnitList}">	
			<tr>
				<td>${orgUnit.id}</td>
				<td>${orgUnit.name}</td>
				<td>${orgUnit.description}</td>
				<td><form action="${contextPath}/orgUnit/delete/${orgUnit.id}" method="POST"><input type="submit" value="删除"></input></form></td>
				<td><form action="${contextPath}/orgUnit/editOrgUnit/${orgUnit.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>