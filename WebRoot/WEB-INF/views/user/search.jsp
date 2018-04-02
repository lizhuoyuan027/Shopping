<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="userheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="usertop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>商品分类</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<c:forEach var="category" items="${categories}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<label class="panel-title"><a href="category.html?cid=${category.id}">${category.name}</a></label>
									</div>
								</div>
							</c:forEach>
						</div><!--/category-products-->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="<%=path%>/eshop/images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<h2 class="title text-center">请输入搜索条件</h2>
					<form action="search.html" method="post">
						<div class="row">
						<div class="col-sm-4 form-group">
							<select class="form-control" name="cid">
								<option value="0">所有商品</option>
								<c:forEach var="category" items="${categories}">
									<option value="${category.id}">${category.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-4 form-group">
							<input type="text" name="key" class="form-control" placeholder="Search" />
						</div>
						<div class="col-sm-4 form-group">
							<button type="submit" class="btn btn-primary">搜索</button>
						</div>
						</div>
					</form>
					<c:if test="${empty pageInfo.list}">
						<h2 class="title text-center">未找到符合的商品</h2>
					</c:if>
					<c:if test="${!empty pageInfo.list}">
						<h2 class="title text-center">搜索结果如下</h2>
					</c:if>
					<c:forEach var="product" items="${pageInfo.list}">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img
											src="<%=path%>/eshop/images/product/${product.id}.jpg"
											alt="" />
										<h2 name="price">￥${product.price}</h2>
										<p name="name">${product.name}</p>
										<a href="product.html?id=${product.id}" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Buy</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<jsp:include page="../util/page.jsp"><jsp:param name="param" value="&cid=${cid}&key=${key}" /></jsp:include>
				</div>
			</div>
		</div>
	</section>
	
<jsp:include page="userfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function(){
	var level = "${userSession.level}";
	if(level!=null && level!="") {
		$("h2[name='price']").each(function(){
			var price = $(this).text().substring(1);
			var nPrice = price*(100-level*10)/100.0; 
			$(this).text("");
			$(this).append("￥<del>"+price+"</del>"+" "+nPrice);
		});
	}
	
	var key = "${key}";
	var regExp = new RegExp(key, 'g');//创建正则表达式，g表示全局的，如果不用g，则查找到第一个就不会继续向下查找了
	$("p[name='name']").each(function(){
		html = $(this).html(); //获取原先的数据
		newHtml = html.replace(regExp, '<strong style="background-color:yellow">'+key+'</strong>'); //高亮关键字
		$(this).html(newHtml);
	});
});
</script>