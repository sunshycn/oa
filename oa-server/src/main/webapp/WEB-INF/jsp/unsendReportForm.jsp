<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>未发送报审单</title>
</head>
<body>
	<h2>未发送报审单</h2>
	<a href="${contextPath}/reportForm">返回报审单管理</a><br>
	<table border="1">
		<thead>
		<tr>
			<td>报审单编号</td>
			<td>报审单名称</td>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="unsendReportForm" items="${unsendReportFormList}">	
			<tr>
				<td>${unsendReportForm.formId}</td>
				<td>${unsendReportForm.title}</td>
				<td><form action="${contextPath}/reportForm/sendToOrgUnits/${unsendReportForm.id}" method="POST"><input type="submit" value="发送"></input></form></td>
				<td><form action="${contextPath}/reportForm/editUnsendReportForm/${unsendReportForm.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>