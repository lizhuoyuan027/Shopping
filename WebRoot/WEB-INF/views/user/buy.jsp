<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="userheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="usertop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

	<section id="cart_items">
		<div class="container">
			<div class="review-payment">
				<h2>收货信息填写</h2>
			</div>
			<div class="col-sm-12">
				<div class="login-form col-sm-4 col-sm-offset-1">
					<form id="formBuy" action="#">
						<div>
							<div>
								详细地址
								<textarea name="address"
									placeholder="请填写详细收货地址，例如街道、门牌号、楼层、房间号等信息" rows="2"></textarea>
							</div>
							<div>
								收货人<input name="receiver" placeholder="前填写收货人姓名" />
							</div>
							<div>
								联系方式<input name="mobile" placeholder="请填写手机号" />
							</div>
							<div>
								邮箱<input name="email" placeholder="请填写邮箱" />
							</div>
							<label id="errorAccount" style="display:none;"></label>
						</div>
					</form>
				</div>
			</div>
			<div class="review-payment">
				<h2>订单详情确认</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image" width="200px">商品</td>
							<td class="description"></td>
							<td class="price">单价</td>
							<td class="quantity">数量</td>
							<td class="total">总计</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cart_product">
								<img width="200px" src="<%=path%>/eshop/images/product/${product.id}.jpg" alt="">
							</td>
							<td class="cart_description">
								<p>${product.name}</p>
							</td>
							<td class="cart_price">
								<p id="price"></p>
							</td>
							<td class="cart_quantity">
								<p>${num}</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"  id="payment"></p>
							</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tr>
										<td><a class="btn btn-primary" id="order" href="#">去结算</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							确认支付
						</h4>
					</div>
					<div class="modal-body">
						<input id="password" type="password" placeholder="再次输入密码以确认支付" />
						<label id="error" style="display:none;"></label>
					</div>
					<div class="modal-footer">
						<button id="buy" type="button" class="btn btn-primary">
							支付
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</section> <!--/#cart_items-->

<jsp:include page="userfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<script>
$().ready(function() {
//修改个人信息
	var address="${userSession.address}";if(address!=null) $("textarea[name='address']").val(address);
	var receiver="${userSession.receiver}";if(receiver!=null) $("input[name='receiver']").val(receiver);
	var mobile="${userSession.mobile}";if(mobile!=null) $("input[name='mobile']").val(mobile);
	var email="${userSession.email}";if(email!=null) $("input[name='email']").val(email);
	
//价格
	var price = "${product.price}"*(100-"${userSession.level}"*10)/100.0; 
	price = price.toFixed(2);
	$("#price").text(price);
	var total = price*"${num}";
	$("#payment").text(total);

//验证数据	
	$("#order").click(function(){
		if(validate.form()) {
			$("#myModal").modal("show");
		}
	});

	var validate = $("#formBuy").validate({
		debug : true,
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

//支付提交
 	$("#buy").click(function(){
		var data = "&uid="+"${userSession.id}"+"&pid="+"${product.id}"+"&num="+"${num}"+"&payment="+$("#payment").text()+"&password="+$("#password").val();
		$.ajax({
			type: "POST",
			url: "ajaxBuy.html",
			data: $("#formBuy").serialize()+data,
			dataType: "json",
			success: buyResponse,
		});
	});
});

function buyResponse(data) {
	var url = "<c:url value="/index.html" />";
	if (data.msg == "noPassword") {
		$("#error").html("密码不正确").show();
	} else if (data.msg == "success") {
		window.location.href = url;
	}
}
</script>