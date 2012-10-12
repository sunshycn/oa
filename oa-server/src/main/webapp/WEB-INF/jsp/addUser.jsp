<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
</head>
<body>
	<h2>添加用户</h2>

	<form action="${contextPath}/user/add" method="post">
		<table>
			<tr><td>用户名： <input type="text" name="username" maxlength="10"/></td></tr>
			<tr><td>密码： <input type="text" name="password" maxlength="36"/></td></tr>
			<tr><td>单位：<select name="orgUnitId"><option></option><c:forEach var="orgUnit" items="${orgUnitList}"><option value="${orgUnit.id}">${orgUnit.name}</option></c:forEach></select>
			<tr><td>描述：<textarea name="description" rows="3" cols="30"></textarea></td></tr>
			<tr><td>权限：<select name="privilege">
			<option value="普通">普通</option>
			<option value="部门">部门</option>
			<option value="一般领导">一般领导</option>
			<option value="主要领导">主要领导</option>
			<option value="办公室">办公室</option>
			<option value="管理员">管理员</option>
			</select></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/user">返回用户管理</a>
</body>
</html>