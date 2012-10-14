<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkRequiredOrgUnits JSP</title>
</head>
<body>

<select name="orgUnitId"><c:forEach var="orgUnit" items="${requiredOrgUnits}"><option value="${orgUnit.id}">${orgUnit.name}</option></c:forEach></select>

</body>
</html>