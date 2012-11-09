<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<c:set var="titleValue" value="${not empty selectedReportFormType ? '编辑': '添加'}报审事项"/>
<title>${titleValue}</title>
 <script type="text/javascript">
        $(document).ready(function(){
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='name']").val()).length == 0) {
                    errors.push("请填写名称");
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
	
	<form action="${contextPath}/reportFormMatter/${not empty selectedReportFormMatter ? 'edit' : 'add'}" method="post">
		<input type="hidden" name="id" value="${selectedReportFormMatter.id}"></input>
		<table>
			<tr><td>名称： <input type="text" name="name" maxlength="20" value="${selectedReportFormMatter.name}"/></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportFormMatter">返回报审事项管理</a>
</body>
</html>