<%@ page language="java"  pageEncoding="utf-8"%>
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
		  </c:otherwise>
		</c:choose>
		<li><a href="${contextPath}/query">查询报审表</a></li>
		<li><a href="${contextPath}/message">查看消息</a></li>
     </ul>
     <c:if test="${currentUser.privilege != 'ADMIN' }">
	     <a href="#accountss-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>报审表管理</a>
	     <ul id="accountss-menu" class="nav nav-list collapse in">
			<c:if test="${currentUser.privilege == 'NORMAL'}">
				<li><a href="${contextPath}/reportForm/addReportForm">新建报审表</a></li>
				<li><a href="${contextPath}/reportForm/list/notSendReportForm">处理未发送报审表</a></li>
				<li><a href="${contextPath}/reportForm/list/gotReplyFromUnitsReportForm">各科室回复完毕的报审表</a></li>
				<li><a href="${contextPath}/reportForm/list/rejectedByLeader1ReportForm">未通过审核的报审表</a></li>
				<li><a href="${contextPath}/reportForm/list/passedReportForm">发送回报审单位的报审表<br/>（完成报审）</a></li>
			</c:if>
			<c:if test="${currentUser.privilege == 'DEPARTMENT'}">
				<li><a href="${contextPath}/reportForm/list/sentToOrgUnitsReportForm">发到科室的报审单</a></li>
			</c:if>
			<c:if test="${currentUser.privilege == 'LEADER1'}">
				<li><a href="${contextPath}/reportForm/list/sentToLeader1ReportForm">需要分管领导批复的报审表</a></li>
				<li><a href="${contextPath}/reportForm/list/rejectedByLeader2ReportForm">未通过主要领导审核的报审表</a></li>
				<li><a href="${contextPath}/reportForm/list/sentToOfficeReportForm">发送到办公室的报审表<br/>(通过主要领导的审核)</a></li>
			</c:if>
			<c:if test="${currentUser.privilege == 'LEADER2'}">
				<li><a href="${contextPath}/reportForm/list/sentToLeader2ReportForm">需要主要领导批复的报审表</a></li>
			</c:if>
			<c:if test="${currentUser.privilege == 'OFFICE'}">
				<li><a href="${contextPath}/reportForm/list/sentToOfficeReportForm">发送到办公室的报审表<br/>(通过主要领导的审核)</a></li>
				<li><a href="${contextPath}/reportForm/list/passedReportForm">发送回报审单位的报审表<br/>(完成报审)</a></li>
			</c:if>
	     </ul>
	  </c:if>
     <a href="#" class="nav-header" ><i class="icon-comment"></i>常见问题</a>
 </div>