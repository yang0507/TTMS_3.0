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
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
<title>演出信息管理</title>
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
					<form class="form-inline" action="${pageContext.request.contextPath }/schedule/list.action" method="get">
						<div class="form-group">
							<label for="St_name">影厅名称</label> 
							<input type="text" class="form-control" id="St_name" value="${St_name }" name="St_name"/>
						</div>
						<div class="form-group">
							<label for="P_name">影片名称</label> 
							<input type="text" class="form-control" id="P_name" value="${P_name }" name="P_name"/>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#schedinsertDialog">添加</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">演出计划信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>序号</th>
									<th>影厅</th>
									<th>影片</th>
									<th>上线时间</th>
									<th>票价</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${row.studio.studio_name}</td>
										<td>${row.play.play_name}</td>
										<td>${row.sched_time}</td>
										<td>${row.sched_ticket_price}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#schedEditDialog" onclick="editsched(${row.sched_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deletesched(${row.sched_id})">删除</a>
											<c:if test="${row.sched_status == 0}">
												<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"  onclick="upticket(${row.sched_id})">生成票</a>
											</c:if>
											<%-- <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"  onclick="upticket(${row.sched_id})">生成票</a> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/schedule/list.action" /></center>
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
	<div class="modal fade" id="schedEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改演出计划信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_sched_form">
						<input type="hidden" id="edit_schedid" name="sched_id"/>
						<div class="form-group">
							<label for="edit_studioName" class="col-sm-2 control-label">影厅</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_studioName" placeholder="影厅" name="studio_id">
									<option value="">--请选择--</option>
									<c:forEach items="${St_list}" var="item">
										<option value="${item.studio_id}">${item.studio_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">影片</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_playName" placeholder="影片" name="play_id">
									<option value="">--请选择--</option>
									<c:forEach items="${P_List}" var="item">
										<option value="${item.play_id}">${item.play_name } 票价 =${item.play_ticket_price } </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_sched_time" class="col-sm-2 control-label">时间</label>
							<div class="col-sm-10">
								<input id="edit_sched_time" class="form-control" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="sched_time"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ticketprice" class="col-sm-2 control-label">票价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_ticketprice" placeholder="票价" name="sched_ticket_price"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updatesched()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户添加对话框 -->
	<div class="modal fade" id="schedinsertDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加演出信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_sched_form">
						<div class="form-group">
							<label for="edit_studioName" class="col-sm-2 control-label">影厅</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_studioName" placeholder="影厅" name="studio_id">
									<option value="">--请选择--</option>
									<c:forEach items="${St_list}" var="item">
										<option value="${item.studio_id}">${item.studio_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playName" class="col-sm-2 control-label">影片</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_playName" placeholder="影片" name="play_id">
									<option value="">--请选择--</option>
									<c:forEach items="${P_List}" var="item">
										<option value="${item.play_id}">${item.play_name } 票价 =${item.play_ticket_price } </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_sched_time" class="col-sm-2 control-label">时间</label>
							<div class="col-sm-10">
								<input id="edit_sched_time" class="form-control"  required class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="sched_time"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ticketprice" class="col-sm-2 control-label">票价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_ticketprice"  required placeholder="请输入数字" name="sched_ticket_price"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="insertsched()">确认添加</button>
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
		function getFormatDate(time) {
		    var date = new Date(time);
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate+ " " + date.getHours() + seperator2 + date.getMinutes()+ seperator2 + date.getSeconds();
		    return currentdate;
		}
		function editsched(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>schedule/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_schedid").val(data.sched_id);
					$("#edit_studioName").val(data.studio_id);
					$("#edit_playName").val(data.play_id);
					$("#edit_sched_time").val(getFormatDate(data.sched_time));
					$("#edit_ticketprice").val(data.sched_ticket_price);
				}
			});
		}
		
		function updatesched() {
			$.post("<%=basePath%>schedule/update.action",$("#edit_sched_form").serialize(),function(data){
				alert("演出信息更新成功！");
				window.location.reload();
			});
		}
		
		function deletesched(id) {
			if(confirm('确实要删除该演出计划吗?其演出票信息将同步删除！')) {
				$.post("<%=basePath%>schedule/delete.action",{"id":id},function(data){
					alert("演出计划删除成功！");
					window.location.reload();
				});
			}
		}

		function insertsched() {
			$.post("<%=basePath%>schedule/insert.action",$("#insert_sched_form").serialize(),function(data){
				alert("演出信息添加成功！");
				window.location.reload();
			});
		}
		
		function upticket(id) {
			if(confirm('确定要生成演出票吗?')) {
				$.post("<%=basePath%>schedule/upticket.action",{"id":id},function(data){
					alert("生成演出票成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
