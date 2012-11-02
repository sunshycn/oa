<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>报审表信息</title>
</head>
<body>
 	<h2>报审表信息</h2>
 		
	ID: ${reportForm.id}<br/>
	报审表类型：${reportForm.reportFormType.name}<br/>
	报审名称：${reportForm.title}<br/>
	编号：${reportForm.formId}<br/>
	用地（受让）单位：${reportForm.landUser}<br/>
	原土地使用者：${reportForm.originalLandUser}<br/>
	土地座落： ${reportForm.landLocation}<br/>
	用地面积：${reportForm.landArea} 
	<c:choose>
		<c:when test="${reportForm.landAreaMeasure == 'MU'}">亩</c:when>
		<c:when test="${printedReportForm.landAreaMeasure == 'SQUARE_METER'}">平方米</c:when>
		<c:when test="${reportForm.landAreaMeasure == 'HECTARE'}">公顷</c:when>
		<c:otherwise>平方公里</c:otherwise>
	</c:choose>
	<br/>
	规划用途： ${reportForm.landUse}<br/>
	原用途： ${reportForm.originalLandUse}<br/>
	报审事项：${reportForm.matter}<br/>
	报审事项细节：${reportForm.matterDetail}<br/>
	办理依据：${reportForm.policyBasis}<br/>
	报审单位意见：${reportForm.comment}<br/>
	单位主要负责人：${reportForm.responsiblePerson}<br/>
	审核人：${reportForm.auditor}<br/>
	制表人：${reportForm.tabulator}<br/>
	<br/>
	当前回复：<br/>
	<table> 
		<thead>
		<tr>
			<td>回复部门（人）</td>
			<td>日期</td>
			<td>签名</td>
			<td>回复内容</td>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="feedback" items="${feedbackList}">	
			<tr>
				<td>${feedback.owner}</td>
				<td>${feedback.feedbackTime}</td>
				<td>${feedback.signature}</td>
				<td>${feedback.content}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${status == 'review'}">
		<form action="${contextPath}/reportForm/sendToLeader1/${reportForm.id}" method="POST">选择分管领导：<select name="leader1Id"><option></option><c:forEach var="leader1" items="${leader1List}"><option value="${leader1.id}">${leader1.username}</option></c:forEach></select><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form>
		<form action="${contextPath}/reportForm/reCreateReportForm/${reportForm.id}" method="POST"><input type="submit" value="重新生成报审表"></input></form>
	</c:if>
	<a href="${contextPath}/reportForm">返回报审表管理</a><br>

</body>
</html>