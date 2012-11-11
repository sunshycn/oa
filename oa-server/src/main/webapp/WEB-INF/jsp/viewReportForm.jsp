<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>报审表信息</title>
 <script type="text/javascript">
        $(document).ready(function(){
        	$("form").submit(function() {
                var errors = [];
                if ($.trim($("textarea[name='content']").val()).length == 0) {
                    errors.push("请填写回复意见");
                }
                if ($.trim($("input[name='signature']").val()).length == 0) {
                    errors.push("请填写签名");
                }
                if (errors.length > 0) {
                    alert(errors.join(", "));
                    return false;
                }
            });
        });
</script>
</head>
<body>
 	<h2>报审表信息</h2>
 		
	ID: ${reportForm.id}<br/>
	报审表类型：${reportForm.reportFormType.name}<br/>
	报审单名称：${reportForm.title}<br/>
	编号：${reportForm.formId}<br/>
	用地（受让）单位：${reportForm.landUser}<br/>
	原土地使用者：${reportForm.originalLandUser}<br/>
	土地座落： ${reportForm.landLocation}<br/>
	用地面积：${reportForm.landArea} 
	<c:choose>
		<c:when test="${reportForm.landAreaMeasure == 'MU'}">亩</c:when>
		<c:when test="${reportForm.landAreaMeasure == 'SQUARE_METER'}">平方米</c:when>
		<c:when test="${reportForm.landAreaMeasure == 'HECTARE'}">公顷</c:when>
		<c:otherwise>平方公里</c:otherwise>
	</c:choose>
	<br/>
	规划用途： ${reportForm.landUse}<br/>
	原用途： ${reportForm.originalLandUse}<br/>
	报审事项：${reportForm.matter}<br/>
	报审事项细节：<textarea name="matterDetail" rows="10" cols="50">${reportForm.matterDetail}</textarea><br/>
	办理依据：<textarea name="policyBasis" rows="5" cols="50">${reportForm.policyBasis}</textarea><br/>
	报审单位意见：<textarea name="comment" rows="5" cols="50">${reportForm.comment}</textarea><br/>
	单位主要负责人：${reportForm.responsiblePerson}<br/>
	审核人：${reportForm.auditor}<br/>
	制表人：${reportForm.tabulator}<br/>
	<br/>
	当前已有的回复：<br/>
	<table border="1"> 
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
				<td>${feedback.owner}</td>
				<td>${feedback.feedbackTime}</td>
				<td>${feedback.signature}</td>
				<td><textarea name="content" rows="5" cols="50">${feedback.content}</textarea></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:choose>
	<c:when test="${status == 'review'}">
		<form action="${contextPath}/reportForm/sendToLeader1/${reportForm.id}" method="POST">选择分管领导：<select name="leader1Id"><option></option><c:forEach var="leader1" items="${leader1List}"><option value="${leader1.id}">${leader1.username}</option></c:forEach></select><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form>
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
				<tr><td>
					<c:choose>
						<c:when test="${responseType =='SENT_TO_ORG_UNITS'}">
						 <tr><td>回复部门： ${qualifiedOrgUnit.name}<input type="hidden" name="orgUnitId" value="${qualifiedOrgUnit.id}"></input></td></tr>
						</c:when>
						
						<c:when test="${responseType =='SENT_TO_LEADER1'}">
								<input type="hidden" name="currentReceiverId" value="${selectedReportForm.currentReceiverId}">
								<tr><td>选择要发给的主要领导： <select name="leader2Id"><option></option><c:forEach var="leader2" items="${leader2List}"><option value="${leader2.id}">${leader2.username}</option></c:forEach></select></td></tr>
						</c:when>
						<c:when test="${responseType =='SENT_TO_LEADER2'}">
								<input type="hidden" name="currentReceiverId" value="${selectedReportForm.currentReceiverId}">
						</c:when>
						<c:when test="${responseType =='SENT_TO_OFFICE'}"></c:when>
					<c:otherwise>?</c:otherwise>
					</c:choose>
				</td></tr>
				<tr><td><input type="submit" value="回复" /></td></tr>
			</table>
		   </form>
		</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise></c:otherwise>
	</c:choose>
	<a href="${contextPath}/reportForm">返回报审表管理</a><br>

</body>
</html>