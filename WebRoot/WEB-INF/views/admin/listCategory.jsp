<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="adminheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="adminTop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<div class="workingArea">
	<div class="col-sm-2">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#">类别管理</a></li>
			<li><a href="admin_listOrder.html">订单管理</a></li>
		</ul>
	</div>

	<div class="col-sm-10">
		<table class="table table-striped table-bordered table-hover">
            <thead>
            <tr class="danger">
                <th>类别ID</th>
                <th>类别名称</th>
                <th>商品管理</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="category">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>

                    <td><a href="admin_listProduct.html?cid=${category.id}">
                        <span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                    <td><a href="admin_editCategory.html?id=${category.id}">
                        <span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a href="admin_deleteCategory.html?id=${category.id}" deleteLink="true">
                        <span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加类别</button>
        
        <jsp:include page="../util/page.jsp"><jsp:param name="param" value="" /></jsp:include>
	</div>	
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加类别
				</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="formAdd" action="admin_addCategory.html" method="post">
					<div class="form-group">
						<input class ="form-control" name="name" placeholder="类别名称" />
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="add">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<jsp:include page="adminfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function(){
	$("#add").click(function(){
		$("#formAdd").submit();
	});
	
	$("a").click(function() {
		var deleteLink = $(this).attr("deleteLink");
		console.log(deleteLink);
		if ("true" == deleteLink) {
			var confirmDelete = confirm("将删除该类别的所有商品，确认删除？");
			if (confirmDelete)
				return true;
			return false;
		}
	});
});
</script>