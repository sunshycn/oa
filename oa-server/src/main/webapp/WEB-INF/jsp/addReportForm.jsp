<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建报审表</title>
</head>
<body>
	<h2>新建报审表</h2>
	
	<form action="${contextPath}/reportForm/add" method="post">
		<table>
			<tr><td>报审表类型：<select name="reportFormTypeId"><c:forEach var="reportFormType" items="${reportFormTypeList}"><option value="${reportFormType.id}">${reportFormType.name}</option></c:forEach></select></td></tr>
			<tr><td>报审名称： <input name="title" type="text" maxlength="10"></input></td></tr>
			<tr><td>编号：${formId}<input name="formId" type="hidden" value="${formId}" ></td></tr>
			<tr><td>用地（受让）单位： <input name="landUser" type="text" maxlength="30"></input></td></tr>
			<tr><td>原土地使用者： <input name="originalLandUser" type="text" maxlength="30"></input></td></tr>
			<tr><td>土地座落： <input name="landLocation" type="text" maxlength="40"></input></td></tr>
			<tr><td>用地面积（㎡、亩）： <input name="landArea" type="text" maxlength="24"></input></td></tr>
			<tr><td>规划用途： <input name="landUse" type="text" maxlength="10"></input></td></tr>
			<tr><td>原用途：： <input name="originalLandUse" type="text" maxlength="10"></input></td></tr>
			<tr><td>报审事项： <input name="matter" type="text" maxlength="20"></input></td></tr>
			<tr><td>报审事项细节：<textarea name="matterDetail" rows="10" cols="50"></textarea></td></tr>
			<tr><td>办理依据：<textarea name="policyBasis" rows="5" cols="50"></textarea></td></tr>
			<tr><td>报审单位意见：<textarea name="comment" rows="5" cols="50"></textarea></td></tr>
			<tr><td>单位主要负责人：<input name="responsiblePerson" type="text" maxlength="6"> </td></tr>
			<tr><td>审核人：<input name="auditor" type="text" maxlength="6"> </td></tr>
			<tr><td>制表人：<input name="tabulator" type="text" maxlength="6"> </td></tr>
			<tr><td><input type="submit" value="保存" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a>
</body>
</html>