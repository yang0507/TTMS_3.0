<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="description" content=""/>
<meta name="author" content=""/>

<title>字典信息管理</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"/>

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"/>
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet"/>

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css"/>
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css"/>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<jsp:include   page="top.jsp" flush="true"/>
		</div>
		<div class="navbar-default sidebar" role="navigation">
			<jsp:include   page="catalog.jsp" flush="true"/>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
 			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/dataDict/list.action" method="get">
						<div class="form-group">
							<label for="dataDictName">内容</label>
							<input type="text" class="form-control" id="dataDictName" value="${dataDictName }" name="dataDictName"/>
						</div>
						<div class="form-group">
							<label for="dataDictName">父节点</label> 
							<%-- <input type="text" class="form-control" id="dataDictParentId" value="${dataDictParentId }" name="dataDictParentId"/> --%>
							<select	class="form-control" id="dataDictParentId" name="dataDictParentId">
								<option value="">--请选择--</option>
								<c:forEach items="${parentList}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == dataDictParentId}"> selected</c:if>>${item.dict_value }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#dataDictinsertDialog">添加</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">字典信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>序号</th>
									<th>父节点</th>
									<th>同级下序号</th>
									<th>内容</th>
									<th>说明</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>
											<c:if test="${row.dict_parent_id == 2}">
												影片类型
											</c:if>
											<c:if test="${row.dict_parent_id == 3}">
												影片语言
											</c:if>
										</td>
										<td>${row.dict_index }</td>
										<td>${row.dict_name }</td>
										<td>${row.dict_value }</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#dataDictEditDialog" onclick="editdataDict(${row.dict_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deletedataDict(${row.dict_id})">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/dataDict/list.action" /></center>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="dataDictEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改字典信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_dataDict_form">
						<input type="hidden" id="edit_dict_id" name="dict_id"/>
						<div class="form-group">
							<label for="edit_dict_parent_id" class="col-sm-2 control-label">父节点</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_dict_parent_id" placeholder="类别" name="dataDict_type_id"/> -->
								<select	class="form-control" id="edit_dict_parent_id" name="dict_parent_id">
									<option value="">--请选择--</option>
									<c:forEach items="${parentList}" var="item">
										<option value="${item.dict_id}">${item.dict_value }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dict_index" class="col-sm-2 control-label">同级序号</label>
							<div class="col-sm-10">
							    <input type="text" class="form-control" id="edit_dict_index"  required placeholder="同级内序号" name="dict_index" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dict_name" class="col-sm-2 control-label">内容</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dict_name"  required placeholder="内容" name="dict_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dict_value" class="col-sm-2 control-label">说明</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dict_value"  required placeholder="说明" name="dict_value"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updatedataDict()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="dataDictinsertDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加字典信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_dataDict_form">
						<div class="form-group">
							<label for="edit_dict_parent_id" class="col-sm-2 control-label">父节点</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_dict_parent_id" placeholder="类别" name="dataDict_type_id"/> -->
								<select	class="form-control" id="edit_dict_parent_id" name="dict_parent_id">
									<option value="">--请选择--</option>
									<c:forEach items="${parentList}" var="item">
										<option value="${item.dict_id}">${item.dict_value }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dict_index" class="col-sm-2 control-label">同级序号</label>
							<div class="col-sm-10">
							    <input type="text" class="form-control" id="edit_dict_index" placeholder="请输入正整数" name="dict_index"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dict_name" class="col-sm-2 control-label">内容</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dict_name" placeholder="请输入英文内容" name="dict_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dict_value" class="col-sm-2 control-label">说明</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dict_value" placeholder="请输入中文说明" name="dict_value"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="insertdataDict()">确认添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
	
		function editdataDict(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>dataDict/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_dict_id").val(data.dict_id);
					$("#edit_dict_parent_id").val(data.dict_parent_id);
					$("#edit_dict_index").val(data.dict_index);
					$("#edit_dict_name").val(data.dict_name);
					$("#edit_dict_value").val(data.dict_value);
					
				}
			});
		}

		function updatedataDict() {
			$.post("<%=basePath%>dataDict/update.action",$("#edit_dataDict_form").serialize(),function(data){
				alert("字典信息更新成功！");
				window.location.reload();
			});
		}
		
		function deletedataDict(id) {
			if(confirm('确实要删除该字典吗?')) {
				$.post("<%=basePath%>dataDict/delete.action",{"id":id},function(data){
					alert("字典删除成功！");
					window.location.reload();
				});
			}
		}
		
		function insertdataDict() {
			$.post("<%=basePath%>dataDict/insert.action",$("#insert_dataDict_form").serialize(),function(data){
				alert("字典添加成功！");
				window.location.reload();
			});
		}
		
	</script>

</body>

</html>
