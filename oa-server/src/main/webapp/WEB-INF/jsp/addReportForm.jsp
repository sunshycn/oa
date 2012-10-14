<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建报审表</title>
</head>
<body>
	<h2>新建报审表</h2>
	
	<form action="${contextPath}/reportForm/add" method="post">
		<table>
			<tr><td>选择报审表类型：<select name="reportFormTypeId"><c:forEach var="reportFormType" items="${reportFormTypeList}"><option value="${reportFormType.id}">${reportFormType.name}</option></c:forEach></select></td></tr>
			<tr><td><input type="submit" value="发送" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/">返回首页</a>
</body>
</html>