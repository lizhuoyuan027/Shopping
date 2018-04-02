<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
	
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加版块</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script>
	   function mySubmit(){
	      with(document){
	         var boardname = getElementById("board.boardname");
	         if(boardname.value == null || boardname.value.length ==0){
	            alert("版块名称不能为空，请填上.");
	            boardname.focus();
	            return false;
	         }else if(boardname.value.length > 150){
	            alert("版块名称最大长度不能超过50个字符，请调整.");
	            boardname.focus();
	            return false;
	         }
	          
	         var boarddesc = getElementById("board.boarddesc");
	         if(boarddesc.value != null && boarddesc.value.length > 255){
	            alert("版块描述最大长度不能超过255个字符，请调整.");
	            boarddesc.focus();
	            return false;
	         }
	           
	         return true;
	      }
	      
	   }
	</script>
</head>

<body>
	<%@ include file="includeTop.jsp"%>
	<form action="<c:url value="/forum/addBoard.html"/>" method="post"
		onsubmit="return mySubmit()">
		<table border="1px" width="100%">
			<tr>
				<td width="20%">版块名称</td>
				<td width="80%"><input type="text" name="boardname"
					style="width:60%;" /></td>
			</tr>
			<tr>
				<td width="20%">版块简介</td>
				<td width="80%"><textarea style="width:80%;height:120px"
						name="boarddesc"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="保存"> <input
					type="reset" value="重置"> <input type="hidden"
					name="_method" value="PUT"></td>
			</tr>
		</table>
	</form>
</body>
</html>
