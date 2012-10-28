<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询报审表</title>
</head>
<body>
   <h2>查询报审表</h2>
	<a href="${contextPath}/">返回首页</a><br/>
	任意组合三项字段进行查询，若不填写，则代表搜索全部 <br/>
	<form action="${contextPath}/query" method="post">
		<table>
			<tr><td><select name="param1"><option value="formId">编号</option><option value="landUser">用地单位</option><option value="landLocation">土地坐落</option><option value="title">报审名称</option><option value="originalLandUser">原土地使用者</option></select><input type="text" name="value1" maxlength="20"/></td></tr>
			<tr><td><select name="param2"><option value="formId">编号</option><option value="landUser">用地单位</option><option value="landLocation">土地坐落</option><option value="title">报审名称</option><option value="originalLandUser">原土地使用者</option></select><input type="text" name="value2" maxlength="20"/></td></tr>
			<tr><td><select name="param3"><option value="formId">编号</option><option value="landUser">用地单位</option><option value="landLocation">土地坐落</option><option value="title">报审名称</option><option value="originalLandUser">原土地使用者</option></select><input type="text" name="value3" maxlength="20"/></td></tr>
			<tr><td><input type="submit" value="查询" /></td></tr>
		</table>
	</form>
		<table>
		<tr>
		<td>编号</td>
		<td>用地单位</td>
		<td>原用地单位</td>
		<td>土地坐落</td>
		</tr>
		<c:forEach var="reportForm" items="${reportFormList}">
		<tr>
			<td>${reportForm.formId}</td>
			<td>${reportForm.landUser}</td>
			<td>${reportForm.originalLandUser}</td>
			<td>${reportForm.landLocation}</td>
			<td><form action="${contextPath}/reportForm/view/${reportForm.id}" method="POST"><input type="submit" value="详细"></input></form></td>
		</tr>			
		</c:forEach>
		
		</table>
		

</body>
</html>