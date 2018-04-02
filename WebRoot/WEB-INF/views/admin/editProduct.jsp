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

	<div class="col-sm-4">
    <ol class="breadcrumb">
        <li><a href="admin_listCategory.html">所有类别</a></li>
        <li><a href="admin_listProduct.html?cid=${category.id}">${category.name}</a></li>
        <li class="active">编辑商品</li>
    </ol>

    <div class="panel panel-danger editDiv">
        <div class="panel-heading">编辑商品</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_updateProduct.html" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>商品名称</td>
                        <td><input name="name" value="${product.name}"
                                   class="form-control" /></td>
                    </tr>
                    <tr>
                        <td>商品详细</td>
                        <td><textarea name="detail" type="text"
                                   class="form-control" rows="3">${product.detail}</textarea></td>
                    </tr>
                    <tr>
                        <td>价格</td>
                        <td><input value="${product.price}" name="price" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input value="${product.stock}" name="stock" type="text"
                                   class="form-control"></td>
                    </tr>
                    <tr>
						<td>更改图片</td>
						<td><input type="file" name="image" id="image" class="form-control">
						<label style="display:none;" id="error"></label></td>
						
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="hidden" name="cid" value="${category.id}">
                            <button type="submit" class="btn btn-primary" id="edit">提 交</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </div>
</div>

<jsp:include page="adminfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function(){
	$("#edit").click(function(){
		var file = $("#image").val();
		if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file) && file!="") {
			$("#error").html("请上传正确的图片格式").show();
			return false;
		} else {
			return true;
		}
	});
	
	//----------------validate插件验证------------------ 	
	$("#editForm").validate({
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