<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<title>添加报审表类型</title>
</head>
<body>
	<h2>添加报审表类型</h2>
	
	<form action="${contextPath}/reportFormType/add" method="post">
		<table>
			<tr><td>报审表类型名：<input type="text" name="name" maxlength="30"/></td></tr>
			<tr><td>需要回复该报审表的部门(Ctrl键+鼠标左键点击复选多个部门)：<select name="orgUnits" multiple="multiple" size="10"><c:forEach var="orgUnit" items="${orgUnitList}"><option value="${orgUnit.id}">${orgUnit.name}</option></c:forEach></select></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportForm">返回报审表类型管理</a>
</body>
</html>