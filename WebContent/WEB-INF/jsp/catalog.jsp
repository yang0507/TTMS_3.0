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

<title></title>
<!-- 左侧目录 -->
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

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><br /></li>
					<c:if test="${ sessionScope.loginingUser.type == 0}"><!-- 售票员只卖票 -->
							<li><a href="<%=basePath%>sellTickets/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 售票管理</a></li>
							<li><a href="<%=basePath%>sale_item/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 订单信息查看</a></li>
					</c:if>
					<c:if test="${ sessionScope.loginingUser.type == 1}"><!-- 管理员除了登陆用户管理 -->
							<li><a href="<%=basePath%>dataDict/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 字典管理</a></li>
							<li><a href="<%=basePath%>employee/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 员工管理</a></li>
							<li><a href="<%=basePath%>play/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 剧目管理</a></li>
							<li><a href="<%=basePath%>studio/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 影厅管理</a></li>
							<li><a href="<%=basePath%>schedule/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 演出管理</a></li>
							<li><a href="<%=basePath%>sellTickets/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 售票管理</a></li>
							<li><a href="<%=basePath%>sale_item/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 订单信息查看</a></li>
					</c:if>
					<c:if test="${ sessionScope.loginingUser.type == 2}"><!-- 经理拥有最高权限 -->
							<li><a href="<%=basePath%>dataDict/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 字典管理</a></li>
							<li><a href="<%=basePath%>employee/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 员工管理</a></li>
							<li><a href="<%=basePath%>play/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 剧目管理</a></li>
							<li><a href="<%=basePath%>studio/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 影厅管理</a></li>
							<li><a href="<%=basePath%>schedule/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 演出管理</a></li>
							<li><a href="<%=basePath%>sellTickets/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 售票管理</a></li>
							<li><a href="<%=basePath%>sale_item/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 订单信息查看</a></li>
							<li><a href="<%=basePath%>user/list.action" class="active"><i
									class="fa fa-edit fa-fw"></i> 登录用户管理</a></li>
							<li><a href="#" class="active"><i
									class="fa fa-edit fa-fw"></i> 预留模块</a></li>
					</c:if>
					
<!-- 					<li><a href="salevisit.action"><i
							class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li> -->
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>


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

</body>

</html>
