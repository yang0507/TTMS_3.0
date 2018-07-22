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

<title>个人中心</title>

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
		</nav>

		<div id="page-wrapper">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">个人信息一览</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="update_employee_form">
						<input type="hidden" id="insert_cust_id" name="emp_id" value="${sessionScope.loginingUser.employee.emp_id }"/>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label" >编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNo" readonly="readonly" placeholder="员工编号" name="emp_no" value="${sessionScope.loginingUser.employee.emp_no }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeName" placeholder="员工姓名" name="emp_name" value="${sessionScope.loginingUser.employee.emp_name }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">联系方式</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNum" placeholder="联系方式" name="emp_tel_num" value="${sessionScope.loginingUser.employee.emp_tel_num }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">家庭住址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeAddr" placeholder="家庭住址" name="emp_addr" value="${sessionScope.loginingUser.employee.emp_addr }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">私人邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeEmail" placeholder="私人邮箱" name="emp_email" value="${sessionScope.loginingUser.employee.emp_email }"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="updateemployee()">确认修改</button>
						</div>
					</form>
				</div>

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">登录信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="update_user_form">
						<!-- <input type="hidden" id="insert_cust_id" name="cust_id"/> -->
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeNo" readonly="readonly"  placeholder="账号" name="emp_no" value="${sessionScope.loginingUser.emp_no }"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="edit_employeeName" placeholder="密码" name="emp_pass" value="********"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10">
								<c:if test="${sessionScope.loginingUser.type == 0}">
									<input type="text" class="form-control" id="edit_employeeNum"  readonly="readonly" placeholder="职位"  value="售票员"/>
								</c:if>
								<c:if test="${sessionScope.loginingUser.type == 1}">
									<input type="text" class="form-control" id="edit_employeeNum"  readonly="readonly" placeholder="职位"  value="管理员"/>
								</c:if>
								<c:if test="${sessionScope.loginingUser.type == 2}">
									<input type="text" class="form-control" id="edit_employeeNum"  readonly="readonly" placeholder="职位"  value="经理"/>
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_employeeName" class="col-sm-2 control-label">状态</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_employeeAddr" placeholder="状态"  readonly="readonly"  value="已激活"/>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="updateUser()">确认修改</button>
						</div>
					</form>
				</div>


		</div>

	</div>

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
<%-- 		function updateemployee() {
			$.post("<%=basePath%>employee/update.action",$("#edit_employee_form").serialize(),function(data){
				alert("员工信息更新成功！");
				window.location.reload();
			});
		} --%>
		
		function updateemployee() {
			$.post("<%=basePath%>admin/updateemployee.action",$("#update_employee_form").serialize(),function(data){
				alert("信息更新成功！需要重新登录");
				window.location.href="<%=basePath%>login/quit.action";
			});
		}
		
		function updateUser() {
			$.post("<%=basePath%>admin/updateUser.action",$("#update_user_form").serialize(),function(data){
				alert("信息更新成功！需要重新登录");
				window.location.href="<%=basePath%>login/quit.action";
			});
		}
	</script>

</body>

</html>
