<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
 <script type="text/javascript">
        $(document).ready(function(){
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='username']").val()).length == 0) {
                    errors.push("请填写用户名称");
                }
                if ($.trim($("input[name='password']").val()).length == 0) {
                    errors.push("请填写密码");
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
	<h2>添加用户</h2>

	<form action="${contextPath}/user/add" method="post">
		<table>
			<tr><td>用户名： <input type="text" name="username" maxlength="10"/></td></tr>
			<tr><td>密码： <input type="password" name="password" maxlength="36"/></td></tr>
			<tr><td>单位：<select name="orgUnitId"><option></option><c:forEach var="orgUnit" items="${orgUnitList}"><option value="${orgUnit.id}">${orgUnit.name}</option></c:forEach></select></td></tr>
			<tr><td>描述：<textarea name="description" rows="3" cols="30"></textarea></td></tr>
			<tr><td>权限：<select name="privilege">
			<option value="NORMAL">普通</option>
			<option value="DEPARTMENT">部门</option>
			<option value="LEADER1">分管领导</option>
			<option value="LEADER2">主要领导</option>
			<option value="OFFICE">办公室</option>
			<option value="ADMIN">管理员</option>
			</select></td></tr>
			<tr><td><input type="submit" value="提交" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/user">返回用户管理</a>
</body>
</html>