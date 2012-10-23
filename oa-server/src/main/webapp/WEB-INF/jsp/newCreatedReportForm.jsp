<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建的报审表</title>
</head>
<body>
 	<h2>新建的报审表信息如下：</h2>
 		
	ID: ${newReportForm.id}<br/>
	报审表类型：${selectedReportForm.reportFormType.name}<br/>
	报审名称：${newReportForm.title}<br/>
	编号：${newReportForm.formId}<br/>
	用地（受让）单位：${newReportForm.landUser}<br/>
	原土地使用者：${newReportForm.originalLandUser}<br/>
	土地座落： ${newReportForm.landLocation}<br/>
	用地面积（㎡、亩）：${newReportForm.landArea}<br/>
	规划用途： ${newReportForm.landUse}<br/>
	原用途： ${newReportForm.originalLandUse}<br/>
	报审事项：${newReportForm.matter}<br/>
	报审事项细节：${newReportForm.matterDetail}<br/>
	办理依据：${newReportForm.policyBasis}<br/>
	报审单位意见：${newReportForm.comment}<br/>
	单位主要负责人：${newReportForm.responsiblePerson}<br/>
	审核人：${newReportForm.auditor}<br/>
	制表人：${newReportForm.tabulator}<br/>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a><br>

</body>
</html>