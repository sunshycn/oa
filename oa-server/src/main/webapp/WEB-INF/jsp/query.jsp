<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css" />
		<meta charset="UTF-8">
		<title>查询报审表</title>
		<script type="text/javascript">
			$(document).ready(function() {
				var pageLink = $(".paginationBar a");
				pageLink.each(function() {
					var pageHref = $(this).attr("href");
					$(this).attr("href", "javascript:void(0)");
					$(this).click(function() {
						var form = $("#queryForm");
						form.attr("action", pageHref);
						form.submit();
						return false;
					});
				});
			});
		</script>
	</head>
	<body>
	   <h2>查询报审表</h2>
		<a href="${contextPath}/">返回首页</a><br/>
		任意组合三项字段进行查询，若不填写，则代表搜索全部 <br/>
		<form id="queryForm" action="${contextPath}/query" method="post">
			<table>
				<tr><td><select name="param1">
				<c:choose>
					<c:when test="${param1 == 'formId'}"><option value="formId">编号</option></c:when>
					<c:when test="${param1 == 'landUser'}"><option value="landUser">用地单位</option></c:when>
					<c:when test="${param1 == 'landLocation'}"><option value="landLocation">土地坐落</option></c:when>
					<c:when test="${param1 == 'title'}"><option value="title">报审名称</option></c:when>
					<c:when test="${param1 == 'originalLandUser'}"><option value="originalLandUser">原土地使用者</option></c:when>
				</c:choose>
				<option value="formId">编号</option><option value="landUser">用地单位</option><option value="landLocation">土地坐落</option><option value="title">报审名称</option><option value="originalLandUser">原土地使用者</option></select><input type="text" name="value1" maxlength="20" value="${value1}"/></td></tr>
				<tr><td><select name="param2">
				<c:choose>
					<c:when test="${param2 == 'formId'}"><option value="formId">编号</option></c:when>
					<c:when test="${param2 == 'landUser'}"><option value="landUser">用地单位</option></c:when>
					<c:when test="${param2 == 'landLocation'}"><option value="landLocation">土地坐落</option></c:when>
					<c:when test="${param2 == 'title'}"><option value="title">报审名称</option></c:when>
					<c:when test="${param2 == 'originalLandUser'}"><option value="originalLandUser">原土地使用者</option></c:when>
				</c:choose>
				<option value="formId">编号</option><option value="landUser">用地单位</option><option value="landLocation">土地坐落</option><option value="title">报审名称</option><option value="originalLandUser">原土地使用者</option></select><input type="text" name="value2" maxlength="20" value="${value2}"/></td></tr>
				<tr><td><select name="param3">
				<c:choose>
					<c:when test="${param3 == 'formId'}"><option value="formId">编号</option></c:when>
					<c:when test="${param3 == 'landUser'}"><option value="landUser">用地单位</option></c:when>
					<c:when test="${param3 == 'landLocation'}"><option value="landLocation">土地坐落</option></c:when>
					<c:when test="${param3 == 'title'}"><option value="title">报审名称</option></c:when>
					<c:when test="${param3 == 'originalLandUser'}"><option value="originalLandUser">原土地使用者</option></c:when>
				</c:choose>
				<option value="formId">编号</option><option value="landUser">用地单位</option><option value="landLocation">土地坐落</option><option value="title">报审名称</option><option value="originalLandUser">原土地使用者</option></select><input type="text" name="value3" maxlength="20" value="${value3}"/></td></tr>
				<tr><td>报审表状态<select name="status">
				<c:choose>
					<c:when test="${status == 'processing'}"><option value="processing">进行中</option></c:when>
					<c:when test="${status == 'dead'}"><option value="dead">作废</option></c:when>
					<c:when test="${status == 'passed'}"><option value="passed">已完成</option></c:when>
					<c:otherwise><option value="all">所有</option></c:otherwise>
				</c:choose>
				<option value="processing">进行中</option><option value="dead">作废</option><option value="passed">已完成</option><option value="all">所有</option></select><tr><td>
				<tr><td><input type="submit" value="查询" /></td></tr>
			</table>
		</form>
		<c:if test="${not empty reportFormList}">
			<table border="1">
				<tr>
					<td>编号</td>
					<td>报审名称</td>
					<td>用地单位</td>
					<td>原用地单位</td>
					<td>土地坐落</td>
					<td>操作</td>
				</tr>
				<c:forEach var="reportForm" items="${reportFormList}">
					<tr>
						<td>${reportForm.formId}</td>
						<td>${reportForm.title}</td>
						<td>${reportForm.landUser}</td>
						<td>${reportForm.originalLandUser}</td>
						<td>${reportForm.landLocation}</td>
						<td>
							<form
								action="${contextPath}/reportForm/view/${reportForm.id}"
								method="POST">
								<input type="submit" value="详细"></input>
							</form>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						<c:set var="paginationPreUrl" value="${contextPath}/query?pages=${page.total}&currentPage=" scope="request"/>
						<jsp:include page="${jspRootPath}/include/paginationBar.jsp"/>
					</td>
				</tr>
			</table>
		</c:if>
	</body>
</html>
