<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>应用系统配置</title>
<script type="text/javascript">
        $(document).ready(function(){
        	
        	   var regNum = /\d+(.\d+)?/;
        	$("form").submit(function() {
                var errors = [];
                var deadlineDuration = $.trim($("input[name='deadlineDuration']").val()); 
                if (!deadlineDuration.match(regNum)) {
                    errors.push("期限必须为数字，且不能为空");
                }
                if(deadlineDuration <=0 || deadlineDuration >=10){
                	errors.push("请输入数字1-9");
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
	<h2>应用系统配置</h2>
	<form action="${contextPath}/config/save" method="post">
	<table border="1">
		<tr>
		<td>审核期限天数:</td><td><input name="deadlineDuration" type="text" value="${paramsMap['deadlineDuration']}">天</td>
		</tr>
	</table>
	<input type="submit" value="保存">
	</form>
	<a href="${contextPath}/">返回首页</a><br/>
	
</body>
</html>