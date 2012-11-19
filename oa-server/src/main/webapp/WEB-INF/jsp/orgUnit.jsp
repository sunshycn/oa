<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="${blueNileAdminRootPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${blueNileAdminRootPath}/stylesheets/theme.css">
    <link rel="stylesheet" href="${blueNileAdminRootPath}/lib/font-awesome/css/font-awesome.css">
    <script src="${blueNileAdminRootPath}/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${blueNileAdminRootPath}/assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${blueNileAdminRootPath}/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${blueNileAdminRootPath}/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${blueNileAdminRootPath}/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${blueNileAdminRootPath}/assets/ico/apple-touch-icon-57-precomposed.png">
  </head>
  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
	<!--Start nav bar -->
		<jsp:include page="${jspRootPath}/blue/navBar.jsp"/>
	<!--End nav bar -->
	
	<!--Start side bar -->
	    <jsp:include page="${jspRootPath}/blue/slideBar.jsp"/>
	<!--End side bar -->

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


