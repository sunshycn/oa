<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<c:set var="titleValue" value="${not empty selectedReportFormType ? '编辑': '添加'}单位"/>
<title>${titleValue}</title>
 <script type="text/javascript">
        $(document).ready(function(){
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='name']").val()).length == 0) {
                    errors.push("请填写单位名称");
                }

                if (errors.length > 0) {
                    alert(errors.join(", "));
                    return false;
                }
            });
        });
</script>

</head>
<body>
	<h2>${titleValue}</h2>
	
	<form action="${contextPath}/orgUnit/${not empty selectedOrgUnit ? 'edit' : 'add'}" method="post">
		<input type="hidden" name="id" value="${selectedOrgUnit.id}">
		<table>
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