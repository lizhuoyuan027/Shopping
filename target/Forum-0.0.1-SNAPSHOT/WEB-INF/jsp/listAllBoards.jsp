<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>论坛首页</title>

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
	<table border="1px" width="100%">
		<tr>
			<td colspan="3" bgcolor="#EEEEEE">所有论坛版块</td>
		</tr>
		<tr>
		<tr>
			<c:if test="${USER_CONTEXT.usertype == 2}">
				<td><script>
			            function switchSelectBox(){
			                var selectBoxs = document.all("boardIds");
			                if(!selectBoxs) return ;
			                if(typeof(selectBoxs.length) == "undefined"){//only one checkbox
			                    selectBoxs.checked = event.srcElement.checked;
			                }else{//many checkbox ,so is a array 
			                  for(var i = 0 ; i < selectBoxs.length ; i++){
			                     selectBoxs[i].checked = event.srcElement.checked;
			                  }
			                } 
			            }
			        </script> <input type="checkbox" onclick="switchSelectBox()" /></td>
			</c:if>
			<td width="20%">版块名称</td>
			<td width="70%">版块简介</td>
			<td width="10%">主题帖数</td>
		</tr>
		<c:forEach var="board" items="${boards}">
			<tr>
				<c:if test="${USER_CONTEXT.usertype == 2}">
					<td><input type="checkbox" name="boardIds"
						value="${board.boardid}" /></td>
				</c:if>
				<td><a
					href="<c:url value="/board/listBoardTopics-${board.boardid}.html"/>">${board.boardname}</a></td>
				<td>${board.boarddesc}</td>
				<td>${board.topicnum}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${USER_CONTEXT.usertype == 2}">
		<script>
	            function getSelectedBoardIds(){
	                var selectBoxs = document.all("boardIds");
	                if(!selectBoxs) return null;
	                if(typeof(selectBoxs.length) == "undefined" && selectBoxs.checked){   
	                    return selectBoxs.value;
	                }else{//many checkbox ,so is a array 
	                  var ids = "";
	                  var split = ""
	                  for(var i = 0 ; i < selectBoxs.length ; i++){
	                     if(selectBoxs[i].checked){
	                        ids += split+selectBoxs[i].value;
	                        split = ",";
	                     }
	                  }
	                  return ids;
	                }
	            }
	            function deleteBoards(){
	               var ids = getSelectedBoardIds();
	               if(ids){
	                  var url = "<c:url value="/forum/removeBoard.html"/>?boardIds="+ids+"";
	                  //alert(url);
	                  location.href = url;
	               }
	            }
	           
	         </script>
		<input type="button" value="删除" onclick="deleteBoards()">
	</c:if>
</body>
</html>
