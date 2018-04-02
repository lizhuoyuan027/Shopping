<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="userheader.jsp"><jsp:param name="path"
		value="<%=path%>" /></jsp:include>
<jsp:include page="usertop.jsp"><jsp:param name="path"
		value="<%=path%>" /></jsp:include>

<section id="cart_items">
	<div class="container">
		<div class="review-payment">
			<h2>我的订单</h2>
		</div>
		
		<ul class="nav nav-tabs">
			<li <c:if test="${status==0}">class="active"</c:if>><a href="?status=0">所有订单</a></li>
			<li <c:if test="${status==1}">class="active"</c:if>><a href="?status=1">待发货</a></li>
			<li <c:if test="${status==2}">class="active"</c:if>><a href="?status=2">待收货</a></li>
			<li <c:if test="${status==3}">class="active"</c:if>><a href="?status=3">已拒绝</a></li>
			<li <c:if test="${status==4}">class="active"</c:if>><a href="?status=4">已关闭</a></li>
		</ul>

		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">商品</td>
						<td class="description"></td>
						<td class="quantity">数量</td>
						<td class="total">总计</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${pageInfo.list}">
						<tr class="active">
							<td colspan="4"><label> <fmt:formatDate
										value="${order.createdate}" pattern="yyyy-MM-dd HH:mm:ss" />
									订单号：${order.ordercode} 订单状态： <c:if test="${order.status=='1'}">待发货</c:if>
									<c:if test="${order.status=='2'}">待收货</c:if> <c:if
										test="${order.status=='3'}">已拒绝</c:if> <c:if
										test="${order.status=='4'}">已关闭</c:if>
							</label></td>
							<td><a href="javascript:void(0);" data-toggle="modal"
								data-target="#messageModal"
								onclick="messageTrans('${order.salermessage}','${order.usermessage}')">查看备注</a>
							</td>
						</tr>
						<tr>
							<td class="cart_product"><img width="200px" height="200px"
								src="<%=path%>/eshop/images/product/${order.pid}.jpg"
								alt=""></td>
							<td class="cart_description">
								<p>${order.product.name}</p>
							</td>
							<td class="cart_quantity">
								<p>${order.num}</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">${order.payment}</p>
							</td>
							<td><c:if test="${order.status=='2'}">
									<button class="btn btn-primary" data-toggle="modal"
										data-target="#opeModal"
										onclick="receiveTrans(${order.id})">确认收货</button>
								</c:if> <c:if test="${order.status=='3'}">
									<button class="btn btn-primary" data-toggle="modal"
										data-target="#opeModal" onclick="closeTrans(${order.id})">关闭订单</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<jsp:include page="../util/page.jsp"><jsp:param name="param" value="" /></jsp:include>
	</div>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form role="form">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">备注</h4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td>商家留言：</td>
								<td id="salerMessage"></td>
							</tr>
							<tr>
								<td>您的评价：</td>
								<td id="userMessage"></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="modal fade" id="opeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form role="form" id="formOpe" action="operate.html" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="opeModalLabel"></h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input class="form-control" name="usermessage" placeholder="填写评价" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">提交</button>
						<input type="hidden" name="id" />
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

</section>
<!--/#cart_items-->

<jsp:include page="userfooter.jsp"><jsp:param name="path"
		value="<%=path%>" /></jsp:include>

<script>
	function messageTrans(salermessage, usermessage) {
		$("#salerMessage").text(salermessage);
		$("#userMessage").text(usermessage);
	}
	
	function receiveTrans(id) {
		$("#opeModalLabel").text("请确认收货");
		$("input[name='id']").val(id);
	}
	
	function closeTrans(id) {
		$("#opeModalLabel").text("请确认关闭");
		$("input[name='id']").val(id);
	}
</script>