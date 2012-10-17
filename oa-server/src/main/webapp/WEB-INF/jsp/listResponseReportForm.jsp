<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${responseType =='sentToOrgUnitsReportForm' }">待回复的报审单</c:when>
		<c:when test="${responseType =='gotReplyFromUnitsReportForm' }">可发送给分管领导的报审表</c:when>
		<c:when test="${responseType =='sentToLeader1ReportForm' }">需要分管领导批复的报审表</c:when>
		<c:when test="${responseType =='sentToLeader2ReportForm' }">需要主要领导批复的报审表</c:when>
		<c:when test="${responseType =='sentToOfficeReportForm' }">发送到办公室的报审表</c:when>
		<c:otherwise>?</c:otherwise>
	</c:choose>
</title>
</head>
<body>
	<h2>
		<c:choose>
			<c:when test="${responseType =='sentToOrgUnitsReportForm' }">待回复的报审单</c:when>
			<c:when test="${responseType =='gotReplyFromUnitsReportForm' }">可发送给分管领导的报审表</c:when>
			<c:when test="${responseType =='sentToLeader1ReportForm' }">需要分管领导批复的报审表</c:when>
			<c:when test="${responseType =='sentToLeader2ReportForm' }">需要主要领导批复的报审表</c:when>
			<c:when test="${responseType =='sentToOfficeReportForm' }">发送到办公室的报审表</c:when>
			<c:otherwise>?</c:otherwise>
		</c:choose>
	</h2>
	<a href="${contextPath}/reportForm">返回报审单管理</a><br>
	<table border="1">
		<thead>
		<tr>
			<td>报审单编号</td>
			<td>报审单名称</td>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="responseReportForm" items="${responseReportFormList}">	
			<tr>
				<td>${responseReportForm.formId}</td>
				<td>${responseReportForm.title}</td>
				<td>
				<form action="${contextPath}/reportForm/responseReportForm/${responseReportForm.id}" method="POST">
					<input type="submit" value="回复"></input>
					<input type="hidden" name="responseType" value="${responseType}">
				</form>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>