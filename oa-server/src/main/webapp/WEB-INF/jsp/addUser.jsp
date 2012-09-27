<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User JSP</title>
</head>
<body>
	<form action="${contextPath}/user/add" method="post">
		<table>
			<tr><td>用户名： <input type="text" name="username" maxlength="10"/></td></tr>
			<tr><td>密码： <input type="text" name="password" maxlength="36"/></td></tr>
			<tr><td>单位：<select name="orgUnit"><option>111</option></select></td></tr>
			<tr><td>描述：<textarea name="description" rows="3" cols="30"></textarea></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
</body>
</html>