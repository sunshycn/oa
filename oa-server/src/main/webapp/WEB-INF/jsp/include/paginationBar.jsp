<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="paginationBar">
	<li>
		一共  ${page.total} 条记录
	</li>
	<c:if test="${page.pages > 1}">
	    <li style="float:right">
	    	<c:if test="${page.currentPage != 1}">	
	    		<a href="${paginationPreUrl}${1}">首页</a>
	    	</c:if>
	    	<c:if test="${page.currentPage > 1}">
	            <a href="${paginationPreUrl}${page.currentPage - 1}">上一页</a>
	        </c:if> 
	        <c:if test="${page.lastBegin > 0}">
	            <a href="${paginationPreUrl}${page.lastBegin}">...</a>
	        </c:if> <c:forEach begin="${page.begin}" end="${page.end < page.pages ? page.end : page.pages}" step="1" var="pageIndex">
	            <c:choose>
	                <c:when test="${page.currentPage != pageIndex}">
	                    <a href="${paginationPreUrl}${pageIndex}">${pageIndex}</a>
	                </c:when>
	                <c:otherwise>
	                    <span class="catBold">${pageIndex}</span>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach> <c:if test="${page.nextBegin > 0}">
	            <a href="${paginationPreUrl}${page.nextBegin}">...</a>
	        </c:if> <c:if test="${page.currentPage < page.pages}">
	            <a href="${paginationPreUrl}${page.currentPage + 1}">下一页</a>
	        </c:if>
	        <c:if test="${page.currentPage != page.pages}">	
	    		<a href="${paginationPreUrl}${page.pages}">尾页</a>
	    	</c:if>
	    </li>
    </c:if>
</ul>
