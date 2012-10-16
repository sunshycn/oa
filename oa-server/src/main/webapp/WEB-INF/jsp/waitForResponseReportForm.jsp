<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待回复的报审单</title>
</head>
<body>
	<h2>待回复的报审单</h2>
	<a href="${contextPath}/reportForm">返回报审单管理</a><br>
	<table border="1">
		<thead>
		<tr>
			<td>报审单编号</td>
			<td>报审单名称</td>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="waitForResponseReportForm" items="${waitForResponseReportFormList}">	
			<tr>
				<td>${waitForResponseReportForm.formId}</td>
				<td>${waitForResponseReportForm.title}</td>
				<td><form action="${contextPath}/reportForm/responseReportForm/${waitForResponseReportForm.id}" method="POST"><input type="submit" value="回复"></input></form></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>