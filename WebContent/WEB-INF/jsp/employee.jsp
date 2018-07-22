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

<title>员工信息管理</title>

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
					<form class="form-inline" action="${pageContext.request.contextPath }/employee/list.action" method="get">
						<div class="form-group">
							<label for="employeeName">员工名称</label> 
							<input type="text" class="form-control" id="employeeName" value="${empName }" name="empName"/>
						</div>
						<div class="form-group">
							<label for="employeeName">联系方式</label> 
							<input type="text" class="form-control" id="employeeName" value="${empTelNum }" name="empTelNum"/>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#employeeinsertDialog">添加</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">员工信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>序号</th>
									<th>员工编号</th>
									<th>员工姓名</th>
									<th>联系方式</th>
									<th>家庭住址</th>
									<th>私人邮箱</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${row.emp_no}</td>
										<td>${row.emp_name}</td>
										<td>${row.emp_tel_num}</td>
										<td>${row.emp_addr}</td>
										<td>${row.emp_email}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#employeeEditDialog" onclick="editemployee(${row.emp_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteemployee(${row.emp_id})">删除</a>
											<!-- <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#employeeEditDialog" onclick="insertemployee()">添加</a> -->
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/employee/list.action" /></center>
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
	<div class="modal fade" id="employeeEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_employee_form">
						<input type="hidden" id="edit_emp_id" name="emp_id"/>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">员工编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNo" readonly="readonly" placeholder="员工编号" name="emp_no"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeName" placeholder="员工姓名" name="emp_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">联系方式</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNum" placeholder="联系方式" name="emp_tel_num"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">家庭住址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeAddr" placeholder="家庭住址" name="emp_addr"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">私人邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeEmail" placeholder="私人邮箱" name="emp_email"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateemployee()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户添加对话框 -->
	<div class="modal fade" id="employeeinsertDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="insert_employee_form">
						<!-- <input type="hidden" id="insert_cust_id" name="cust_id"/> -->
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">员工编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNo"  required placeholder="请输入编号" name="emp_no"  pattern="^\+?[1-9][0-9]*$"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeName"  required placeholder="员工姓名" pattern="^([\u4e00-\u9fa5]+|([a-z]+\s?)+)$" name="emp_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">联系方式</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNum"  required placeholder="联系方式" name="emp_tel_num" pattern="^1\d{10}$|^(0\d{2,3}-?|\(0\d{2,3}\))?[1-9]\d{4,7}(-\d{1,8})?$"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">家庭住址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeAddr"  required placeholder="家庭住址" name="emp_addr"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">私人邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeEmail"  required placeholder="私人邮箱" pattern="^[0-9a-z][a-z0-9\._-]{1,}@[a-z0-9-]{1,}[a-z0-9]\.[a-z\.]{1,}[a-z]$" name="emp_email"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<!-- <input type="submit" class="btn btn-primary"/>确认添加 -->
							<!-- <button type="submit" class="btn btn-primary">确认添加</button> -->
							<button type="button" class="btn btn-primary" onclick="insertemployee()">确认添加</button>
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
	
		function editemployee(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>employee/detail.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_emp_id").val(data.emp_id);
					$("#edit_employeeNo").val(data.emp_no);
					$("#edit_employeeName").val(data.emp_name);
					$("#edit_employeeNum").val(data.emp_tel_num);
					$("#edit_employeeAddr").val(data.emp_addr);
					$("#edit_employeeEmail").val(data.emp_email);
					
				}
			});
		}
		
		function updateemployee() {
			$.post("<%=basePath%>employee/update.action",$("#edit_employee_form").serialize(),function(data){
				alert("员工信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteemployee(id) {
			if(confirm('确实要删除该员工吗?')) {
				$.post("<%=basePath%>employee/delete.action",{"id":id},function(data){
					alert("员工信息删除成功！");
					window.location.reload();
				});
			}
		}

		function insertemployee() {
			$.post("<%=basePath%>employee/insert.action",$("#insert_employee_form").serialize(),function(data){
				alert("员工信息添加成功！");
				window.location.reload();
			});
		}
		
	</script>

</body>

</html>
