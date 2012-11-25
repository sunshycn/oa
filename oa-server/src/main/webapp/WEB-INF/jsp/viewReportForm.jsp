<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="报审表信息"/>
<%@ include file="blue/pageHead.jsp" %>

<!-- Start content  -->
    <div class="content">
        <ul class="breadcrumb">
            <li><a href="${contextPath}">主页</a> <span class="divider">/</span></li>
            <li><a href="${contextPath}/reportForm">报审事项管理</a><span class="divider">/</span></li>
            <li class="active">${pageTitle}</li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
			 	<div class="block">
					<a href="#tablewidget1" class="block-heading" data-toggle="collapse">报审表信息</a>
					<div id="tablewidget1" class="block-body in collapse" style="height: auto;">
					 	<table class="table">
					 		<tr>
					 			<td>
									#: 
								</td>
								<td>
									${reportForm.id}
								</td>
							</tr>
							<tr><td>报审表类型:</td><td>${reportForm.reportFormType.name}</td></tr>
							<tr><td>报审单名称：</td><td>${reportForm.title}</td></tr>
							<tr><td>编号：</td><td>${reportForm.formId}</td></tr>
							<tr><td>用地（受让）单位：</td><td>${reportForm.landUser}</td></tr>
							<tr><td>原土地使用者：</td><td>${reportForm.originalLandUser}</td></tr>
							<tr><td>土地座落：</td><td> ${reportForm.landLocation}</td></tr>
							<tr><td>用地面积：</td><td>${reportForm.landArea} 
								<c:choose>
									<c:when test="${reportForm.landAreaMeasure == 'MU'}">亩</c:when>
									<c:when test="${reportForm.landAreaMeasure == 'SQUARE_METER'}">平方米</c:when>
									<c:when test="${reportForm.landAreaMeasure == 'HECTARE'}">公顷</c:when>
									<c:otherwise>平方公里</c:otherwise>
								</c:choose>
							</td></tr>
							<tr><td>规划用途： </td><td>${reportForm.landUse}</td></tr>
							<tr><td>原用途：</td><td> ${reportForm.originalLandUse}</td></tr>
							<tr><td>报审事项：</td><td>${reportForm.matter}</td></tr>
							<tr><td>报审事项细节：</td><td><textarea name="matterDetail" rows="5" cols="100">${reportForm.matterDetail}</textarea></td></tr>
							<tr><td>办理依据：</td><td><textarea name="policyBasis" rows="5" cols="100">${reportForm.policyBasis}</textarea></td></tr>
							<tr><td>报审单位意见：</td><td><textarea name="comment" rows="5" cols="100">${reportForm.comment}</textarea></td></tr>
							<tr><td>单位主要负责人：</td><td>${reportForm.responsiblePerson}</td></tr>
							<tr><td>审核人：</td><td>${reportForm.auditor}</td></tr>
							<tr><td>制表人：</td><td>${reportForm.tabulator}</td></tr>
						</table>
					</div>
				</div>
				<div class="block">
					<a href="#tablewidget" class="block-heading" data-toggle="collapse">当前已有的回复</a>
					<div id="tablewidget" class="block-body in collapse" style="height: auto;">
						<table class="table"> 
							<thead>
							<tr>
								<td>回复部门（人）</td>
								<td>日期</td>
								<td>签名</td>
								<td>回复内容</td>
							</tr>
							</thead>
							<tbody>
								<c:forEach var="feedback" items="${feedbackList}">	
								<tr>
									<c:choose>
										<c:when test="${feedback.owner =='LEADER1'}"><td>分管领导</td></c:when>
										<c:when test="${feedback.owner =='LEADER2'}"><td>主要领导</td></c:when>
										<c:when test="${feedback.owner =='OFFICE'}"><td>办公室</td></c:when>
										<c:otherwise><td>${feedback.owner}</td></c:otherwise>
									</c:choose>
									<td>${feedback.feedbackTime}</td>
									<td>${feedback.signature}</td>
									<td><textarea name="content" rows="5" cols="50">${feedback.content}</textarea></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
	        		</div>
        		</div>
				<c:choose>
					<c:when test="${status == 'review'}">
						<form action="${contextPath}/reportForm/sendToLeader1/${reportForm.id}" method="POST">选择分管领导：<select name="leader1Id"><c:forEach var="leader1" items="${leader1List}"><option value="${leader1.id}">${leader1.username}</option></c:forEach></select><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form>
						<form action="${contextPath}/reportForm/reCreateReportForm/${reportForm.id}" method="POST"><input type="submit" value="重新生成报审表"></input></form>
					</c:when>
					<c:when test="${status == 'response'}">
						<c:choose>
						  <c:when test="${not empty feedbackExistsFlag}">
						    您所代表的部门已经回复了 <br/>
						 </c:when>
						<c:otherwise>
							<form action="${contextPath}/feedback/add" method="post">
							<table>
								<tr><td><input type="hidden" name="reportFormId" value="${selectedReportForm.id}"></td></tr>
								<tr><td>回复意见：<textarea name="content" rows="5" cols="50"></textarea></td></tr>
								<c:if test="${responseType !='SENT_TO_OFFICE'}">
								<tr><td>签名：<input name="signature" type="text" maxlength="10" ></input></td></tr>
								</c:if>
									<c:choose>
										<c:when test="${responseType =='SENT_TO_ORG_UNITS'}">
										 <tr><td>回复部门： ${qualifiedOrgUnit.name}<input type="hidden" name="orgUnitId" value="${qualifiedOrgUnit.id}"></input></td></tr>
										 <tr><td><input type="submit" value="回复" onclick="return confirm('确认回复?');" /></td></tr>
										</c:when>
										
										<c:when test="${responseType =='SENT_TO_LEADER1' || responseType=='REJECTED_BY_LEADER2'}">
												<input type="hidden" name="currentReceiverId" value="${selectedReportForm.currentReceiverId}">
												<tr><td><select name="agree"><option value="true">同意</option><option value="false">不同意</option></select></td></tr>
												<tr><td>选择要发给的主要领导： <select name="leader2Id"><c:forEach var="leader2" items="${leader2List}"><option value="${leader2.id}">${leader2.username}</option></c:forEach></select></td></tr>
												<tr><td><input type="submit" value="回复" onclick="return confirm('确认回复?');" />若同意则发送给所选主要领导，不同意则发回报审单位</td></tr>
										</c:when>
										<c:when test="${responseType =='SENT_TO_LEADER2'}">
												<input type="hidden" name="currentReceiverId" value="${selectedReportForm.currentReceiverId}">
												<tr><td><select name="agree"><option value="true">同意</option><option value="false">不同意</option></select></td></tr>
												<tr><td><input type="submit" value="回复" onclick="return confirm('确认回复?');" />若同意则发送到办公室，并通知分管领导，不同意则发回分管领导</td></tr>
										</c:when>
										<c:when test="${responseType =='SENT_TO_OFFICE'}"> <tr><td><input type="submit" value="回复" onclick="return confirm('确认回复?');" /></td></tr></c:when>
									<c:otherwise>?</c:otherwise>
									</c:choose>	
							</table>
						   </form>
						</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
                <%@ include file="blue/containerFoot.jsp" %>
        	</div>
		<!-- End container -->
    	</div>
	</div>
<!-- End content -->
<%@ include file="blue/pageTail.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
    	$("form").submit(function() {
            var errors = [];
           /*  if ($.trim($("textarea[name='content']").val()).length == 0) {
                errors.push("请填写回复意见");
            }
            if ($.trim($("input[name='signature']").val()).length == 0) {
                errors.push("请填写签名");
            } */
            if (errors.length > 0) {
                alert(errors.join(", "));
                return false;
            }
        });
    });
</script>