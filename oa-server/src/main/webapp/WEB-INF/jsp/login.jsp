<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
</head>
<body>
	<h2>登陆</h2>
	
		<form action="${contextPath}/login" method="post">
		<table>
			<tr><td>用户名： <input type="text" name="username" maxlength="20"/></td></tr>
			<tr><td>密码： <input type="text" name="password" maxlength="20"/></td></tr>
			<tr><td><input type="submit" value="登陆" /></td></tr>
		</table>
		</form>
		<c:if test="${not empty flag}">
			<span style="color:red">登录失败</span>
		</c:if>
</body>
</html>