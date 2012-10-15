<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建的报审表</title>
</head>
<body>
	${newReportForm.id}<br/>
	${newReportForm.title}<br/>
	${newReportForm.formId}<br/>
	${newReportForm.landUser}<br/>
	${newReportForm.originalLandUser}<br/>
	${newReportForm.landLocation}<br/>
	${newReportForm.landArea}<br/>
	${newReportForm.landUse}<br/>
	${newReportForm.originalLandUse}<br/>
	${newReportForm.matter}<br/>
	${newReportForm.matterDetail}<br/>
	${newReportForm.policyBasis}<br/>
	${newReportForm.comment}<br/>
	${newReportForm.responsiblePerson}<br/>
	${newReportForm.auditor}<br/>
	${newReportForm.tabulator}<br/>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a><br>

</body>
</html>