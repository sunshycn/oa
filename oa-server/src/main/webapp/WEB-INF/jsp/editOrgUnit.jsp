<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<title>编辑单位</title>
</head>
<body>
	<h2>编辑单位</h2>
	
	<form action="${contextPath}/orgUnit/edit" method="post">
		<table>
			<tr><td>ID: ${selectedOrgUnit.id}<input type="hidden" name="id" value="${selectedOrgUnit.id}"></td></tr>
			<tr><td>单位名： <input type="text" name="name" maxlength="20" value="${selectedOrgUnit.name}"/></td></tr>
			<tr><td>上级单位：<select name="parentId">
			<c:if test="${not empty parentOrgUnit}">	
				<option value="${parentOrgUnit.id}">${parentOrgUnit.name}</option>				
			</c:if>
			<option></option>
			<c:forEach var="orgUnit" items="${orgUnitList}"><option value="${orgUnit.id}">${orgUnit.name}</option></c:forEach>
			</select></td></tr>
			<tr><td>描述：<textarea name="description" rows="3" cols="30">${selectedOrgUnit.description}</textarea></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/orgUnit">返回单位管理</a>
</body>
</html>