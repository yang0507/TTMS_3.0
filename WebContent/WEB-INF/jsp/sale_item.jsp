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

<title>订单信息查看</title>

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
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/sale_item/list.action" method="get">
						<div class="form-group">
							<label for="sale_ticket_id">票号</label> 
							<input type="text" class="form-control" id="sale_ticket_id" value="${sale_ticket_id }" name="sale_ticket_id"/>
						</div>
						<div class="form-group">
							<label for="sale_emp_no">售票人编号</label> 
							<input type="text" class="form-control" id="sale_emp_no" value="${sale_emp_no }" name="sale_emp_no"/>
						</div>
						<div class="form-group">
							<label for="sale_type">订单类型</label> 
						<%-- 	<input type="text" class="form-control" id="sale_type" value="${sale_type }" name="sale_type"/> --%>
							<select	class="form-control" id="sale_type" placeholder="状态" name="sale_type">
								<option value="">请选择</option>
									<option value="1">销售单</option>
									<option value="-1">退款单</option>
								</select>
						</div>
						<div class="form-group">
							<label for="sale_time">建单时间</label> 
							<input type="text" class="form-control" id="sale_time" value="${sale_time }" name="sale_time"/>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
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
									<th>票号</th>
									<th>订单号</th>
									<th>票价</th>
									<th>建立时间</th>
									<th>类型</th>
									<th>售票人编号</th>
									<th>售票人名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${row.ticket_id}</td>
										<td>${row.sale_ID}</td>
										<td>${row.sale_item_price}</td>
										<td>${row.sale.sale_time}</td>
										<td>
											<c:if test="${row.sale.sale_type == 1}">
												销售单
											</c:if>
											<c:if test="${row.sale.sale_type == -1}">
												退款单
											</c:if>
										</td>
										<td>${row.sale.employee.emp_no}</td>
										<td>${row.sale.employee.emp_name}</td>
										<td>
											<c:if test="${row.sale.sale_type == 1}">
												<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#backTicketDialog" onclick="editTicket(${row.ticket_id})">退票</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<center><itcast:page url="${pageContext.request.contextPath }/sale_item/list.action" /></center>
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
	<!-- 显示票的具体信息 具体展示时间 -->
	<div class="modal fade" id="backTicketDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">当前票信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_ticket_form">
						<div class="form-group">
							<label for="edit_ticketnum" class="col-sm-2 control-label">票号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_ticketnum" placeholder="票号" name="ticket_id"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ticketprice" class="col-sm-2 control-label">票价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_ticketprice" placeholder="票价" name="ticket_price"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_ticketstatus" class="col-sm-2 control-label">票状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_ticketstatus" placeholder="票状态" name="play_lang_id"/> -->
								<select	class="form-control" id="edit_ticketstatus" name="play_lang_id">
									<option value="0">代售</option>
									<option value="1">锁定</option>
									<option value="9">售出</option>
									<option value="-1">座位损坏</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_seatstatus" class="col-sm-2 control-label">座位状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_seatstatus" placeholder="座位状态" name="play_lang_id"/> -->
								<select	class="form-control" id="edit_seatstatus" name="play_lang_id">
									<option value="0">无座</option>
									<option value="1">完好</option>
									<option value="-1">损坏</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_scheditem" class="col-sm-2 control-label">上映时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_scheditem" placeholder="上映时间" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_now" class="col-sm-2 control-label">现在时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_now" placeholder="现在时间" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_playname" class="col-sm-2 control-label">剧目名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_playname" placeholder="剧目名称" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studioname" class="col-sm-2 control-label">影厅名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studioname" placeholder="影厅名称" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studiostatus" class="col-sm-2 control-label">影厅状态</label>
							<div class="col-sm-10">
								<!-- <input type="text" class="form-control" id="edit_studiostatus" placeholder="影厅状态" name="play_lang_id"/> -->
								<select	class="form-control" id="edit_studiostatus" >
									<option value="1">完好</option>
									<option value="-1">异常</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="backTicket()">确定退票</button>
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
		function editTicket(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>sale_item/detail.action",
				data:{"ticket_id":id},
				success:function(data) {
					$("#edit_ticketnum").val(data.ticket_id);
					$("#edit_ticketprice").val(data.ticket_price);
					$("#edit_ticketstatus").val(data.ticket_status);
					$("#edit_seatstatus").val(data.seat.seat_status);
					$("#edit_scheditem").val(getFormatDate(data.schedule.sched_time));
					$("#edit_now").val(getFormatDate(new Date().getTime()));
					$("#edit_playname").val(data.schedule.play.play_name);
					$("#edit_studioname").val(data.schedule.studio.studio_name);
					$("#edit_studiostatus").val(data.schedule.studio.studio_flag);
					
				}
			});
		}
		
		function backTicket() {
			$.post("<%=basePath%>sale_item/backticket.action",$("#edit_ticket_form").serialize(),function(data){
				alert("退票成功！");
				window.location.reload();
			});
		}

		
	</script>

</body>

</html>
