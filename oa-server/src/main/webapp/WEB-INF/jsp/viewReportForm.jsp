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
	用地面积（㎡、亩）：${reportForm.landArea} ${reportForm.landAreaMeasure}<br/>
	规划用途： ${reportForm.landUse}<br/>
	原用途： ${reportForm.originalLandUse}<br/>
	报审事项：${reportForm.matter}<br/>
	报审事项细节：${reportForm.matterDetail}<br/>
	办理依据：${reportForm.policyBasis}<br/>
	报审单位意见：${reportForm.comment}<br/>
	单位主要负责人：${reportForm.responsiblePerson}<br/>
	审核人：${reportForm.auditor}<br/>
	制表人：${reportForm.tabulator}<br/>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a><br>

</body>
</html>