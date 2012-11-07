<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新建报审表</title>
    <script type="text/javascript">
        $(document).ready(function(){
            var reportTypeAuto = $("input[name='matter']");
            var nameList = [];
            <c:forEach var="repMatter" items="${reportFormMatterList}">
                nameList.push("${repMatter.name}");
            </c:forEach>
            reportTypeAuto.autocomplete({
                source: nameList,
                minLength: 0 
            });
            
            reportTypeAuto.focus(function() {
                if (!$(this).val()) {
                    reportTypeAuto.autocomplete("search", "");
                }
                return false;
            });
            
            
            var regNum = /\d+(.\d+)?/;
            $("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='title']").val()).length == 0) {
                    errors.push("请填写报审单名称");
                }
                if ($.trim($("input[name='matter']").val()).length == 0) {
                    errors.push("请填写报审事项");
                }
                if (!$.trim($("input[name='landArea']").val()).match(regNum)) {
                    errors.push("用地面积必须为数字，且不能为空");
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
	<h2>新建报审表</h2>
	
	<form id="addForm" action="${contextPath}/reportForm/add" method="post">
		<table>
			<tr><td>报审表类型：<select id="reportFormTypeId" name="reportFormTypeId"><c:forEach var="reportFormType" items="${reportFormTypeList}"><option value="${reportFormType.id}">${reportFormType.name}</option></c:forEach></select></td></tr>			
			<tr><td>报审单名称： <input name="title" type="text" maxlength="30"></input><td/></tr>
			<tr><td>用地（受让）单位： <input name="landUser" type="text" maxlength="30"></input></td></tr>
			<tr><td>原土地使用者： <input name="originalLandUser" type="text" maxlength="30"></input></td></tr>
			<tr><td>土地座落： <input name="landLocation" type="text" maxlength="50"></input></td></tr>
			<tr><td>
			用地面积： <input name="landArea" type="text" maxlength="24"></input>
			<select name="landAreaMeasure"><option value="SQUARE_METER">平方米</option><option value="SQUARE_KM">平方公里</option><option value="MU">亩</option><option value="HECTARE">公顷</option></select>
			</td></tr>
			<tr><td>规划用途： <input name="landUse" type="text" maxlength="30"></input></td></tr>
			<tr><td>原用途：： <input name="originalLandUse" type="text" maxlength="30"></input></td></tr>
			<tr><td>报审事项： <input name="matter" type="text" maxlength="30"></input></td></tr>
			<tr><td>报审事项细节：<textarea name="matterDetail" rows="10" cols="50"></textarea></td></tr>
			<tr><td>办理依据：<textarea name="policyBasis" rows="5" cols="50"></textarea></td></tr>
			<tr><td>报审单位意见：<textarea name="comment" rows="5" cols="50"></textarea></td></tr>
			<tr><td>单位主要负责人：<input name="responsiblePerson" type="text" maxlength="10"> </td></tr>
			<tr><td>审核人：<input name="auditor" type="text" maxlength="10"> </td></tr>
			<tr><td>制表人：<input name="tabulator" type="text" maxlength="10"> </td></tr>
			<tr><td><input type="submit" value="保存" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a>
</body>

</html>