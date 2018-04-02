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
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="<%=path%>/eshop/images/product/${product.id}.jpg" alt="" />
							</div>
						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<h2>${product.name}</h2>
								<span>
									<span name="price">￥${product.price}</span>
								</span>
								<form id="formBuy" action="buy.html?pid=${product.id}" method="post"><div><span>
										<label>数量:</label>
										<input name="num" type="text" value="1" />
										<button type="submit" class="btn btn-fefault cart">
											<i class="fa fa-shopping-cart"></i>
											Buy
										</button>
								</span></div></form>
								<p><b>库存：</b> ${product.stock}</p>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#details" data-toggle="tab">商品详情</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="details" >
								<div class="col-sm-12">
									<p>${product.detail}</p>
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
				</div>
			</div>
		</div>
	</section>
	
<jsp:include page="userfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function(){
	var level = "${userSession.level}";
	if(level!=null && level!="") {
		var price = $("span[name='price']").text().substring(1);
		var nPrice = price*(100-level*10)/100.0; 
		$("span[name='price']").text("");
		$("span[name='price']").append("￥<del>"+price+"</del>"+" "+nPrice);
	}

//----------------validate插件验证------------------ 
	$("#formBuy").validate({
		//规则
		rules : {
			num : {
				required:true, 
				digits:true, 
				range:[1,${product.stock}]
			},
		},
		//提示信息
		messages : {
			num : {
				required : '请输入购买数量',
				digits : '请输入整数',
				range : '数量不能超过库存'
			},
		},
	});
});
</script>