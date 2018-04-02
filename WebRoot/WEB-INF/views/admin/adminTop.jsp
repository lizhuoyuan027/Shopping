<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%
String path = request.getParameter("path");
%>
	<div class="navitagorDiv">
	    <nav class="navbar navbar-default navbar-fixed-top">
	        <img style="margin-left:10px;margin-right:0px" class="pull-left" src="<%=path%>/eshop/images/home/logo.png" height="45px">
	    	<a class="navbar-brand" href="#">后台管理系统</a>
	    </nav>
	</div>
<!--/header-->