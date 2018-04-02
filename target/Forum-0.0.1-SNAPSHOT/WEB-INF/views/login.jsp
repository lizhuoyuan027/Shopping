<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户登录 - 上海大学乐乎社区论坛（BBS） - 热爱分享 享受成长</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- 引入jquery -->
<script type="text/javascript" src="../scripts/jquery-3.1.1.min.js"></script>
<!-- 引入jquery validate插件 -->
<script type="text/javascript" src="../scripts/jquery.validate.min.js"></script>
<!-- 引入jquery form插件 -->
<script type="text/javascript" src="../scripts/jquery.form.js"></script>
<!-- 引入css样式 -->
<link media="all" href="../skins/login/index.css" type="text/css"
	rel="stylesheet">

<!-- 表单验证 -->
<script type="text/javascript">
	$(document).ready(function(){
		//-----------validate插件验证----------
		$("#formLogin").validate({
			//规则
			rules: {
				username:"required",
				password:"required"
			},
			//提示信息
			messages: {
				username: {
					required: '请输入姓名',
				},
				password: {
				required: '请输入密码',
				},
			},
			//验证信息
			errorElement: "em", //可以用其他标签，记住把样式也对应修改
			success: function(label) {
				//label指向上面那个错误提示信息标签em
				label.text(" ")				//清空错误提示消息
					.addClass("success");	//加上自定义的success类
			}
		});
		
		//--------form插件提交表单---------
		//设置参数
		var options = {
			beforeSubmit : showRequest, // 提交前
			success : showResponse, // 提交后 
			error : errorResponse,
			url : "<c:url value="/login/doLoginAjax.do" />", //Ajax的跳转页面(js中可嵌套jstl)
			dataType : 'json', //接受服务端返回的类型
		};
		//提交表单
		$('#formLogin').ajaxForm(options);
	});
	// 提交前
	function showRequest(formData, jqForm, options) {
		// formdata是数组对象,在这里，我们使用$.param()方法把他转化为字符串.
		var queryString = $.param(formData); //组装数据，插件会自动提交数据(之后在controller中不用再使用@RequestBody)
		alert(queryString); //测试
		return true;
	}
	//  提交后
	function showResponse(data) {
		//'data'是一个json对象，从服务器返回的.
//		alert(data.msg); //测试
		alert("返回数据成功");
	}
	function errorResponse(xhr,status,error) {
		alert("error:"+error); //数据失败测试
	}
</script>
</head>

<!-- class选择器 -->
<body class="havebg">
	<!-- id选择器 -->
	<div id="wrap">
		<div id="head"></div>
		<div id="main">
			<div id="m_ext">
				<div id="login-outer">
					<!-- 上传表单 -->
					<form name="formLogin" id="formLogin"
						action="<c:url value="/login/doLogin.html" />" method="post">
						<table class="login-panel" width="100%" cellspacing="0"
							cellpadding="8" border="0" align="center">
							<tbody>
								<tr>
									<!-- 超链接到图片 href="#"默认为跳转到页面顶部 -->
									<td class="rBorder" width="35%" valign="top"><a href="#"
										class="logo"></a>
										<div class="cl"></div></td>
									<!-- valign="top"垂直对齐方式:顶端对齐 -->
									<td width="3%" valign="top">&nbsp;</td>
									<td valign="top"><h3>登录上海大学乐乎社区(本系统支持上海大学一卡通身份认证)</h3>
										<table width="100%" cellspacing="0" cellpadding="0" border="0">
											<tbody>
												<tr>
													<!-- 输入用户名 -->
													<td><label for="username">昵称/学工号</label></td>
													<td><em>*</em><input name="username" id="username"
														class="inp-login" tabindex="1"
														style="border-color: rgb(204, 204, 204);" value=""
														type="text">

														<div id="e_username" class="msg"></div></td>
												</tr>
												<tr>
													<!-- 输入密码 -->
													<td><label for="password">密码/一卡通密码</label></td>
													<td><em>*</em><input name="password" id="password"
														class="inp-login" tabindex="2"
														style="border-color: rgb(204, 204, 204);" type="password">

														<div id="e_password" class="msg"></div></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<!-- 下次自动登录 -->
													<td><input name="save" id="save" value="true"
														tabindex="3" type="checkbox"> <label for="save"
														class="inline">下次自动登录</label></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<!-- 登录按钮 -->
													<td><input class="btn" value="登  录"
														tabindex="4" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<!-- 忘记密码 -->
													<td><a
														href="http://passport.lehu.shu.edu.cn/GetPassword.aspx">忘记密码?</a>
													</td>
												</tr>
												<tr>
													<td colspan="2" align="left"><hr></td>
												</tr>
												<tr>
													<td colspan="2"><h3>还没有注册上海大学乐乎帐号？</h3></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<!-- 免费注册 -->
													<td><input name="button" class="btn"
														onclick="location.href='Register.aspx?lasturl=http%3a%2f%2fbbs.lehu.shu.edu.cn%2fdefault.aspx';"
														value="免费注册" type="button"></td>
												</tr>
											</tbody>
										</table></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<hr size="1" noshade="noshade">
			<!-- 页尾信息 -->
			<span>上海大学 | 上海大学乐乎社区论坛(BBS) | 2017.1.3建站 </span><br> <span>沪ICP备09014157</span>
		</div>
	</div>
</body>
</html>
