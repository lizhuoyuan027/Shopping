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
				<div class="col-sm-4 col-sm-offset-3">
					<div class="login-form"><!--login form-->
						<h2>你好，请登录</h2>
						<form id="formLogin" action="ajaxLogin.html" method="post">
							<div>
								<input name="name" placeholder="用户名" />
								<input name="password" type="password" placeholder="密码" />
								<label id="error" style="display:none;"></label>
							</div>
							<span>
								<input id="save" type="checkbox" class="checkbox"> 
								请记住我
							</span>
							<button type="submit" class="btn btn-default">登录</button>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
<jsp:include page="userfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

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
	var url = "<c:url value="/index.html" />";
	//'data'是一个json对象，从服务器返回的.
	//显示错误信息
	if (data.msg == "noUser") {
		$("#error").html("用户名不存在").show();
	}
	if (data.msg == "noPassword") {
		$("#error").html("密码不正确").show();
	} else if (data.msg == "success") {
		window.location.href = url;
	}
}

$().ready(
	function() {
	//------------------Cookie插件--------------------------
	var COOKIE_NAME = 'name';
	var COOKIE_PASS = 'password';
	if( $.cookie(COOKIE_NAME)!="null" && $.cookie(COOKIE_PASS)!="null" ){
		$("input[name='name']").val(  $.cookie(COOKIE_NAME) );
		$("input[name='password']").val(  $.cookie(COOKIE_PASS) );
	}
	$("#save").click(function(){
		if(this.checked){
			$.cookie(COOKIE_NAME, $("input[name='name']").val() , { path: '/', expires: 7 });
			$.cookie(COOKIE_PASS, $("input[name='password']").val() , { path: '/', expires: 7 });
		}else{
			$.cookie(COOKIE_NAME, null, { path: '/' });
			$.cookie(COOKIE_PASS, null, { path: '/' });
		}
	});
});
</script>
