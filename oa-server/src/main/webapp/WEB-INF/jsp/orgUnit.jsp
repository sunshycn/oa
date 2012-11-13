<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="${cssRootPath}/app.css" rel="stylesheet" type="text/css" />
		<meta charset="UTF-8">
		<title>单位管理</title>
	</head>
	<body>
		<h2>单位管理</h2>
		<a href="${contextPath}/">返回主页</a><br>
		<a href="${contextPath}/orgUnit/addOrgUnit">新增单位</a>
		<table border="1">
			<thead>
			<tr>
				<td>ID</td>
				<td>单位名</td>
				<td>描述</td>
				<td colspan="2">操作</td>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="orgUnit" items="${orgUnitPage.content}">	
					<tr>
						<td>${orgUnit.id}</td>
						<td>${orgUnit.name}</td>
						<td>${orgUnit.description}</td>
						<td><form action="${contextPath}/orgUnit/delete/${orgUnit.id}" method="POST"><input type="submit" value="删除" onclick="return confirm('确认删除');"></input></form></td>
						<td><form action="${contextPath}/orgUnit/editOrgUnit/${orgUnit.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<ul class="paginationBar">
							<li>
								一共  ${page.total} 个单位
							</li>
						    <li style="float:right">
						    	<c:if test="${page.currentPage > 1}">
						            <a href="${contextPath}/orgUnit/${page.currentPage - 1}">上一页</a>
						        </c:if> <c:if test="${page.lastBegin > 0}">
						            <a href="${contextPath}/orgUnit/${page.lastBegin}">...</a>
						        </c:if> <c:forEach begin="${page.begin}" end="${page.end < page.pages ? page.end : page.pages}" step="1" var="pageIndex">
						            <c:choose>
						                <c:when test="${page.currentPage != pageIndex}">
						                    <a href="${contextPath}/orgUnit/${pageIndex}">${pageIndex}</a>
						                </c:when>
						                <c:otherwise>
						                    <span class="catBold">${pageIndex}</span>
						                </c:otherwise>
						            </c:choose>
						        </c:forEach> <c:if test="${page.nextBegin > 0}">
						            <a href="${contextPath}/orgUnit/${page.nextBegin}">...</a>
						        </c:if> <c:if test="${page.currentPage < page.pages}">
						            <a href="${contextPath}/orgUnit/${page.currentPage + 1}">下一页</a>
						        </c:if>
						    </li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>