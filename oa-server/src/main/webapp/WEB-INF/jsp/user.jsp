<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="用户管理"/>
<%@ include file="blue/pageHead.jsp" %>
<!-- Start content  -->
    <div class="content">
       	<ul class="breadcrumb">
           <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
           <li class="active">用户管理</li>
       	</ul>
  		<div class="container-fluid">
     		<div class="row-fluid">
				<div class="btn-toolbar">
					<a href="${contextPath}/user/addUser">
				    	<button class="btn btn-primary"><i class="icon-plus"></i>新增用户</button>
				    </a>
				  	<div class="btn-group"></div>
				</div>
				<div class="well">
					<table class="table table-hover">
						<thead>
							<tr>
								<td>#</td>
								<td>用户名</td>
								<td>描述</td>
								<td>所属单位</td>
								<td>权限</td>
								<td colspan="2">操作</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="stat" var="user" items="${userList}">	
								<tr>
									<td>${stat.index + 1 + page.offset}</td>
									<td>${user.username}</td>
									<td>${user.description}</td>
									<td>
										<c:choose> 
											<c:when test="${empty user.orgUnit}">
												
											</c:when>
										<c:otherwise>
											${user.orgUnit.name}
										</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${user.privilege =='DEPARTMENT' }">部门</c:when>
											<c:when test="${user.privilege =='LEADER1' }">分管领导</c:when>
											<c:when test="${user.privilege =='LEADER2' }">主要领导</c:when>
											<c:when test="${user.privilege =='OFFICE' }">办公室</c:when>
											<c:when test="${user.privilege =='ADMIN' }">管理员</c:when>
											<c:otherwise>普通</c:otherwise>
										</c:choose>
									</td>
									<td><form action="${contextPath}/user/editUser/${user.id}" method="POST"><input type="submit"  class="btn" value="编辑"></input></form></td>
									<td><form action="${contextPath}/user/delete/${user.id}" method="POST"><input type="submit" class="btn" value="删除" onclick="return confirm('确认删除');"></input></form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				    <c:set var="paginationPreUrl" value="${contextPath}/user/" scope="request"/>
					<jsp:include page="${jspRootPath}/include/paginationBar.jsp"/>
				</div>
                <%@ include file="blue/containerFoot.jsp" %>
            </div>
        </div>
		<!-- End container -->
    </div>
<!-- End content -->
<%@ include file="blue/pageTail.jsp" %>