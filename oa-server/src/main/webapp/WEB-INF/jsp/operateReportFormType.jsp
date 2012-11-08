<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <c:set var="titleValue" value="${not empty selectedReportFormType ? '重设': '添加'}报审表类型"/>
		<title>${titleValue}</title>
		<meta charset="UTF-8">
		<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css">
	 	<script type="text/javascript">
		  	$(document).ready(function() {
				$("#reportFormAdd").submit(function() {
					var error = [];
					var name = $("#reportTypeName").val();
					var ids = $("#requiredOrgUnitIds").val();
					if (!name || $.trim(name).length == 0) {
						error.push("报审表类型名不能为空");
					}
					if (!ids || $.trim(ids).length == 0) {
						error.push("请选择至少一个报审部门");
					}
					if (error.length > 0) {
						alert(error.join(" "));
						return false;
					}
				});
			});
	 	</script>
	</head>
	<body>
		<h2>${titleValue}</h2>
        <div>
    		<div style="float:left; width:400px" >
                <form id="reportFormAdd" action="${contextPath}/reportFormType/${not empty selectedReportFormType ? 'edit' : 'add'}" method="post">
                    <c:if test="${not empty selectedReportFormType}">
                        <input type="hidden" name="id" value="${selectedReportFormType.id}">
                    </c:if>
                    <table style="padding:5px">
                        <tr>
                            <td><b>报审表类型名：</b><input type="text" id="reportTypeName" name="name" value="${not empty selectedReportFormType ? selectedReportFormType.name : ''}" size="30" maxlength="30" /></td>
                        </tr>
                        <tr>
                            <td>
                                <div style="margin:0;padding:0">
                                    <b>需要回复该报审表的部门:</b><br>
                                    (Ctrl键+鼠标左键点击复选多个部门)
                                </div>
                                <div style="width: 400px">
                                    <div style="float:left">
                                        <select id="requiredOrgUnitIds" name="requiredOrgUnitIds" multiple="multiple" size="10">
                                            <c:forEach var="orgUnit" items="${orgUnitList}">
                                                <option value="${orgUnit.id}">${orgUnit.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div style="marging-left:10px;float:right">
                                        <c:if test="${not empty selectedReportFormType}">
                                            <b>当前需要回复的科室有：</b>
                                            <table>
                                                <c:forEach var="orgUnit" items="${selectedReportFormType.requiredOrgUnits}">
                                                    <tr>
                                                        <td>${orgUnit.name}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="提交" /></td>
                        </tr>
                    </table>
                </form>
                <a href="${contextPath}/reportFormType">返回报审表类型管理</a>
            </div>
        </div>
	</body>
</html>