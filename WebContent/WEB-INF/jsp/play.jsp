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

<title>剧目信息管理</title>

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
<!-- 			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">员工管理</h1>
				</div>
			</div> -->
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/play/list.action" method="get">
						<div class="form-group">
							<label for="playName">剧目名称</label> 
							<input type="text" class="form-control" id="playName" value="${playName }" name="playName"/>
						</div>
						<div class="form-group">
							<label for="playName">剧目类别</label> 
							<%-- <input type="text" class="form-control" id="playName" value="${playType }" name="playType"/> --%>
							<select	class="form-control" id="edit_playType" name="playType">
								<option value="">--请选择--</option>
								<c:forEach items="${playTypeList}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == playType}"> selected</c:if>>${item.dict_value }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="playName">剧目语种</label> 
							<%-- <input type="text" class="form-control" id="playName" value="${playType }" name="playType"/> --%>
							<select	class="form-control" id="edit_playLong" name="playLong">
								<option value="">--请选择--</option>
								<c:forEach items="${playLongList}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == playLong}"> selected</c:if>>${item.dict_value }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#playinsertDialog">添加</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">剧目信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>序号</th>
									<th>类别</th>
									<th>语种</th>
									<th>名称</th>
									<th>简介</th>
									<th>图示</th>
									<th>时长</th>
									<th>票价</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<%-- <td>${row.play_type_id}</td> --%>
										<td>
											<c:forEach items="${playTypeList}" var="item">
												<c:if test="${item.dict_id == row.play_type_id}"> ${item.dict_value }</c:if>
											</c:forEach>
										</td>
										<%-- <td>${row.play_lang_id}</td> --%>
										<td>
											<c:forEach items="${playLongList}" var="item">
												<c:if test="${item.dict_id == row.play_lang_id}"> ${item.dict_value }</c:if>
											</c:forEach>
										</td>
										<td>${row.play_name}</td>
										<td>${row.play_introduction}</td>
										<td>
										<c:if test="${empty row.play_image}">
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#playUploadPicDialog" onclick="uploadplay(${row.play_id})">添加图片</a>
										</c:if>
										<c:if test="${not empty row.play_image}">
											<img src="../${row.play_image}" width="55px" height="55px" alt="an image"/>
										</c:if>
										</td>
										<td>${row.play_length}</td>
										<td>${row.play_ticket_price}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#playEditDialog" onclick="editplay(${row.play_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteplay(${row.play_id})">删除</a>
											<c:if test="${row.play_status == 0}">
												<a href="#" class="btn btn-primary btn-xs" onclick="upstatuplay(${row.play_id})">排片</a>
											</c:if>
											<c:if test="${row.play_status == 1}">
												<a href="#" class="btn btn-primary btn-xs" onclick="outstatuplay(${row.play_id})">下线</a>
											</c:if>
											<c:if test="${row.play_status == -1}">
												<a href="#" class="btn btn-primary btn-xs" onclick="upstatuplay(${row.play_id})">重新排片</a>
											</c:if>
											<!-- <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#playEditDialog" onclick="insertplay()">添加</a> -->
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/play/list.action" /></center>
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
	<div class="modal fade" id="playEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改剧目信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_play_form">
						<input type="hidden" id="edit_playid" name="play_id"/>
						<div class="form-group">
							<label for="edit_playType" class="col-sm-2 control-label">类别</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_playType" placeholder="类别" name="play_type_id"/> -->
								<select	class="form-control" id="edit_playType" name="play_type_id">
									<option value="">--请选择--</option>
									<c:forEach items="${playTypeList}" var="item">
										<option value="${item.dict_id}">${item.dict_value }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playLong" class="col-sm-2 control-label">语种</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_playLong" placeholder="语种" name="play_lang_id"/> -->
								<select	class="form-control" id="edit_playLong" name="play_lang_id">
									<option value="">--请选择--</option>
									<c:forEach items="${playLongList}" var="item">
										<option value="${item.dict_id}">${item.dict_value }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playName"  required placeholder="名称" name="play_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">简介</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playIntro"  required placeholder="简介" name="play_introduction"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">时长</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playLength"  required placeholder="时长" name="play_length"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">票价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playTickPrice"  required placeholder="票价" name="play_ticket_price"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateplay()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片添加对话框 -->
	<div class="modal fade" id="playinsertDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加剧目信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_play_form">
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">类别</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_playType" placeholder="类别" name="play_type_id"/> -->
								<select	class="form-control" id="edit_playType" placeholder="类别 " name="play_type_id">
									<option value="">--请选择--</option>
									<c:forEach items="${playTypeList}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == playType}"> selected</c:if>>${item.dict_value }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">语种</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_playLong" placeholder="语种" name="play_lang_id"/> -->
								<select	class="form-control" id="edit_playLong" placeholder="语种" name="play_lang_id">
									<option value="">--请选择--</option>
									<c:forEach items="${playLongList}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == playLong}"> selected</c:if>>${item.dict_value }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playName" placeholder="名称" name="play_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">简介</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playIntro" placeholder="简介" name="play_introduction"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">时长</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playLength" placeholder="请输入数字" name="play_length"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">票价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playTickPrice" placeholder="请输入数字" name="play_ticket_price"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<!-- <input type="submit" class="btn btn-primary"/>确认添加 -->
							<!-- <button type="submit" class="btn btn-primary">确认添加</button> -->
							<button type="button" class="btn btn-primary" onclick="insertplay()">确认添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	<!-- 图片上传对话框 -->
	<div class="modal fade" id="playUploadPicDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加剧目图示</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="upload_play_img" 
						action="<%=basePath%>play/upload.action" enctype="multipart/form-data" method="post">
						<input type="hidden" id="upload_playid" name="play_id"/>
						<div>
			                <label for="edit_playName" class="col-sm-2 control-label">图片：</label>
			                <input type="file" name="pictureFile"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<input type="submit" value="确认添加"/>
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
		function editplay(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>play/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_playid").val(data.play_id);
					$("#edit_playType").val(data.play_type_id);
					$("#edit_playLong").val(data.play_lang_id);
					$("#edit_playName").val(data.play_name);
					$("#edit_playIntro").val(data.play_introduction);
					$("#edit_playLength").val(data.play_length);
					$("#edit_playTickPrice").val(data.play_ticket_price);
				}
			});
		}
		function uploadplay(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>play/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#upload_playid").val(data.play_id);
				}
			});
		}
		function updateplay() {
			$.post("<%=basePath%>play/update.action",$("#edit_play_form").serialize(),function(data){
				alert("剧目信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteplay(id) {
			if(confirm('确实要删除该剧目吗?')) {
				$.post("<%=basePath%>play/delete.action",{"id":id},function(data){
					alert("剧目信息删除成功！");
					window.location.reload();
				});
			}
		}
		
		/* insert_play_form */
		function insertplay() {
			$.post("<%=basePath%>play/insert.action",$("#insert_play_form").serialize(),function(data){
				alert("剧目信息添加成功！");
				window.location.reload();
			});
		}
		
		function uploadPic() {
			$.post("<%=basePath%>play/upload.action",$("#upload_play_img").serialize(),function(data){
				alert("剧目图片添加成功！");
				window.location.reload();
			});
		}
		
		function upstatuplay(id) {
			if(confirm('确实要上线该剧目吗?')) {
				$.post("<%=basePath%>play/status.action",{"id":id},function(data){
					alert("剧目上线成功！");
					window.location.reload();
				});
			}
		}
		
		function outstatuplay(id) {
			if(confirm('确实要下线该剧目吗?')) {
				$.post("<%=basePath%>play/outstatu.action",{"id":id},function(data){
					alert("剧目下线成功！");
					window.location.reload();
				});
			}
		}
		
	</script>

</body>

</html>
