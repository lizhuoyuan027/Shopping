<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getParameter("path");
%>

<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shop</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2018 E-Shop Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a href="javascript:void(0)">LiZhuoyuan</a></span></p>
					<p><%=path %></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="<%=path%>/eshop/js/jquery.js"></script>
	<script src="<%=path%>/eshop/js/bootstrap.min.js"></script>
	<script src="<%=path%>/eshop/js/jquery.scrollUp.min.js"></script>
	<script src="<%=path%>/eshop/js/price-range.js"></script>
    <script src="<%=path%>/eshop/js/jquery.prettyPhoto.js"></script>
    <script src="<%=path%>/eshop/js/main.js"></script>
    <script src="<%=path%>/eshop/js/jquery.form.js"></script>
    <script src="<%=path%>/eshop/js/jquery.cookie.js"></script>
    <script src="<%=path%>/eshop/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/eshop/js/jquery.validate.addMethod.js"></script>
</body>
</html>