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
			<tr><td>报审名称： ${selectedReportForm.title}" </td></tr>
			<tr><td>编号：${selectedReportForm.formId}</td></tr>
			<tr><td>用地（受让）单位：： ${selectedReportForm.landUser}</td></tr>
			<tr><td>原土地使用者： ${selectedReportForm.originalLandUser}</td></tr>
			<tr><td>土地座落： ${selectedReportForm.landLocation}"</td></tr>
			<tr><td>用地面积（㎡、亩）：${selectedReportForm.landArea}</td></tr>
			<tr><td>规划用途：${selectedReportForm.landUse}</td></tr>
			<tr><td>原用途：：${selectedReportForm.originalLandUse}</td></tr>
			<tr><td>报审事项：${selectedReportForm.matter}"</td></tr>
			<tr><td>报审事项细节：${selectedReportForm.matterDetail}</td></tr>
			<tr><td>办理依据：${selectedReportForm.policyBasis}</td></tr>
			<tr><td>报审单位意见：${selectedReportForm.comment}</td></tr>
			<tr><td>单位主要负责人：${selectedReportForm.responsiblePerson}" </td></tr>
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
						<c:when test="${responseType =='sentToOrgUnitsReportForm' }">回复部门： ${qualitiedOrgUnit.name}<input type="hidden" name="orgUnitId" value="${qualifiedOrgUnit.id}"></input></c:when>
						<c:when test="${responseType =='gotReplyFromUnitsReportForm' }">选择分管领导</c:when>
						<c:when test="${responseType =='sentToLeader1ReportForm' }">需要分管领导批复的报审表</c:when>
						<c:when test="${responseType =='sentToLeader2ReportForm' }">需要主要领导批复的报审表</c:when>
						<c:when test="${responseType =='sentToOfficeReportForm' }">发送到办公室的报审表</c:when>
					<c:otherwise>?</c:otherwise>
					</c:choose>
				</td></tr>
				<tr><td><select name="agree"><option value="true">同意</option><option value="false">不同意</option></select></td></tr>
				<tr><td><input type="submit" value="回复" /></td></tr>
			</table>
		</form>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a>
</body>
</html>