<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="adminheader.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
<jsp:include page="adminTop.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>

<div class="workingArea">
	<div class="col-sm-2">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#">类别管理</a></li>
			<li><a href="admin_listOrder.html">订单管理</a></li>
		</ul>
	</div>

	<div class="col-sm-4">
    <ol class="breadcrumb">
        <li><a href="admin_listCategory.html">所有类别</a></li>
        <li class="active">编辑类别</li>
    </ol>

    <div class="panel panel-danger editDiv">
        <div class="panel-heading">编辑分类</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_updateCategory.html">
                <table class="editTable">
                    <tr>
                        <td>类别名称</td>
                        <td><input name="name" value="${category.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${category.id}">
                            <button type="submit" class="btn btn-primary">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </div>
</div>

<jsp:include page="adminfooter.jsp"><jsp:param name="path" value="<%=path%>" /></jsp:include>
