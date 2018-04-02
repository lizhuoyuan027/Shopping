<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getParameter("path");
%>

<header id="header">
	<!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> +18818216470</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>
									lizhuoyuan027@163.com</a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="index.html"><span>E</span>-Shop</a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<c:if test="${!empty userSession}">
						        <li><a href="account.html"><i class="fa fa-user"></i> ${userSession.name}</a></li>
								<li><a href="#"><i class="fa fa-star"></i> VIP${userSession.level}</a></li>
								<li><a href="order.html"><i class="fa fa-shopping-cart"></i>
										我的订单</a></li>
								<li><a href="logout.html"><i class="fa fa-lock"></i>
										注销</a></li>
						    </c:if>
						    <c:if test="${empty userSession}">
								<li><a href="login.html"><i class="fa fa-lock"></i>
										登录</a></li>
						    </c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="index.html" class="active">Home</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<form id="formSearch" action="search.html" method="post">
							<input type="text" name="key" placeholder="Search" />
							<img src="<%=path%>/eshop/images/home/searchicon.png" onclick="search()"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom-->
</header>
<!--/header-->

<script>
function search() {
	var key = $("input[name='key']").val();
	if(key==null || key=="") {
		alert("请输入搜索关键字");
	} else {
		$("#formSearch").submit();
	}
}
</script>