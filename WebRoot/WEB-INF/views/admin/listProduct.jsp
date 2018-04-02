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
		<ol class="breadcrumb">
	        <li><a href="admin_listCategory.html">所有类别</a></li>
	        <li class="active">${category.name}</a></li>
	    </ol>
	    
		<table
                class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="danger">
                <th width="80px">商品ID</th>
                <th>图片</th>
                <th>商品名称</th>
                <th>商品详细</th>
                <th width="80px">价格</th>
                <th width="80px">库存数量</th>
                <th width="42px">编辑</th>
                <th width="42px">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>
                        <img width="40px" src="<%=path%>/eshop/images/product/${product.id}.jpg">
                    </td>
                    <td>${product.name}</td>
                    <td>${product.detail}</td>
                    <td>${product.price}</td>
                    <td>${product.stock}</td>
                    <td><a href="admin_editProduct.html?id=${product.id}"><span
                            class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true"
                           href="admin_deleteProduct.html?id=${product.id}&cid=${category.id}"><span
                            class="     glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加商品</button>
        
		<jsp:include page="../util/page.jsp"><jsp:param name="param" value="&cid=${category.id}" /></jsp:include>
	
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
					添加商品
				</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="formAdd" action="admin_addProduct.html" method="post" enctype="multipart/form-data" >
					<div class="form-group">
						<input class ="form-control" name="name" placeholder="商品名称" />
					</div>
					<div class="form-group">
						<textarea class ="form-control" name="detail" placeholder="商品详情" rows="3"></textarea>
					</div>
					<div class="form-group">
						<input class ="form-control" name="price" placeholder="商品单价" />
					</div>
					<div class="form-group">
						<input class ="form-control" name="stock" placeholder="商品库存" />
					</div>
					<input type="file" name="image" id="image">
					<label style="display:none;" id="error"></label>
					<input type="hidden" name="cid" value="${category.id}">
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
$().ready(function() {
	$("#add").click(function(){
		var file = $("#image").val();
		if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file)) {
			$("#error").html("请上传正确的图片格式").show();
		} else {
			$("#formAdd").submit();
		}
	});
	
	$("a").click(function() {
		var deleteLink = $(this).attr("deleteLink");
		console.log(deleteLink);
		if ("true" == deleteLink) {
			var confirmDelete = confirm("确认删除？");
			if (confirmDelete)
				return true;
			return false;
		}
	});

//----------------validate插件验证------------------ 	
	$("#formAdd").validate({
		//规则
		rules : {
			name : {required:true},
			price : {required:true, number:true, min:0},
			stock : {required:true, digits:true, min:0},
		},
		//提示信息
		messages : {
			name : {
				required : '请输入商品名称',
			},
			price : {
				required : '请输入商品单价',
				number : '价格必须为数字',
				min : '价格不能为负数',
			},
			stock : {
				required : '请输入商品库存',
				digits : '库存必须为整数',
				min : '库存不能为负数',
			},
		},
	});
});
</script>