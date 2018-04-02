<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String param = request.getParameter("param");
%>
<div class="col-sm-12" style="text-align:center;">
    <ul class="pagination">
        <li <c:if test="${!pageInfo.hasPreviousPage}">class="disabled"</c:if>>
            <a  href="?page=1<%=param%>">
                &laquo;
            </a>
        </li>

        <li <c:if test="${!pageInfo.hasPreviousPage}">class="disabled"</c:if>>
            <a  href="?page=${pageInfo.prePage}<%=param%>">
                &lsaquo;
            </a>
        </li>

		<li class="disabled">
			<a class="current">${pageInfo.pageNum}</a>
		</li>

		<li <c:if test="${!pageInfo.hasNextPage}">class="disabled"</c:if>>
            <a href="?page=${pageInfo.nextPage}<%=param%>">
                &rsaquo;
            </a>
        </li>
        <li <c:if test="${!pageInfo.hasNextPage}">class="disabled"</c:if>>
            <a href="?page=${pageInfo.lastPage}<%=param%>">
                &raquo;
            </a>
        </li>
    </ul>
</div>

<script>
    $(function(){
        $("ul.pagination li.disabled a").click(function(){
            return false;
        });
    });
</script>
