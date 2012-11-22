<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="单位管理"/>
<%@ include file="blue/pageHead.jsp" %>
<!-- Start content  -->
    <div class="content">
       	<ul class="breadcrumb">
           <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
           <li class="active">单位管理</li>
       	</ul>
		
		<div class="container-fluid">
     		<div class="row-fluid">
				<div class="btn-toolbar">
					<a href="${contextPath}/orgUnit/addOrgUnit">
				    	<button class="btn btn-primary"><i class="icon-plus"></i>新增单位</button>
				    </a>
				  	<div class="btn-group"></div>
				</div>
				<div class="well">
				    <table class="table table-hover">
				    	<thead>
							<tr>
							 	<th>#</th>
								<td>单位名</td>
								<td>描述</td>
								<td>编辑</td>
								<td>删除</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="stat" var="orgUnit" items="${orgUnitPage.content}" >
								<tr>
									<td>${stat.index + 1 + page.offset}</td>
									<td>${orgUnit.name}</td>
									<td>${orgUnit.description}</td>
									<td><form action="${contextPath}/orgUnit/editOrgUnit/${orgUnit.id}" method="POST"><input class="btn" type="submit" value="编辑"></input></form></td>
									<td><form action="${contextPath}/orgUnit/delete/${orgUnit.id}" method="POST"><input value="删除" type="submit" class="btn" onclick="return confirm('确认删除');"></input></form></td>
								</tr>
							</c:forEach>
							<tr><td colspan="5"></td></tr>
						</tbody>
				    </table>
				    <c:set var="paginationPreUrl" value="${contextPath}/orgUnit/" scope="request"/>
					<jsp:include page="${jspRootPath}/include/paginationBar.jsp"/>
				</div>
                <%@ include file="blue/containerFoot.jsp" %>
            </div>
        </div>
		<!-- End container -->
    </div>
<!-- End content -->
<%@ include file="blue/pageTail.jsp" %>


