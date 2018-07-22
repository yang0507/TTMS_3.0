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

<title>登录用户管理</title>

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
					
<!-- 					<li><a href="salevisit.action"><i
							class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li> -->
				</ul>
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
					<form class="form-inline" action="${pageContext.request.contextPath }/user/list.action" method="get">
						<div class="form-group">
							<label for="userName">登录用户名称</label>
							<input type="text" class="form-control" id="userName" value="${empName }" name="empName"/>
						</div>
						<div class="form-group">
							<label for="userName">联系方式</label> 
							<input type="text" class="form-control" id="userName" value="${empTelNum }" name="empTelNum"/>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#userinsertDialog">添加</button>
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
									<th>用户身份</th>
									<th>用户状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${row.emp_no}</td>
										<td>${row.employee.emp_name}</td>
										<td>${row.employee.emp_tel_num}</td>
										<td>${row.employee.emp_addr}</td>
										<td>${row.employee.emp_email}</td>
										<td>
											<c:if test="${row.type == 0}">
												售票员
											</c:if>
											<c:if test="${row.type == 1}">
												管理员
											</c:if>
											<c:if test="${row.type == 2}">
												经理
											</c:if>
										
										</td>
										<td>
											<c:if test="${row.status == 0 }">
												未激活
											</c:if>
											<c:if test="${row.status == 1}">
												已激活
											</c:if>
										</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick="edituser('${row.emp_no}')">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteuser('${row.emp_no}')">删除</a>
											<a href="#" class="btn btn-primary btn-xs" onclick="edituserpass('${row.emp_no}')">重置密码</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/user/list.action" /></center>
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
	<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改登录用户身份信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_form">
						<div class="form-group">
							<label for="edit_emp_no" class="col-sm-2 control-label">用户编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_emp_no" readonly="readonly"  placeholder="用户编号" name="emp_no"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_type" class="col-sm-2 control-label">用户身份</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_type" placeholder="用户身份" name="type"/> -->
								<select	class="form-control" id="edit_type" placeholder="用户身份" name="type">
									<option value="">--请选择--</option>
										<option value="0">售票员</option>
										<option value="1">管理员</option>
										<option value="2">经理</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_status" class="col-sm-2 control-label">用户状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_status" placeholder="用户状态" name="status"/> -->
								<select	class="form-control" id="edit_type" placeholder="用户状态" name="status">
									<option value="0">未激活</option>
										<option value="0">未激活</option>
										<option value="1">已激活</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateuser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户修改密码框 -->
	<div class="modal fade" id="userpassDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">重置登录密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_userpass_form">
						<div class="form-group">
							<label for="edit_emp_no" class="col-sm-2 control-label">用户编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_emp_no" placeholder="用户编号" name="emp_no"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_emp_pass" class="col-sm-2 control-label">用户密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="edit_emp_pass" placeholder="用户密码" name="emp_pass"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="comfirmuser()">确定重置</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户添加对话框 -->
	<div class="modal fade" id="userinsertDialog" tabindex="-1" role="dialog"
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
					<form class="form-horizontal" id="insert_user_form">
						<div class="form-group">
							<label for="edit_emp_no" class="col-sm-2 control-label">用户编号</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_emp_no" placeholder="用户编号" name="emp_no"/> -->
								<select	class="form-control" id="edit_emp_no" placeholder="用户编号" name="emp_no">
									<option value="">--请选择--</option>
									<c:forEach items="${employeeList}" var="item">
										<option value="${item.emp_no}">${item.emp_no}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_type" class="col-sm-2 control-label">用户身份</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_type" placeholder="用户身份" name="type"/> -->
								<select	class="form-control" id="edit_type" placeholder="用户身份" name="type">
									<option value="">--请选择--</option>
										<option value="0">售票员</option>
										<option value="1">管理员</option>
										<option value="2">经理</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_status" class="col-sm-2 control-label">用户状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_status" placeholder="用户状态" name="status"/> -->
								<select	class="form-control" id="edit_type" placeholder="用户状态" name="status">
									<option value="0">未激活</option>
										<option value="0">未激活</option>
										<option value="1">已激活</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="insertuser()">确认添加</button>
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
		function edituser(no) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>user/detail.action",
				data:{"no":no},
				success:function(data) {
					$("#edit_emp_no").val(data.emp_no);
					$("#edit_type").val(data.type);
					$("#edit_status").val(data.status);
				}
			});
		}
		function edituserpass(no) {
			if(window.confirm('你确定要重置该用户密码吗？')){
				$.post("<%=basePath%>user/updatePass.action",{"no":no},function(data){
					alert("用户密码重置成功！");
				});
             }
		}
		function updateuser() {
			$.post("<%=basePath%>user/update.action",$("#edit_user_form").serialize(),function(data){
				alert("用户信息更新成功！");
				window.location.reload();
			});
		}
		function comfirmuser() {
			$.post("<%=basePath%>user/updatePass.action",$("#edit_userpass_form").serialize(),function(data){
				alert("用户密码重置成功！");
				window.location.reload();
			});
		}
		function deleteuser(no) {
			if(confirm('确实要删除该员工吗?')) {
				$.post("<%=basePath%>user/delete.action",{"no":no},function(data){
					alert("员工信息删除成功！");
					window.location.reload();
				});
			}
		}
		
		/* insert_user_form */
		function insertuser() {
			$.post("<%=basePath%>user/insert.action",$("#insert_user_form").serialize(),function(data){
				alert("员工信息添加成功！");
				window.location.reload();
			});
		}
		
	</script>

</body>

</html>
