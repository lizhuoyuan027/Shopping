<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script>
   function mycheck(){
      if(document.all("password").value != document.all("again").value){
         alert("两次输入的密码不正确，请更正。");
         return false;
      }else
      {
         return true;
      }
   }
</script>
</head>

<body>
	<form action="<c:url value="/register.html" />" method="post"
		onsubmit="return mycheck()">
		<!-- 由RegisterController传递来的参数 -->
		<c:if test="${!empty errorMsg}">
			<div style="color=red">${errorMsg}</div>
		</c:if>
		<table border="1px" width="60%">
			<tr>
				<td width="20%">用户名</td>
				<td width="80%"><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td width="20%">密码</td>
				<td width="80%"><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td width="20%">密码确认</td>
				<td width="80%"><input type="password" name="again"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="保存"> <input
					type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</body>
</html>
