<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${reportFormStatus =='notSendReportForm'}">未发送报审单</c:when>
		<c:when test="${reportFormStatus =='sentToOrgUnitsReportForm'}">待回复的报审单</c:when>
		<c:when test="${reportFormStatus =='gotReplyFromUnitsReportForm'}">可发送给分管领导的报审表</c:when>
		<c:when test="${reportFormStatus =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
		<c:when test="${reportFormStatus =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
		<c:when test="${reportFormStatus =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
		<c:when test="${reportFormStatus =='passedReportForm'}">发送回报审单位的报审表</c:when>
		<c:when test="${reportFormStatus =='deniedReportForm'}">被否决的报审表</c:when>
		<c:otherwise>?</c:otherwise>
	</c:choose>
</title>
</head>
<body>
	<h2>
		<c:choose>
			<c:when test="${reportFormStatus =='notSendReportForm'}">未发送报审单</c:when>
			<c:when test="${reportFormStatus =='sentToOrgUnitsReportForm'}">待回复的报审单</c:when>
			<c:when test="${reportFormStatus =='gotReplyFromUnitsReportForm'}">可发送给分管领导的报审表</c:when>
			<c:when test="${reportFormStatus =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
			<c:when test="${reportFormStatus =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
			<c:when test="${reportFormStatus =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
			<c:when test="${reportFormStatus =='passedReportForm'}">发送回报审单位的报审表</c:when>
			<c:when test="${reportFormStatus =='deniedReportForm'}">被否决的报审表</c:when>
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
				<td>
				<form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST">
					<input type="submit" value="回复"></input>
				</form>
					<c:choose>
						<c:when test="${reportFormStatus =='notSendReportForm'}">
							<td><form action="${contextPath}/reportForm/sendToOrgUnits/${reportForm.id}" method="POST"><input type="hidden" name="reportFormStatus" value="${reportFormStatus}"><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form></td>
							<td><form action="${contextPath}/reportForm/editUnsendReportForm/${reportForm.id}" method="POST"><input type="hidden" name="reportFormStatus" value="${reportFormStatus}"><input type="submit" value="编辑"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatus =='sentToOrgUnitsReportForm' || reportFormStatus =='sentToLeader1ReportForm' || reportFormStatus =='sentToLeader2ReportForm' || reportFormStatus =='sentToOfficeReportForm' }">
							<td><form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST"><input type="hidden" name="reportFormStatus" value="${reportFormStatus}"><input type="submit" value="回复"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatus =='gotReplyFromUnitsReportForm'}">
							<!-- 选择发给哪个分管领导 ， 选择是否重新走流程-->
							<td><form action="${contextPath}/reportForm/sendToLeader1/${reportForm.id}" method="POST"><input type="hidden" name="reportFormStatus" value="${reportFormStatus}"><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatus =='passedReportForm'}">
							<!-- 选择打印 -->
						</c:when>
						<c:when test="${reportFormStatus =='deniedReportForm'}">
						 	<!-- 选择重新走流程 -->
						</c:when>
						<c:otherwise>?</c:otherwise>
					</c:choose>
				
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>