<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑用户</title>

 <script type="text/javascript">
        $(document).ready(function(){
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='username']").val()).length == 0) {
                    errors.push("请填写用户名称");
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
	<h2>编辑用户</h2>
	<form action="${contextPath}/user/edit" method="post">
		<table>
			<tr><td>ID: ${selectedUser.id}<input type="hidden" name="id" value="${selectedUser.id}"></td></tr>
			<tr><td>用户名： <input type="text" name="username" maxlength="20" value="${selectedUser.username}"/></td></tr>
			<tr><td>密码： <input type="text" name="password" maxlength="36"/>（留空则不更新密码）</td></tr>
			<tr><td>单位：<select name="orgUnitId">
			<c:if test="${not empty selectedUser.orgUnit}">
				<option value="${selectedUser.orgUnit.id}">${selectedUser.orgUnit.name}</option>
			</c:if>
			<option></option>
			<c:forEach var="orgUnit" items="${orgUnitList}"><option value="${orgUnit.id}">${orgUnit.name}</option></c:forEach>
			</select>
			<tr><td>描述：<textarea name="description" rows="3" cols="30">${selectedUser.description}</textarea></td></tr>
			<tr><td>权限：<select name="privilege">
			<option value="${selectedUser.privilege}">
			<c:choose>
				<c:when test="${selectedUser.privilege =='DEPARTMENT' }">部门</c:when>
				<c:when test="${selectedUser.privilege =='LEADER1' }">一般领导</c:when>
				<c:when test="${selectedUser.privilege =='LEADER2' }">主要领导</c:when>
				<c:when test="${selectedUser.privilege =='OFFICE' }">办公室</c:when>
				<c:when test="${selectedUser.privilege =='ADMIN' }">管理员</c:when>
				<c:otherwise>普通</c:otherwise>
			</c:choose>
			</option>
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