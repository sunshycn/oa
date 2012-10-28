<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>回复报审表</title>
</head>
<body>
	<h2>回复报审表</h2>
	
	
		<table>
			<tr><td>ID: ${selectedReportForm.id}</td></tr>
			<tr><td>报审表类型：${selectedReportForm.reportFormType.name}</td></tr>
			<tr><td>报审名称： ${selectedReportForm.title} </td></tr>
			<tr><td>编号：${selectedReportForm.formId}</td></tr>
			<tr><td>用地（受让）单位：： ${selectedReportForm.landUser}</td></tr>
			<tr><td>原土地使用者： ${selectedReportForm.originalLandUser}</td></tr>
			<tr><td>土地座落： ${selectedReportForm.landLocation}</td></tr>
			<tr><td>用地面积（㎡、亩）：${selectedReportForm.landArea} 
			<c:choose>
				<c:when test="${reportForm.landAreaMeasure == 'MU'}">亩</c:when>
				<c:when test="${reportForm.landAreaMeasure == 'HECTARE'}">公顷</c:when>
				<c:otherwise>平方公里</c:otherwise>
			</c:choose>
			</td></tr>
			<tr><td>规划用途：${selectedReportForm.landUse}</td></tr>
			<tr><td>原用途：：${selectedReportForm.originalLandUse}</td></tr>
			<tr><td>报审事项：${selectedReportForm.matter}</td></tr>
			<tr><td>报审事项细节：${selectedReportForm.matterDetail}</td></tr>
			<tr><td>办理依据：${selectedReportForm.policyBasis}</td></tr>
			<tr><td>报审单位意见：${selectedReportForm.comment}</td></tr>
			<tr><td>单位主要负责人：${selectedReportForm.responsiblePerson} </td></tr>
			<tr><td>审核人：${selectedReportForm.auditor}</td></tr>
			<tr><td>制表人：${selectedReportForm.tabulator}</td></tr>
		</table>
		<br/>
		<form action="${contextPath}/feedback/add" method="post">
			<table>
				<tr><td><input type="hidden" name="reportFormId" value="${selectedReportForm.id}"></td></tr>
				<tr><td>回复意见：<textarea name="content" rows="5" cols="50"></textarea></td></tr>
				<tr><td>签名：<input name="signature" type="text" maxlength="6" ></input></td></tr>
				<tr><td>
					<c:choose>
						<c:when test="${responseType =='SENT_TO_ORG_UNITS'}">
						 <tr><td>回复部门： ${qualifiedOrgUnit.name}<input type="hidden" name="orgUnitId" value="${qualifiedOrgUnit.id}"></input></td></tr>
						</c:when>
						
						<c:when test="${responseType =='SENT_TO_LEADER1'}">
								<input type="hidden" name="currentReceiverId" value="${selectedReportForm.currentReceiverId}">
								<tr><td>选择要发给的主要领导： <select name="leader2Id"><option></option><c:forEach var="leader2" items="${leader2List}"><option value="${leader2.id}">${leader2.username}</option></c:forEach></select></td></tr>
						</c:when>
						<c:when test="${responseType =='SENT_TO_LEADER2'}">
								<input type="hidden" name="currentReceiverId" value="${selectedReportForm.currentReceiverId}">
						</c:when>
						<c:when test="${responseType =='SENT_TO_OFFICE'}"></c:when>
					<c:otherwise>?</c:otherwise>
					</c:choose>
				</td></tr>
				<c:if test="${responseType !='SENT_TO_OFFICE'}">
					<tr><td><select name="agree"><option value="true">同意</option><option value="false">不同意</option></select></td></tr>
				</c:if>		
				<tr><td><input type="submit" value="回复" /></td></tr>
			</table>
		</form>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a>
</body>
</html>