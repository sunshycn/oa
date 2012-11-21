<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="报审表类型管理"/>
<%@ include file="blue/pageHead.jsp" %>
<!-- Start content  -->
    <div class="content">
       	<ul class="breadcrumb">
           <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
           <li class="active">报审表类型管理</li>
       	</ul>
  		<div class="container-fluid">
     		<div class="row-fluid">
				<div class="btn-toolbar">
					<a href="${contextPath}/reportFormType/addReportFormType">
				    	<button class="btn btn-primary"><i class="icon-plus"></i>新增报审表类型</button>
				    </a>
				  	<div class="btn-group"></div>
				</div>
				<div class="well">
					<table class="table table-hover">
						<thead>
						<tr>
							<td>#</td>
							<td>报审表名称</td>
							<td>&nbsp;</td>
							<td>操作</td>
						</tr>
						</thead>
						<tbody>
						<c:forEach  varStatus="stat" var="reportFormType" items="${reportFormTypeList}">	
							<tr>
								<td>${stat.index + 1 + page.offset}</td>
								<td>${reportFormType.name}</td>
								<td><form action="${contextPath}/reportFormType/editReportFormType/${reportFormType.id}" method="POST"><input class="btn" type="submit" value="编辑"></input></form></td>
								<td><form action="${contextPath}/reportFormType/delete/${reportFormType.id}" method="POST"><input type="submit"  class="btn"  value="删除" onclick="return confirm('确认删除?(不推荐若存在报审表使用该类型，则无法删除)');" ></input></form></td>
							</tr>
						</c:forEach>
						<tr><td colspan="4"></td></tr>
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