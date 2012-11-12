<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${reportFormStatusLink =='notSendReportForm'}">未发送报审单</c:when>
		<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">发到科室的报审单</c:when>
		<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">各科室回复完毕的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
		<c:when test="${reportFormStatusLink =='rejectedByLeader1ReportForm'}">未通过审核的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
		<c:when test="${reportFormStatusLink =='rejectedByLeader2ReportForm'}">未通过主要领导审核的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
		<c:when test="${reportFormStatusLink =='passedReportForm'}">发送回报审单位的报审表（完成报审）</c:when>
		<c:otherwise>?</c:otherwise>
	</c:choose>
</title>
</head>
<body>
	<h2>
		<c:choose>
			<c:when test="${reportFormStatusLink =='notSendReportForm'}">未发送报审单</c:when>
			<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">发到科室的报审单</c:when>
			<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">各科室回复完毕的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
			<c:when test="${reportFormStatusLink =='rejectedByLeader1ReportForm'}">未通过审核的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
			<c:when test="${reportFormStatusLink =='rejectedByLeader2ReportForm'}">未通过主要领导审核的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
			<c:when test="${reportFormStatusLink =='passedReportForm'}">发送回报审单位的报审表（完成报审）</c:when>
			<c:otherwise>?</c:otherwise>
		</c:choose>
	</h2>
	<a href="${contextPath}/reportForm">返回报审单管理</a><br/>
	<c:if test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">
	待回复的报审单<br/>
	</c:if>
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
				<c:set var="deadline" value="${reportForm.deadlineTime}"></c:set>
				<% long timeDiff = ((Timestamp)request.getAttribute("deadline")).getTime() - System.currentTimeMillis();
					if(timeDiff < 86400000){
						%><td><span style="color:yellow">${reportForm.formId}</span></td> <% 
					}else if(timeDiff < 0){
						%> <td><span style="color:red">${reportForm.formId}</span></td><% 
					}else{
						%> <td>${reportForm.formId}</td><%
					}
				%>
			<%-- 	<td>${reportForm.formId}</td> --%>
				<td>${reportForm.title}</td>
					<c:choose>
						<c:when test="${reportFormStatusLink =='notSendReportForm'}">
							<td><form action="${contextPath}/reportForm/sendToOrgUnits/${reportForm.id}" method="POST"><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form></td>
							<td><form action="${contextPath}/reportForm/editUnsendReportForm/${reportForm.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
							<td><form action="${contextPath}/reportForm/delete/${reportForm.id}" method="POST"><input type="submit" value="删除" onclick="return confirm('确认删除?');"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm' || reportFormStatusLink =='sentToLeader1ReportForm' || reportFormStatusLink =='sentToLeader2ReportForm'}">
							<td><form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST"><input type="submit" value="回复"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">
							<td><form action="${contextPath}/reportForm/reviewReportForm/${reportForm.id}" method="POST"><input type="submit" value="查看"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='rejectedByLeader1ReportForm'}">
							<td><form action="${contextPath}/reportForm/reCreateReportForm/${reportForm.id}" method="POST"><input type="submit" value="重新生成报审表"></input></form></td>
							<td><form action="${contextPath}/reportForm/view/${reportForm.id}" method="POST"><input type="submit" value="查看"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='rejectedByLeader2ReportForm'}">
							<td><form action="${contextPath}/reportForm/sendBackToReporter/${reportForm.id}" method="POST"><input type="submit" value="发回报审单位"></input></form></td>
							<td><form action="${contextPath}/reportForm/view/${reportForm.id}" method="POST"><input type="submit" value="查看"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='passedReportForm'}">
							<td><form action="${contextPath}/reportForm/printReportForm/${reportForm.id}" method="POST"><input type="submit" value="打印"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">
							<c:if test="${sessionScope.currentUser.privilege == 'OFFICE' }"><td><form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST"><input type="submit" value="回复"></input></form></td></c:if>
							<c:if test="${sessionScope.currentUser.privilege == 'LEADER1' }"><td><form action="${contextPath}/reportForm/view/${reportForm.id}" method="POST"><input type="submit" value="查看"></input></form></td></c:if>						
						</c:when>
						<c:otherwise>?</c:otherwise>
					</c:choose>				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br/>
	<c:if test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">
		已回复的报审单(等待其他科室回复)：
		<br/>
		<table border="1">
		<thead>
		<tr>
			<td>报审单编号</td>
			<td>报审单名称</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="reportForm" items="${responsedReportFormList}">	
			<tr>
				<td>${reportForm.formId}</td>
				<td>${reportForm.title}</td>
				<td><form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST"><input type="submit" value="查看"></input></form></td>			
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</c:if>
	<br/>

</body>
</html>