<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>改变用户锁定状态</title>

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
	<%@ include file="includeTop.jsp"%>
	<form action="<c:url value="/forum/userLockManage.html"/>" method="post"/>
	<table border="1px" width="100%">
		<tr>
			<td width="20%">用户</td>
			<td width="80%"><select name="username">
					<option>请选择</option>
					<c:forEach var="user" items="${users}">
						<option value="${user.username}">${user.username}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td width="20%">锁定/解锁</td>
			<td width="80%"><input type="radio" name="locked" value="1" />锁定
				<input type="radio" name="locked" value="0" />解锁</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="保存"> <input
				type="reset" value="重置"></td>
		</tr>
	</table>
	</form>
</body>
</html>
