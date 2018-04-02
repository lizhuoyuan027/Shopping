<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="userheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="usertop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>修改个人信息</h2>
						<form id="formAccount" action="ajaxUserUpdate.html" method="post">
							<div>
								<div>详细地址<textarea name="address" placeholder="请填写详细收货地址，例如街道、门牌号、楼层、房间号等信息" rows="2"></textarea></div>
								<div>收货人<input name="receiver" placeholder="前填写收货人姓名" /></div>
								<div>联系方式<input name="mobile" placeholder="请填写手机号" /></div>
								<div>邮箱<input name="email" placeholder="请填写邮箱" /></div>
								<label id="errorAccount" style="display:none;"></label>
							</div>
							<button type="submit" class="btn btn-default">提交修改</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>修改密码</h2>
						<form id="formPassword" action="ajaxPasswordUpdate.html" method="post">
							<input name="newPassword" id="newPassword" type="password" placeholder="新密码" />
							<input name="confirmPassword" type="password" placeholder="确认新密码"/>
							<label id="errorPassword" style="display:none;"></label>
							<button type="submit" class="btn btn-default">提交新密码</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
<jsp:include page="userfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function() {
//修改个人信息
	var address="${userSession.address}";if(address!=null) $("textarea[name='address']").val(address);
	var receiver="${userSession.receiver}";if(receiver!=null) $("input[name='receiver']").val(receiver);
	var mobile="${userSession.mobile}";if(mobile!=null) $("input[name='mobile']").val(mobile);
	var email="${userSession.email}";if(email!=null) $("input[name='email']").val(email);
//----------------validate插件验证------------------ 	
	$("#formAccount").validate({
		//规则
		rules : {
			address : {required:true, charFilter:true},
			receiver : {required:true, charFilter:true},
			mobile : {required:true, isMobile:true, charFilter:true},
			email : {required:true, email:true},
		},
		//提示信息
		messages : {
			address : {
				required : '请输入收货地址',
			},
			receiver : {
				required : '请输入收货人姓名',
			},
			mobile : {
				required : '请输入联系方式',
			},
			email : {
				required : '请输入邮箱',
				email : '请正确填写您的邮箱',
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
	$('#formAccount').ajaxForm(options);
});
// 提交前
function showRequest(formData, jqForm, options) {
	// formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
	var queryString = $.param(formData); //组装数据，插件会自动提交数据(之后在controller中不用再使用@RequestBody)
	return true;
}
//  提交后
function showResponse(data) {
	var url = "<c:url value="/index.html" />";
	//'data'是一个json对象，从服务器返回的.
	//显示错误信息
	if (data.msg == "success") {
		window.location.href = url;
	} else {
		$("#errorAccount").html("个人信息修改失败，未知错误").show();
	}
}

$().ready(function() {
//修改新密码
//----------------validate插件验证------------------ 	
	$("#formPassword").validate({
		//规则
		rules : {
			newPassword : {required:true, charFilter:true},
			confirmPassword : {required:true, charFilter:true, equalTo:"#newPassword"},
		},
		//提示信息
		messages : {
			newPassword : {
				required : '请输入新密码',
			},
			confirmPassword : {
				required : '请再次输入新密码',
				equalTo: '两次密码不一致',
			},
		},
	});
//----------------form插件提交表单--------------------
	//设置参数
	var options = {
		beforeSubmit : passwordRequest, // 提交前
		success : passwordResponse, // 提交后 
		//error : errorResponse, //失败测试
		dataType : 'json', //接受服务端返回的类型
	};
	//提交表单
	$('#formPassword').ajaxForm(options);
});
// 提交前
function passwordRequest(formData, jqForm, options) {
	// formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
	var queryString = $.param(formData); //组装数据，插件会自动提交数据(之后在controller中不用再使用@RequestBody)
	//alert(queryString); //测试
	return true;
}
//  提交后
function passwordResponse(data) {
	var url = "<c:url value="/index.html" />";
	//'data'是一个json对象，从服务器返回的.
	//显示错误信息
	if (data.msg == "success") {
		window.location.href = url;
	} else {
		$("#errorPassword").html("密码修改失败，未知错误").show();
	}
}
</script>