<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="报审事项管理"/>
<%@ include file="blue/pageHead.jsp" %>
<!-- Start content  -->
    <div class="content">
       	<ul class="breadcrumb">
           <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
           <li class="active">报审事项管理</li>
       	</ul>
		<div class="container-fluid">
     		<div class="row-fluid">
				<div class="btn-toolbar">
					<a href="${contextPath}/reportFormMatter/addReportFormMatter">
				    	<button class="btn btn-primary"><i class="icon-plus"></i>新增报审事项</button>
				    </a>
				  	<div class="btn-group"></div>
				</div>
				<div class="well">
					<table class="table table-hover">
						<thead>
						<tr>
							<td>#</td>
							<td>名称</td>
							<td>编辑</td>
							<td>删除</td>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="reportFormMatter" items="${reportFormMatterList}">	
								<tr>
									<td>${reportFormMatter.id}</td>
									<td>${reportFormMatter.name}</td>
									<td><form action="${contextPath}/reportFormMatter/editReportFormMatter/${reportFormMatter.id}" method="POST"><input type="submit" class="btn" value="编辑"></input></form></td>
									<td><form action="${contextPath}/reportFormMatter/delete/${reportFormMatter.id}" method="POST"><input type="submit" value="删除"  class="btn" onclick="return confirm('确认删除');"></input></form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				    <c:set var="paginationPreUrl" value="${contextPath}/reportFormMatter?currentPage=" scope="request"/>
					<jsp:include page="${jspRootPath}/include/paginationBar.jsp"/>
				</div>
                <%@ include file="blue/containerFoot.jsp" %>
            </div>
        </div>
		<!-- End container -->
    </div>
<!-- End content -->
<%@ include file="blue/pageTail.jsp" %>