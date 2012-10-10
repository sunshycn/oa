<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<title>添加单位</title>
</head>
<body>
	<h2>添加单位</h2>
	
	<form action="${contextPath}/orgUnit/edit" method="post">
		<table>
			<tr><td>ID: ${orgUnit.id}<input type="hidden" name="id" value="${orgUnit.id}"></td></tr>
			<tr><td>单位名： <input type="text" name="name" maxlength="20" value="${orgUnit.name}"/></td></tr>
			<tr><td>上级单位：<select name="parentId"><option value="${orgUnit.parentId}">null</option></select></td></tr>
			<tr><td>描述：<textarea name="description" rows="3" cols="30">${orgUnit.description}</textarea></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/orgUnit">返回单位管理</a>
</body>
</html>