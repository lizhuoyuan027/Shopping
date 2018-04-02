<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<c:if test="${!empty errorMsg}">
		<div style="color:red">${errorMsg}</div>
	</c:if>
	<form action="<c:url value="/login/doLogin.html" />" method="post">
		<table border="1px">
			<tr>
				<td width="20%">用户名</td>
				<td width="80%"><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td width="20%">密码</td>
				<td width="80%"><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="登录"> <input
					type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</body>
</html>
