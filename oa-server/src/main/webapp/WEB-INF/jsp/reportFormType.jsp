<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>报审表类型管理</title>
</head>
<body>

	<h2>报审表类型管理</h2>
	<a href="${contextPath}/">返回主页</a><br>
	<a href="${contextPath}/reportFormType/addReportFormType">新增报审表类型</a>
	<table border="1">
		<thead>
		<tr>
			<td>ID</td>
			<td>报审表名称</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="reportFormType" items="${reportFormTypeList}">	
			<tr>
				<td>${reportFormType.id}</td>
				<td>${reportFormType.name}</td>
				
				<td><form action="${contextPath}/reportFormType/delete/${reportFormType.id}" method="POST"><input type="submit" value="删除" onclick="return confirm('确认删除?(不推荐若存在报审表使用该类型，则无法删除)');" ></input></form></td>
				<td><form action="${contextPath}/reportFormType/editReportFormType/${reportFormType.id}" method="POST"><input type="submit" value="重设"></input></form></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>