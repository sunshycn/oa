<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>报审表管理</title>
</head>
<body>
	<h2>报审表管理</h2>
	<a href="${contextPath}/">返回首页</a><br/>
	<c:if test="${currentUser.privilege == 'NORMAL'}">
		<a href="${contextPath}/reportForm/addReportForm">新建报审表</a><br/>
		<a href="${contextPath}/reportForm/list/notSendReportForm">处理未发送报审表</a><br/>
		<a href="${contextPath}/reportForm/list/gotReplyFromUnitsReportForm">可发送给分管领导的报审表</a><br/>
		<a href="${contextPath}/reportForm/list/passedReportForm">发送回报审单位的报审表</a><br/>
		<a href="${contextPath}/reportForm/list/deniedReportForm">被否决的报审表</a><br/>
	</c:if>
	<c:if test="${currentUser.privilege == 'DEPARTMENT'}">
		<a href="${contextPath}/reportForm/list/sentToOrgUnitsReportForm">待科室回复报审表</a><br/>
	</c:if>
	<c:if test="${currentUser.privilege == 'LEADER1'}">
		<a href="${contextPath}/reportForm/list/sentToLeader1ReportForm">需要分管领导批复的报审表</a><br/>
	</c:if>
	<c:if test="${currentUser.privilege == 'LEADER2'}">
		<a href="${contextPath}/reportForm/list/sentToLeader2ReportForm">需要主要领导批复的报审表</a><br/>
	</c:if>
	<c:if test="${currentUser.privilege == 'OFFICE'}">
		<a href="${contextPath}/reportForm/list/sentToOfficeReportForm">发送到办公室的报审表</a><br/>
		<a href="${contextPath}/reportForm/list/passedReportForm">发送回报审单位的报审表</a><br/>
	</c:if>

</body>
</html>