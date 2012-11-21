<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="${not empty selectedReportFormType ? '编辑': '添加'}报审表类型"/>
<%@ include file="blue/pageHead.jsp" %>
<!-- Start content  -->
    <div class="content">
        <ul class="breadcrumb">
            <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
            <li><a href="${contextPath}/reportFormType">报审表类型管理</a><span class="divider">/</span></li>
            <li class="active">${pageTitle}</li>
        </ul>
		
        <div class="container-fluid">
            <div class="row-fluid">
            	<div class="btn-toolbar">
				    <button class="btn btn-primary" id="saveButton"><i class="icon-save"></i>保存</button>
				  <div class="btn-group"></div>
				</div>
				<div class="well">
               	 	<form id="reportFormAdd" action="${contextPath}/reportFormType/${not empty selectedReportFormType ? 'edit' : 'add'}" method="post">
	                    <c:if test="${not empty selectedReportFormType}">
	                        <input type="hidden" name="id" value="${selectedReportFormType.id}">
	                    </c:if>
	                    <table style="padding:5px">
	                        <tr>
	                            <td><b>报审表类型名：</b></td><td><input type="text" id="reportTypeName" name="name" value="${not empty selectedReportFormType ? selectedReportFormType.name : ''}" size="30" maxlength="30" /></td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div style="margin:0;padding:0">
	                                    <b>需要回复<br>该报审表的部门:</b><br>
	                                    (Ctrl键+鼠标左键<br>点击复选多个部门)
	                                </div>
	                            </td>
	                            <td>
	                                <div style="width: 400px">
	                                    <div style="float:left">
	                                        <select id="requiredOrgUnitIds" name="requiredOrgUnitIds" multiple="multiple" size="10">
	                                            <c:forEach var="orgUnit" items="${orgUnitList}">
	                                                <option value="${orgUnit.id}">${orgUnit.name}</option>
	                                            </c:forEach>
	                                        </select>
	                                    </div>
	                              </td>
	                          </tr>
	                          
                               <c:if test="${not empty selectedReportFormType}">
                               		<tr>
                               			<td>
                                  			<b>当前需要回复的科室有：</b>
                                   		</td>
                                   		<td>
		                                   <table>
		                                       <c:forEach var="orgUnit" items="${selectedReportFormType.requiredOrgUnits}">
		                                           <tr>
		                                               <td>${orgUnit.name}</td>
		                                           </tr>
		                                       </c:forEach>
		                                   </table>
                                   		</td>
                                   </tr>
                               </c:if>
	                   	</table>
               		</form>
				</div>
                <%@ include file="blue/containerFoot.jsp" %>
            </div>
        </div>
		<!-- End container -->
    </div>
<!-- End content -->
<%@ include file="blue/pageTail.jsp" %>
<script type="text/javascript">
  	$(document).ready(function() {
  		$("#saveButton").click(function() {
    		$("form").submit();
    	});
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
				alert(error.join("\n"));
				return false;
			}
		});
	});
</script>