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
	
	<form action="${contextPath}/query" method="post">
		<table>
			<tr><td>编号： <input type="text" name="formId" maxlength="20"/></td></tr>
			<tr><td>用地单位： <input type="text" name="landUser" maxlength="20"/></td></tr>
			<tr><td>土地坐落： <input type="text" name="landLocation" maxlength="20"/></td></tr>
			
			<tr><td><input type="submit" value="查询" /></td></tr>
		</table>
		
		<table>
		<tr>
		<td>编号</td>
		<td>用户单位</td>
		<td>原用户单位</td>
		<td>土地坐落</td>
		</tr>
		<c:forEach var="reportForm" items="${reportFormList}">
		<tr>
			<td>${reportForm.formId}</td>
			<td>${reportForm.landUser}</td>
			<td>${reportForm.originalLandUser}</td>
			<td>${reportForm.landLocation}</td>
		</tr>			
		</c:forEach>
		
		</table>
		</form>

</body>
</html>