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

<title>售票管理</title>
    <style type="text/css">
        .sel_btn{
            height: 26px;
            line-height: 21px;
            padding: 0 11px;
            background: #02bafa;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            /*color: #fff;*/
            display: inline-block;
            text-decoration: none;
            font-size: 12px;
            outline: none;
        }
        .div_scroll{
			overflow: scroll;
			background-color: AliceBlue;
        }
        .div_image{
        	background-color:#00FFFF;
			width:150px;
			height:150px;
        }
    </style>
<link rel="stylesheet" type="text/css" href="../css/jq22.css" />
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
		<!-- /.navbar-header -->
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<jsp:include   page="catalog.jsp" flush="true"/>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="div_scroll">
						<c:forEach items="${schedList }" var="sched" varStatus="status">
							<c:if test="${sched.sched_status == 1 }">
								<c:if test="${sched.play.play_status != 1 }">
									<img src="../temp/noPlay.png" width="165" height="165"/>
									<img src="../temp/interval.jpg" width="30" height="165"/>
								</c:if>
								<c:if test="${sched.play.play_status == 1 }">
									<img src="../${sched.play.play_image}" width="165" height="165" alt="an image" 
									onclick="findTickets(${sched.sched_id})" title="影片：${sched.play.play_name} 
																		时间 ：${sched.sched_time}  
																		票价：${sched.sched_ticket_price}"/>
									<img src="../temp/interval.jpg" width="30" height="165"/>
								</c:if>
								
							</c:if>
							<c:if test="${sched.sched_status == 0 }">
								<img src="../temp/noTicket.jpg" width="165" height="165"/>
								<img src="../temp/interval.jpg" width="30" height="165"/>
							</c:if>
							<c:if test="${ (status.count)%5==0 }">
								<div style="background-color:AliceBlue;height:35px"></div>
							</c:if>
						</c:forEach>
					</div>
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
	<script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.seat-charts.min.js"></script>
	<script type="text/javascript">
		function findTickets(id){
			window.location.href="<%=basePath%>ticket/list.action?id="+id;
		}
	</script>
</body>
	
</html>
