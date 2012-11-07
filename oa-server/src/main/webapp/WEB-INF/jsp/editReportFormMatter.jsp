<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
<title>编辑报审事项</title>
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
	<h2>编辑报审事项</h2>
	
	<form action="${contextPath}/reportFormMatter/edit" method="post">
		<table>
			<tr><td>ID: ${selectedReportFormMatter.id}<input type="hidden" name="id" value="${selectedReportFormMatter.id}"></td></tr>
			<tr><td>名称： <input type="text" name="name" maxlength="20" value="${selectedReportFormMatter.name}"/></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportFormMatter">返回报审事项管理</a>
</body>
</html>