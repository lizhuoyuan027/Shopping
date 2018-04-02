<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="adminheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="adminTop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-sm-4 col-sm-offset-3">
			<div class="login-form">
				<!--login form-->
				<h2>你好管理员，请登录</h2>
				<form id="formLogin" action="ajaxAdminLogin.html" method="post">
					<div>
						<input name="name" placeholder="用户名" /> 
						<input name="password" type="password" placeholder="密码" /> 
						<label id="error" style="display:none;"></label>
					</div>
					<button type="submit" class="btn btn-default">登录</button>
				</form>
			</div>
			<!--/login form-->
		</div>
	</div>
</div>

<jsp:include page="adminfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function() {
//----------------validate插件验证------------------ 
	$("#formLogin").validate({
		//规则
		rules : {
			name : {required:true, charFilter:true},
			password : {required:true, charFilter:true},
		},
		//提示信息
		messages : {
			name : {
				required : '请输入姓名',
			},
			password : {
				required : '请输入密码',
			},
		},
	});
//----------------form插件提交表单--------------------
	//设置参数
	var options = {
		beforeSubmit : showRequest, // 提交前
		success : showResponse, // 提交后 
		//error : errorResponse, //失败测试
		dataType : 'json', //接受服务端返回的类型
	};
	//提交表单
	$('#formLogin').ajaxForm(options);
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
	var urlSaler = "<c:url value="/admin_listCategory.html" />";
	var urlAdmin = "<c:url value="/admin_listUser.html" />";
	//'data'是一个json对象，从服务器返回的.
	//显示错误信息
	if (data.msg == "noUser") {
		$("#error").html("用户名不存在").show();
	} else if (data.msg == "noPassword") {
		$("#error").html("密码不正确").show();
	} else if (data.msg == "noAdmin") {
		$("#error").html("您不是供货商/管理员").show();
	} else if (data.msg == "successSaler") {
		window.location.href = urlSaler;
	} else if (data.msg == "successAdmin") {
		window.location.href = urlAdmin;
	}
}
</script>