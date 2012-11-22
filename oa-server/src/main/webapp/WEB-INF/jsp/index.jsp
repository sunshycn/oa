<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="控制面板"/>
<%@ include file="blue/pageHead.jsp" %>

<!-- Start content  -->
    <div class="content">
		<!-- Start header -->
        <div class="header">
            <div class="stats">
			    <p class="stat"><span class="number">53</span>消息</p>
			</div>
            <h1 class="page-title">${pageTitle}</h1>
        </div>
		<!-- End header -->

		<!-- Start container -->
        <div class="container-fluid">
            <div class="row-fluid">
				<div class="row-fluid">
					    
				</div>
                 <%@ include file="blue/containerFoot.jsp" %>
            </div>
        </div>
		<!-- End container -->
    </div>
<!-- End content -->
<%@ include file="blue/pageTail.jsp" %>


