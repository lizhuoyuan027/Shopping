<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>板块主题页</title>

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
	<div>
		<table border="1px" width="100%">
			<tr>
				<td bgcolor="#EEEEEE">${board.boardname}</td>
				<td colspan="4" bgcolor="#EEEEEE" align="right"><a
					href="<c:url value="/board/addTopicPage-${board.boardid}.html"/>">发表新话题</a>
				</td>
			</tr>
			<tr>
				<c:if
					test="${USER_CONTEXT.userType == 2 || USER_CONTEXT.userid == board.userid}">
					<td><script>
						function switchSelectBox() {
							var selectBoxs = document.all("topicIds");
							if (!selectBoxs)
								return;
							if (typeof (selectBoxs.length) == "undefined") {//only one checkbox
								selectBoxs.checked = event.srcElement.checked;
							} else {//many checkbox ,so is a array 
								for (var i = 0; i < selectBoxs.length; i++) {
									selectBoxs[i].checked = event.srcElement.checked;
								}
							}
						}
					</script> <input type="checkbox" onclick="switchSelectBox()" /></td>
				</c:if>
				<td width="50%">标题</td>
				<td width="10%">发表人</td>
				<td width="10%">回复数</td>
				<td width="15%">发表时间</td>
				<td width="15%">最后回复时间</td>
			</tr>
			<c:forEach var="topic" items="${pageTopic.list}">
				<tr>
					<c:if
						test="${USER_CONTEXT.usertype == 2 || USER_CONTEXT.userid == board.userid}">
						<td><input type="checkbox" name="topicIds"
							value="${topic.topicid}" /></td>
					</c:if>
					<td><a
						href="<c:url value="/board/listTopicPosts-${topic.topicid}.html"/>">
							<c:if test="${topic.digest == 1}">
								<font color=red>★</font>
							</c:if> ${topic.topictitle}
					</a></td>
					<td>${topic.userid}<br> <br>
					</td>
					<td>${topic.topicreplies}<br> <br>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${topic.createtime}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${topic.lastposttime}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<c:if test="${USER_CONTEXT.usertype == 2 || USER_CONTEXT.userid == board.userid}">
		<script>
	            function getSelectedTopicIds(){
	                var selectBoxs = document.all("topicIds");
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
	            function deleteTopics(){
	               var ids = getSelectedTopicIds();
	               if(ids){
	                  var url = "<c:url value="/board/removeTopic.html"/>?topicIds="+ids+"&boardid=${board.boardid}";
	                  location.href = url;
	               }
	            }
	            function setDefinedTopis(){
	               var ids = getSelectedTopicIds();
	               if(ids){
	                  var url = "<c:url value="/board/makeDigestTopic.html"/>?topicIds="+ids+"&boardid=${board.boardid}";
	                  location.href = url;
	               }	            
	            }
	         </script>
		<input type="button" value="删除" onclick="deleteTopics()">
		<input type="button" value="置精华帖" onclick="setDefinedTopis()">
	</c:if>
</body>
</html>
