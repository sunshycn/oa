<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pagination">
	<ul>
		<li>
			<a href="javascript:void(0);">一共  ${page.total} 条记录</a>
		</li>
	</ul>
	<ul style="float:right">
		<c:if test="${page.pages > 1}">
	    	<c:if test="${page.currentPage != 1}">	
	    		 <li><a href="${paginationPreUrl}${1}">首页</a></li>
	    	</c:if>
	    	<c:if test="${page.currentPage > 1}">
	            <li><a href="${paginationPreUrl}${page.currentPage - 1}">上一页</a></li>
	        </c:if> 
	        <c:if test="${page.lastBegin > 0}">
	            <li><a href="${paginationPreUrl}${page.lastBegin}">...</a></li>
	        </c:if> <c:forEach begin="${page.begin}" end="${page.end < page.pages ? page.end : page.pages}" step="1" var="pageIndex">
	            <c:choose>
	                <c:when test="${page.currentPage != pageIndex}">
	                    <li><a href="${paginationPreUrl}${pageIndex}">${pageIndex}</a></li>
	                </c:when>
	                <c:otherwise>
	                     <li><span class="catBold">${pageIndex}</span></li>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach> <c:if test="${page.nextBegin > 0}">
	             <li><a href="${paginationPreUrl}${page.nextBegin}">...</a></li>
	        </c:if> <c:if test="${page.currentPage < page.pages}">
	             <li><a href="${paginationPreUrl}${page.currentPage + 1}">下一页</a></li>
	        </c:if>
	        <c:if test="${page.currentPage != page.pages}">	
	    		 <li><a href="${paginationPreUrl}${page.pages}">尾页</a></li>
	    	</c:if>
	    </c:if>
	</ul>
</div>

