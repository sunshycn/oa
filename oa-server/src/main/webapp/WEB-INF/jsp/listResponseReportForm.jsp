<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${reportFormStatusLink =='notSendReportForm'}">未发送报审单</c:when>
		<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">待回复的报审单</c:when>
		<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">各科室回复完毕的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
		<c:when test="${reportFormStatusLink =='passedReportForm'}">发送回报审单位的报审表</c:when>
		<c:otherwise>?</c:otherwise>
	</c:choose>
</title>
</head>
<body>
	<h2>
		<c:choose>
			<c:when test="${reportFormStatusLink =='notSendReportForm'}">未发送报审单</c:when>
			<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">待回复的报审单</c:when>
			<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">各科室回复完毕的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
			<c:when test="${reportFormStatusLink =='passedReportForm'}">发送回报审单位的报审表</c:when>
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
		<c:forEach var="reportForm" items="${reportFormList}">	
			<tr>
				<td>${reportForm.formId}</td>
				<td>${reportForm.title}</td>
					<c:choose>
						<c:when test="${reportFormStatusLink =='notSendReportForm'}">
							<td><form action="${contextPath}/reportForm/sendToOrgUnits/${reportForm.id}" method="POST"><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form></td>
							<td><form action="${contextPath}/reportForm/editUnsendReportForm/${reportForm.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm' || reportFormStatusLink =='sentToLeader1ReportForm' || reportFormStatusLink =='sentToLeader2ReportForm' || reportFormStatusLink =='sentToOfficeReportForm'}">
							<td><form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST"><input type="submit" value="回复"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">
							<td><form action="${contextPath}/reportForm/reviewReportForm/${reportForm.id}" method="POST"><input type="submit" value="查看"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='passedReportForm'}">
							<td><form action="${contextPath}/reportForm/printReportForm/${reportForm.id}" method="POST"><input type="submit" value="打印"></input></form></td>
						</c:when>
						<c:otherwise>?</c:otherwise>
					</c:choose>				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br/>
	<c:choose>
		<c:when test="${warningMsg =='oneDayDelay'}">
			<span style="color:orange">存在自发送以来已经过一天而未处理的报审单</span>
		</c:when>
		<c:when test="${warningMsg =='twoDaysDelay'}">
			<span style="color:red">存在自发送以来已经过两天而未处理的报审单！请尽快处理</span>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>

</body>
</html>