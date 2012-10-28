<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<title>添加报审表名称</title>
</head>
<body>
	<h2>添加报审表名称</h2>
	
	<form action="${contextPath}/reportFormTitle/add" method="post">
		<table>
			<tr><td>名称： <input type="text" name="name" maxlength="20"/></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportFormTitle">返回报审表名称管理</a>
</body>
</html>