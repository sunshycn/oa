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
	<c:if test="${privilege == 'NORMAL' || privilege == 'DEPARTMENT'}">
		<a href="${contextPath}/reportForm/addReportForm">新建报审表</a><br/>
		<a href="${contextPath}/reportForm/unsendReportForm">处理未发送报审表</a><br/>
		<a href="${contextPath}/reportForm/list/gotReplyFromUnitsReportForm">可发送给分管领导的报审表</a><br/>
		<a href="${contextPath}/reportForm/passedReportForm">发送回报审单位的报审表</a><br/>
		<a href="${contextPath}/reportForm/deniedReportForm">被拒绝的报审表</a><br/>
	</c:if>
	<c:if test="${privilege == 'DEPARTMENT'}">
		<a href="${contextPath}/reportForm/list/sentToOrgUnitsReportForm">待科室回复报审表</a><br/>
	</c:if>
	<c:if test="${privilege == 'LEADER1'}">
		<a href="${contextPath}/reportForm/list/sentToLeader1ReportForm">需要分管领导批复的报审表</a><br/>
	</c:if>
	<c:if test="${privilege == 'LEADER2'}">
		<a href="${contextPath}/reportForm/list/sentToLeader2ReportForm">需要主要领导批复的报审表</a><br/>
	</c:if>
	<c:if test="${privilege == 'OFFICE'}">
		<a href="${contextPath}/reportForm/list/sentToOfficeReportForm">发送到办公室的报审表</a><br/>
		<a href="${contextPath}/reportForm/passedReportForm">发送回报审单位的报审表（可打印）</a><br/>
	</c:if>

</body>
</html>