<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="${not empty selectedUser ? '编辑': '添加'}用户"/>
<%@ include file="blue/pageHead.jsp" %>

<!-- Start content  -->
    <div class="content">
        <ul class="breadcrumb">
            <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
            <li><a href="${contextPath}/user">用户管理</a><span class="divider">/</span></li>
            <li class="active">${pageTitle}</li>
        </ul>
		
        <div class="container-fluid">
            <div class="row-fluid">
            	<div class="btn-toolbar">
				    <button class="btn btn-primary" id="saveButton"><i class="icon-save"></i>保存</button>
				  <div class="btn-group"></div>
				</div>
				<div class="well">
					<form action="${contextPath}/user/${not empty selectedUser ? 'edit' : 'add'}" method="post" >
						<input type="hidden" name="id" value="${selectedUser.id}" />
						<table>
							<tr>
								<td>用户名：</td>
								<td><input type="text" name="username" maxlength="20" value="${selectedUser.username}" /></td>
							</tr>
							<tr>
								<td>密码：</td>
								<td><input type="text" name="password" maxlength="36" /> <c:if test="${not empty selectedUser}">（留空则不更新密码）</c:if></td>
							</tr>
							<tr>
								<td>单位：</td>
								<td>
									<select name="orgUnitId">
										<c:if test="${not empty selectedUser.orgUnit}">
											<option value="${selectedUser.orgUnit.id}">${selectedUser.orgUnit.name}</option>
										</c:if>
										<option></option>
										<c:forEach var="orgUnit" items="${orgUnitList}">
											<option value="${orgUnit.id}">${orgUnit.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>描述：</td>
								<td><textarea name="description" rows="3" cols="30">${selectedUser.description}</textarea></td>
							</tr>
							<tr>
								<td>权限：</td>
								<td><select name="privilege">
										<c:if test="${not empty selectedUser}">
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
										</c:if>
										<option value="NORMAL">普通</option>
										<option value="DEPARTMENT">部门</option>
										<option value="LEADER1">分管领导</option>
										<option value="LEADER2">主要领导</option>
										<option value="OFFICE">办公室</option>
										<option value="ADMIN">管理员</option>
								</select></td>
							</tr>
							<tr>
								<td>可申请报审表类型 <BR>(Ctrl键+鼠标左键<BR>点击复选多个类型)：</td>
								<td>
									<select name="supportedReportFormTypeIds" multiple="multiple" size="3">
										<c:forEach var="reportFormType" items="${reportFormTypeList}">
											<option value="${reportFormType.id}">${reportFormType.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<c:if test="${not empty selectedUser}">
								<tr>
									<td><b>当前支持的报审表类型：</b></td>
									<td>
										<table>
											<c:forEach var="reportFormType"
												items="${selectedUser.supportedReportFormTypes}">
												<tr>
													<td>${reportFormType.name}</td>
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
        $(document).ready(function(){
        	$("#saveButton").click(function() {
        		$("form").submit();
        	});
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("input[name='username']").val()).length == 0) {
                    errors.push("请填写用户名称");
                }

                if (errors.length > 0) {
                    alert(errors.join("\n"));
                    return false;
                }
            });
        });
</script>
