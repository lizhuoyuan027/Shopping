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
			<li class="active"><a href="#">用户管理</a></li>
		</ul>
	</div>

	<div class="col-sm-10">
		<table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <tr class="danger">
                <th>用户ID</th>
                <th>用户类别</th>
                <th>用户名称</th>
                <th>用户等级</th>
                <th>修改等级</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>
                    	<c:if test="${user.usertype==1}">
                    		普通用户
                    	</c:if>
                    	<c:if test="${user.usertype==2}">
                    		销售商
                    	</c:if>
                    	<c:if test="${user.usertype==3}">
                    		管理员
                    	</c:if>
                    </td>
                    <td>${user.name}</td>
                    <td>VIP${user.level}</td>
                    <td><a href="javascript:void(0);" onclick="editTrans(${user.id},${user.level})" data-toggle="modal" data-target="#editModal">
                    		<span class="glyphicon glyphicon-edit"></span></a></td>
                    <td>
                    	<c:if test="${user.usertype==1}">
                    		<a href="javascript:void(0);" onclick="deleteClick(${user.id})">
                    			<span class="glyphicon glyphicon-trash"></span></a>
                    	</c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加普通用户</button>
	
		<jsp:include page="../util/page.jsp"><jsp:param name="param" value="" /></jsp:include>
	
	</div>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form role="form" id="formAdd" action="admin_ajaxAddUser.html" method="post">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						添加普通用户
					</h4>
				</div>
				<div class="modal-body">
						<div class="form-group">
							<input class ="form-control" name="name" placeholder="用户名" />
							<label id="error" style="display:none;"></label>
						</div>
						<div class="form-group">
							<input class ="form-control" name="password" type="password" placeholder="密码" />
						</div>
						<div class="form-group">
							<input class ="form-control" name="confirmPassword" type="password" placeholder="确认密码"/>
						</div>
						<div class="form-group">
							<select class="form-control" name="level">
								<option value="1">VIP1</option>
								<option value="2">VIP2</option>
								<option value="3">VIP3</option>
								<option value="4">VIP4</option>
								<option value="5">VIP5</option>
								<option value="6">VIP6</option>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">
						提交
					</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form role="form" id="formEdit" action="admin_editUser.html" method="post">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改用户等级
					</h4>
				</div>
				<div class="modal-body">
						<div class="form-group">
							<select class="form-control" name="level">
								<option value="1">VIP1</option>
								<option value="2">VIP2</option>
								<option value="3">VIP3</option>
								<option value="4">VIP4</option>
								<option value="5">VIP5</option>
								<option value="6">VIP6</option>
							</select>
							<input type="hidden" name="id" />
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">
						提交
					</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<jsp:include page="adminfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function(){
	//----------------validate插件验证------------------ 	
	$("#formAdd").validate({
		//规则
		rules : {
			name : {required:true, charFilter:true},
			password : {required:true, charFilter:true},
			confirmPassword : {required:true, charFilter:true, equalTo:"[name='password']"},
		},
		//提示信息
		messages : {
			name : {
				required : '请输入用户名',
			},
			password : {
				required : '请输入密码',
			},
			confirmPassword : {
				required : '请再次输入密码',
				equalTo: '两次密码不一致',
			},
		},
	});
	
	//设置参数
	var options = {
		beforeSubmit : showRequest, // 提交前
		success : showResponse, // 提交后 
		//error : errorResponse, //失败测试
		dataType : 'json', //接受服务端返回的类型
	};
	//提交表单
	$('#formAdd').ajaxForm(options);
});
// 提交前
function showRequest(formData, jqForm, options) {
	// formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
	var queryString = $.param(formData); //组装数据，插件会自动提交数据(之后在controller中不用再使用@RequestBody)
	//alert(queryString); //测试
	return true;
}
//  提交后
function showResponse(data) {
	var url = "<c:url value="/admin_listUser.html" />";
	//'data'是一个json对象，从服务器返回的.
	//显示错误信息
	if (data.msg == "hasUser") {
		$("#error").html("用户名已存在").show();
	} else if (data.msg == "success") {
		window.location.href = url;
	}
}

//修改用户等级
function editTrans(id, level) {
	$("[name='id']").val(id);
}

//删除用户
function deleteClick(id) {
	var confirmDelete = confirm("确认删除？");
	if (confirmDelete) {
		$.ajax({
			type: "POST",
			url: "<c:url value="/admin_ajaxDeleteUser.html"/>",
			data: {
				uid : id
			},
			dataType: "json",
			success: response,
		});
	}
}

function response(data) {
	var url = "<c:url value="/admin_listUser.html" />";
	if (data.msg == "error") {
		alert("该用户有相关订单，无法删除");
	} else if (data.msg == "success") {
		window.location.href = url;
	}
}
</script>