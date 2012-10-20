<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
</head>
<body>
	
	<h2>修改密码</h2>
	<a href="${contextPath}/">返回首页</a><br/>
	<form action="${contextPath}/user/changePassword" method="post">
		<table>
			
			<tr><td>旧密码： <input type="password" name="oldPassword" maxlength="36"/></td></tr>
			<tr><td>新密码： <input type="password" name="newPassword" maxlength="36"/></td></tr>
			<tr><td>重复密码： <input type="password" name="repeatPassword" maxlength="36"/></td></tr>

			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
		<br/>
		<span style="color:red">${errorMessage}</span>

</body>
</html>