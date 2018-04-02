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
					<c:forEach var="category" items="${categories}">
						<div class="features_items"><!--features_items-->
							<h2 class="title text-center">${category.name}</h2>
							<c:forEach var="product" items="${category.products}">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
												<div class="productinfo text-center">
													<img src="<%=path%>/eshop/images/product/${product.id}.jpg" alt="" />
													<h2 name="price">￥${product.price}</h2>
													<p>${product.name}</p>
													<a href="product.html?id=${product.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Buy</a>
												</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div><!--features_items-->
					</c:forEach>
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
});
</script>