<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
</head>
<body>
	<h2>主页</h2>
	
	<c:choose>
	  <c:when test="${currentUser.privilege == 'ADMIN' }">
		<a href="${contextPath}/orgUnit">单位管理</a><br/>
		<a href="${contextPath}/user">用户管理</a><br/>
		<a href="${contextPath}/reportFormType">报审表类型管理</a><br/>
		<a href="${contextPath}/reportFormTitle">报审表名称管理</a><br/>
	  </c:when>
	  <c:otherwise>
	  	<a href="${contextPath}/reportForm">报审表管理</a><br/>
	  </c:otherwise>
	</c:choose>
	<a href="${contextPath}/query">查询报审表</a><br/>
	<a href="${contextPath}/account/changePasswordPage">修改密码</a><br/>
	<form action="${contextPath}/account/logoff" method="post">
		<input type="submit" value="登出" />
	</form>
</body>
</html>