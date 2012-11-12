<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>消息</title>
</head>
<body>
	<h2>消息</h2>
	<a href="${contextPath}/">返回主页</a><br>
	<table border="1">
		<thead>
		<tr>
			<td>消息</td>
			<td>消息创建时间</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="message" items="${messageList}">	
			<tr>
				<td>${message.messageContent}</td>
				<td>${message.createdAt}</td>
				<td><form action="${contextPath}/message/delete/${message.id}" method="POST"><input type="submit" value="删除" ></input></form></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>