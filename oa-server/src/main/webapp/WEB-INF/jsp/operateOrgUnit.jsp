<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="${not empty selectedReportFormType ? '编辑': '添加'}单位"/>
<%@ include file="blue/pageHead.jsp" %>

<!-- Start content  -->
    <div class="content">
        <ul class="breadcrumb">
            <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
            <li><a href="${contextPath}/orgUnit">单位管理</a><span class="divider">/</span></li>
            <li class="active">${pageTitle}</li>
        </ul>
		
        <div class="container-fluid">
            <div class="row-fluid">
            	<div class="btn-toolbar">
				    <button class="btn btn-primary" id="saveButton"><i class="icon-save"></i>保存</button>
				  <div class="btn-group">
				  </div>
				</div>
				<div class="well">
					<form action="${contextPath}/orgUnit/${not empty selectedOrgUnit ? 'edit' : 'add'}" method="post">
						<input type="hidden" name="id" value="${selectedOrgUnit.id}">
						<label>单位名</label>
						<input type="text" name="name" maxlength="20" value="${selectedOrgUnit.name}"/>
						<label>上级单位</label>
						<select name="parentId">
							<c:if test="${not empty parentOrgUnit}">	
								<option value="${parentOrgUnit.id}">${parentOrgUnit.name}</option>				
							</c:if>
							<option></option>
							<c:forEach var="orgUnit" items="${orgUnitList}">
								<option value="${orgUnit.id}">${orgUnit.name}</option>
							</c:forEach>
						</select>
						<label>描述</label>
						<textarea name="description" rows="3" cols="30">${selectedOrgUnit.description}</textarea>
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
        $(document).ready(function(){
        	$("#saveButton").click(function() {
        		$("form").submit();
        	});
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='name']").val()).length == 0) {
                    errors.push("请填写单位名称");
                }
                if ($.trim($("input[name='parentId']").val()).length == 0) {
                    errors.push("请选择上级单位");
                }
                if (errors.length > 0) {
                    alert(errors.join("\n"));
                    return false;
                }
            });
        });
</script>

