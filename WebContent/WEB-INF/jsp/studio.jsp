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

<title>影厅信息管理</title>
<style type="text/css">
	 .bold{ font-weight:bold}
</style>
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
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/studio/list.action" method="get">
						<div class="form-group">
							<label for="studioName">影厅名称</label> 
							<input type="text" class="form-control" id="studioName" value="${studioName }" name="studioName"/>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#studioinsertDialog">添加</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">影厅信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>序号</th>
									<th>名称</th>
									<th>行数</th>
									<th>列数</th>
									<th>简介</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<c:if test="${row.studio_flag != -2}">
									<tr>
										<td>${count.index+1}</td>
										<td>${row.studio_name}</td>
										<td>${row.studio_row_count}</td>
										<td>${row.studio_col_count}</td>
										<td>${row.studio_introduction}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studioEditDialog" onclick="editstudio(${row.studio_id})">修改</a>
											<%-- <a href="#" class="btn btn-danger btn-xs" onclick="deletestudio(${row.studio_id})">删除</a> --%>
											<c:if test="${row.studio_flag == 0}">
												<a href="#" class="btn btn-primary btn-xs" onclick="upseatstudio(${row.studio_id},${ row.studio_row_count},${ row.studio_col_count})">生成座位</a>
											</c:if>
											<c:if test="${row.studio_flag == 1}">
												<a href="#" class="btn btn-danger btn-xs" onclick="upseat(${row.studio_id})">座位管理</a>
											</c:if>
											<c:if test="${row.studio_flag == -1}">
												<a href="#" class="btn btn-danger btn-xs" onclick="upseat(${row.studio_id})">座位管理</a>
												<span class="bold"><font color="black">损坏</font></span>
											</c:if>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/studio/list.action" /></center>
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
	<div class="modal fade" id="studioEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改影厅信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_studio_form">
						<input type="hidden" id="edit_studioid" name="studio_id"/>
						<div class="form-group">
							<label for="edit_studioName" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studioName" placeholder="名称" name="studio_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiorowcount" class="col-sm-2 control-label">行数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studiorowcount" placeholder="请输入数字" name="studio_row_count"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiocolcount" class="col-sm-2 control-label">列数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studiocolcount" placeholder="请输入数字" name="studio_col_count"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiointroduction" class="col-sm-2 control-label">简介</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" readonly="readonly"  id="edit_studiointroduction" placeholder="简介" name="studio_introduction"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studioflag" class="col-sm-2 control-label">状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_studioflag" placeholder="状态" name="studio_flag"/> -->
								<select	class="form-control" id="edit_studioflag" placeholder="状态" name="studio_flag">
								<option value="1">座位已生成</option>
									<option value="0">座位未生成</option>
									<option value="1">座位已生成</option>
									<option value="-1">影厅故障</option>
									<option value="-2">弃用</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updatestudio()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户添加对话框 -->
	<div class="modal fade" id="studioinsertDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加影厅信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_studio_form">
												<div class="form-group">
							<label for="edit_studioName" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studioName" placeholder="名称"  required name="studio_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiorowcount" class="col-sm-2 control-label">行数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studiorowcount" placeholder="行数"  required name="studio_row_count"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiocolcount" class="col-sm-2 control-label">列数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studiocolcount" placeholder="列数" required  name="studio_col_count"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiointroduction" class="col-sm-2 control-label">简介</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studiointroduction" placeholder="简介"  required name="studio_introduction"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studioflag" class="col-sm-2 control-label">状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_studioflag" placeholder="状态" name="studio_flag"/> -->
								<select	class="form-control" id="edit_studioflag" placeholder="状态" name="studio_flag">
								<option value="0">座位未生成</option>
									<option value="0">座位未生成</option>
									<option value="1">座位已生成</option>
									<option value="-1">影厅故障</option>
									<option value="-2">弃用</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<!-- <input type="submit" class="btn btn-primary"/>确认添加 -->
							<!-- <button type="submit" class="btn btn-primary">确认添加</button> -->
							<button type="button" class="btn btn-primary" onclick="insertstudio()">确认添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

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
		function editstudio(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>studio/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_studioid").val(data.studio_id);
					$("#edit_studioName").val(data.studio_name);
					$("#edit_studiorowcount").val(data.studio_row_count);
					$("#edit_studiocolcount").val(data.studio_col_count);
					$("#edit_studiointroduction").val(data.studio_introduction);
					$("#edit_studioflag").val(data.studio_flag);
				}
			});
		}
		function updatestudio() {
			$.post("<%=basePath%>studio/update.action",$("#edit_studio_form").serialize(),function(data){
				alert("影厅信息更新成功！");
				window.location.reload();
			});
		}
		
		function deletestudio(id) {
			if(confirm('确实要删除该影厅吗?删除影厅后其座位信息将同步删除！')) {
				$.post("<%=basePath%>studio/delete.action",{"id":id},function(data){
					alert("影厅信息删除成功！");
					window.location.reload();
				});
			}
		}
		
		/* insert_studio_form */
		function insertstudio() {
			$.post("<%=basePath%>studio/insert.action",$("#insert_studio_form").serialize(),function(data){
				alert("影厅信息添加成功！");
				window.location.reload();
			});
		}
		
		function upseatstudio(id,row,col){
			if(confirm('确实要生成该影厅座位?')) {
				$.post("<%=basePath%>studio/upseat.action",{"id":id,"row":row,"col":col},function(data){
					alert("座位生成成功！");
					window.location.reload();
				});
			}
		}
		
		function upseat(id){
<%-- 			$.post("<%=basePath%>seat/seatList.action",{"id":id}); --%>
			window.location.href="<%=basePath%>seat/seatList.action?id="+id;
		}
		
	</script>

</body>

</html>
