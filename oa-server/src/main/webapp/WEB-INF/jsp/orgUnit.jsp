<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="单位管理"/>
<%@ include file="blue/pageHeader.jsp" %>

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
<!-- 				    <button class="btn">Import</button> -->
<!-- 				    <button class="btn">Export</button> -->
				  <div class="btn-group">
				  </div>
				</div>
				<div class="well">
				    <table class="table">
				    	<thead>
							<tr>
								 <th>#</th>
								<td>单位名</td>
								<td>描述</td>
								<td colspan="2">操作</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="stat" var="orgUnit" items="${orgUnitPage.content}" >
								<tr>
									<td>${stat.index + 1}</td>
									<td>${orgUnit.name}</td>
									<td>${orgUnit.description}</td>
									<td><form action="${contextPath}/orgUnit/delete/${orgUnit.id}" method="POST"><input value="删除" type="submit" class="btn" onclick="return confirm('确认删除');"></input></form></td>
									<td><form action="${contextPath}/orgUnit/editOrgUnit/${orgUnit.id}" method="POST"><input class="btn" type="submit" value="编辑"></input></form></td>
								</tr>
							</c:forEach>
							<tr><td colspan="5"></td></tr>
						</tbody>
				    </table>
				    <c:set var="paginationPreUrl" value="${contextPath}/orgUnit/" scope="request"/>
					<jsp:include page="${jspRootPath}/include/paginationBar.jsp"/>
				</div>
				
				<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				        <h3 id="myModalLabel">Delete Confirmation</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
				        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
				    </div>
				</div>

                 <footer>
                     <hr>

                     <!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
                     <p class="pull-right">A <a href="http://www.portnine.com/bootstrap-themes" target="_blank">Free Bootstrap Theme</a> by <a href="http://www.portnine.com" target="_blank">Portnine</a></p>

                     <p>&copy; 2012 <a href="http://www.portnine.com" target="_blank">Portnine</a></p>
                 </footer>
            </div>
        </div>
		<!-- End container -->
    </div>

    <script src="${blueNileAdminRootPath}/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
  </body>
</html>


