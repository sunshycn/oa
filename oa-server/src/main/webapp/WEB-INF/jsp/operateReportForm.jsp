<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>
        <c:choose>
        	<c:when test="${operate == 'add'}">新增报审表<c:set var="actionValue" value="${contextPath}/reportForm/add"/></c:when>
        	<c:when test="${operate == 'edit'}">编辑报审表<c:set var="actionValue" value="${contextPath}/reportForm/edit"/></c:when>
        	<c:when test="${operate == 'reCreate'}">重建报审表<c:set var="actionValue" value="${contextPath}/reportForm/reCreate"/></c:when>
        </c:choose>
        </title>
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
                    if ($.trim($("select[name='reportFormTypeId']").val()).length == 0) {
                        errors.push("请填写报审单类型");
                    }
                    if ($.trim($("input[name='title']").val()).length == 0) {
                        errors.push("请填写报审单名称");
                    }
                    if ($.trim($("input[name='landUser']").val()).length == 0) {
                        errors.push("请填写用地（受让）单位");
                    }
                    if ($.trim($("input[name='originalLandUser']").val()).length == 0) {
                        errors.push("请填写原土地使用者");
                    }
                    if ($.trim($("input[name='landLocation']").val()).length == 0) {
                        errors.push("请填写土地座落");
                    }
                    if ($.trim($("input[name='landUse']").val()).length == 0) {
                        errors.push("请填写规划用途");
                    }
                    if ($.trim($("input[name='originalLandUse']").val()).length == 0) {
                        errors.push("请填写原用途");
                    }
                    if ($.trim($("textarea[name='matterDetail']").val()).length == 0) {
                        errors.push("请填写报审事项细节");
                    }
                    if ($.trim($("textarea[name='policyBasis']").val()).length == 0) {
                        errors.push("请填写办理依据");
                    }
                    if ($.trim($("textarea[name='comment']").val()).length == 0) {
                        errors.push("请填写报审单位意见");
                    }
                    if ($.trim($("input[name='responsiblePerson']").val()).length == 0) {
                        errors.push("请填写单位主要负责人");
                    }
                    if ($.trim($("input[name='auditor']").val()).length == 0) {
                        errors.push("请填写审核人");
                    }
                    if ($.trim($("input[name='tabulator']").val()).length == 0) {
                        errors.push("请填写制表人");
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
	<h2>
	<c:choose>
        	<c:when test="${operate == 'add'}">新增报审表</c:when>
        	<c:when test="${operate == 'edit'}">编辑报审表</c:when>
        	<c:when test="${operate == 'reCreate'}">重建报审表</c:when>
    </c:choose>
	</h2>
	<form action="${actionValue}" method="post">
		<input type="hidden" name="id" value="${selectedReportForm.id}">
		<input type="hidden" name="formId"  value="${selectedReportForm.formId}" >
        <table>
			<tr><td>报审表类型：<select name="reportFormTypeId"><option value="${selectedReportForm.reportFormType.id}">${selectedReportForm.reportFormType.name}</option><c:forEach var="reportFormType" items="${supportedReportFormTypeList}"><option value="${reportFormType.id}">${reportFormType.name}</option></c:forEach></select></td></tr>
			<tr><td>报审单名称： <input name="title" type="text" maxlength="30" value="${selectedReportForm.title}" ></input></td></tr>
			<c:choose>
        		<c:when test="${operate == 'edit'}"><tr><td>编号：${selectedReportForm.formId}</td></tr></c:when>
        		<c:when test="${operate == 'reCreate'}"><tr><td>原表编号：${selectedReportForm.formId}</td></tr></c:when>
   			 </c:choose>
			<tr><td>用地（受让）单位： <input name="landUser" type="text" maxlength="30" value="${selectedReportForm.landUser}"></input></td></tr>
			<tr><td>原土地使用者： <input name="originalLandUser" type="text" maxlength="30"  value="${selectedReportForm.originalLandUser}"></input></td></tr>
			<tr><td>土地座落： <input name="landLocation" type="text" maxlength="50" value="${selectedReportForm.landLocation}"></input></td></tr>
			<tr><td>
			用地面积： <input name="landArea" type="text" maxlength="24" value="${selectedReportForm.landArea}"></input>
			<select name="landAreaMeasure">
			<c:choose>
			 	<c:when test="${selectedReportForm.landAreaMeasure == 'MU'}"><option value="MU">亩</option></c:when>
			 	<c:when test="${selectedReportForm.landAreaMeasure == 'SQUARE_METER'}"><option value="SQUARE_METER">平方米</option></c:when>
			 	<c:when test="${selectedReportForm.landAreaMeasure == 'HECTARE'}"><option value="HECTARE">公顷</option></c:when>
			 	<c:when test="${selectedReportForm.landAreaMeasure == 'SQUARE_KM'}"><option value="SQUARE_KM">平方公里</option></c:when>
			 </c:choose>
			<option value="SQUARE_METER">平方米</option><option value="SQUARE_METER">平方公里</option><option value="MU">亩</option><option value="HECTARE">公顷</option>
			</select>
			</td></tr>
			<tr><td>规划用途： <input name="landUse" type="text" maxlength="30" value="${selectedReportForm.landUse}"></input></td></tr>
			<tr><td>原用途： <input name="originalLandUse" type="text" maxlength="30" value="${selectedReportForm.originalLandUse}"></input></td></tr>
			<tr><td>报审事项： <input name="matter" type="text" maxlength="30" value="${selectedReportForm.matter}"></input></td></tr>
			<tr><td>报审事项细节：<textarea name="matterDetail" rows="10" cols="50">${selectedReportForm.matterDetail}</textarea></td></tr>
			<tr><td>办理依据：<textarea name="policyBasis" rows="5" cols="50">${selectedReportForm.policyBasis}</textarea></td></tr>
			<tr><td>报审单位意见：<textarea name="comment" rows="5" cols="50">${selectedReportForm.comment}</textarea></td></tr>
			<tr><td>单位主要负责人：<input name="responsiblePerson" type="text" maxlength="10" value="${selectedReportForm.responsiblePerson}"></input></td></tr>
			<tr><td>审核人：<input name="auditor" type="text" maxlength="10" value="${selectedReportForm.auditor}"></input></td></tr>
			<tr><td>制表人：<input name="tabulator" type="text" maxlength="10" value="${selectedReportForm.tabulator}"></input></td></tr>
			<tr><td><input type="submit" value="保存" /></td></tr>
		</table>
	</form>
	
	<a href="${contextPath}/reportForm">返回报审表管理</a>
</body>
</html>