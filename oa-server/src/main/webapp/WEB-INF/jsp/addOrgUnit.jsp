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
	<form action="${contextPath}/user/add" method="post">
		<table>
			<tr><td>单位名： <input type="text" name="name" maxlength="20"/></td></tr>
			<tr><td>上级单位：<select name="orgUnit"><option></option></select></td></tr>
			<tr><td>描述：<textarea name="description" rows="3" cols="30"></textarea></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
</body>
</html>