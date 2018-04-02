<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="adminheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="adminTop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<div class="workingArea">
	<div class="col-sm-2">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="admin_listCategory.html">类别管理</a></li>
			<li class="active"><a href="#">订单管理</a></li>
		</ul>
	</div>

	<div class="col-sm-10">
		<table class="table table-striped table-bordered table-hover1  table-condensed">
            <thead>
            <tr class="danger">
                <th>订单ID</th>
                <th>状态</th>
                <th>金额</th>
                <th>买家</th>
                <th>收货人</th>
                <th>收货地址</th>
                <th>联系方式</th>
                <th>创建时间</th>
                <th>商家留言</th>
                <th>卖家留言</th>
                <th width="120px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>
                    	<c:if test="${order.status=='1'}">待发货</c:if>
                    	<c:if test="${order.status=='2'}">待收货</c:if>
                    	<c:if test="${order.status=='3'}">已拒绝</c:if>
                    	<c:if test="${order.status=='4'}">已关闭</c:if>
                    </td>
                    <td>￥${order.payment}</td>
                    <td align="center">${order.user.name}</td>
                    <td>${order.receiver}</td>
                    <td>${order.address}</td>
                    <td>${order.mobile}</td>
                    <td><fmt:formatDate value="${order.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${order.salermessage}</td>
                    <td>${order.usermessage}</td>
                    <td>
                        <c:if test="${order.status=='1'}">
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#deliverModal" onclick="transId(${order.id})">发货</a>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#refuseModal" onclick="transId(${order.id})">拒绝</a>
                        </c:if>
                    </td>
                </tr>
            	<tr class="detailShow">
                    <td colspan="10" align="center">
                        <div>
                            <table width="800px" align="center">
                                    <tr>
                                        <td align="left">
                                            <img width="40px" height="40px" src="<%=path%>/eshop/images/product/${order.product.id}.jpg">
                                        </td>
                                        <td>
                                            <a href="product.html?id=${order.product.id}">
                                                <span>${order.product.name}</span>
                                            </a>
                                        </td>
                                        <td align="right">
                                            <span class="text-muted">${order.num}个</span>
                                        </td>
                                    </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
        <jsp:include page="../util/page.jsp"><jsp:param name="param" value="" /></jsp:include>
        
	</div>
</div>

<div class="modal fade" id="deliverModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					发货确认
				</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="formDeliver" action="admin_deliverOrder.html" method="post">
					<div class="form-group">
						<input class ="form-control" name="salermessage" placeholder="可填写备注信息" />
						<input type="hidden" name="id"/>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="deliver">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="modal fade" id="refuseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					拒绝确认
				</h4>
			</div>
			<div class="modal-body">
				<form role="form" id="formRefuse" action="admin_refuseOrder.html" method="post">
					<div class="form-group">
						<input class ="form-control" name="salermessage" placeholder="可填写备注信息" />
						<input type="hidden" name="id"/>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="refuse">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<jsp:include page="adminfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<script>
$().ready(function(){
	$("#deliver").click(function(){
		$("#formDeliver").submit();
	});
	$("#refuse").click(function(){
		$("#formRefuse").submit();
	});
});

function transId(id) {
	$("[name='id']").val(id);
}
</script>