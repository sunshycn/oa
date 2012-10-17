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
	  <c:when test="${privilege == 'ADMIN' }">
		<a href="${contextPath}/orgUnit">单位管理</a><br/>
		<a href="${contextPath}/user">用户管理</a><br/>
	  </c:when>
	  <c:otherwise>
	  	<a href="${contextPath}/reportForm">报审表管理</a>
	  </c:otherwise>
	</c:choose>
	
	<form action="${contextPath}/logoff" method="post">
		<input type="submit" value="登出" />
	</form>
</body>
</html>