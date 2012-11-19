<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="sidebar-nav">
     <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>控制面板</a>
     <ul id="dashboard-menu" class="nav nav-list collapse in">
 	    <c:choose>
		  <c:when test="${currentUser.privilege == 'ADMIN' }">
			<li><a href="${contextPath}/orgUnit">单位管理</a></li>
			<li><a href="${contextPath}/user">用户管理</a></li>
			<li><a href="${contextPath}/reportFormType">报审表类型管理</a></li>
			<li><a href="${contextPath}/reportFormMatter">报审事项管理</a></li>
		  </c:when>
		  <c:otherwise>
		  	<li><a href="${contextPath}/reportForm">报审表管理</a></li>
		  </c:otherwise>
		</c:choose>
		<li><a href="${contextPath}/query">查询报审表</a></li>
		<li><a href="${contextPath}/message">查看消息</a></li>
     </ul>
     <a href="#" class="nav-header" ><i class="icon-comment"></i>常见问题</a>
 </div>