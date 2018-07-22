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

<title>座位信息管理</title>
    <style>
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
						     <div id="seat-map">
						        <div class="front">
						        <center><h1 >银幕中央</h1></center>
						        	<br />
						        	<br />
						        	<br />
						        </div>                    
						     </div>
						     <center>
						     <div class="div_scroll">
						    <!--  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#studioinsertDialog">添加</button> -->
						     	<c:forEach items="${seatList}" var="seat" varStatus="count">
									<c:if test="${seat.seat_status == 1}">
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#seatDialog" onclick="editseat(${seat.seat_id})">完好</a>
									</c:if>
									<c:if test="${seat.seat_status == -1}">
										<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#seatDialog" onclick="editseat(${seat.seat_id})">损坏</a>
									</c:if>
									<c:if test="${seat.seat_status == 0}">
										<a href="#" class="sel_btn" data-toggle="modal" data-target="#seatDialog" onclick="editseat(${seat.seat_id})">信息待定</a>
									</c:if>
									<c:if test="${(count.index+1) % studio.studio_col_count == 0 }">
										<hr/>
									</c:if>
								</c:forEach>
						     </div>
						     </center>
					<!-- </div> -->
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>
	<div class="modal fade" id="seatDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改座位状态</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_seat_form">
						<input type="hidden" id="edit_seat_id" name="seat_id"/>
						<div class="form-group">
							<label for="edit_seat_row" class="col-sm-2 control-label">行数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_seat_row" placeholder="行数" readonly="readonly" name="seat_row"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_seat_column" class="col-sm-2 control-label">列数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_seat_column" placeholder="列数" readonly="readonly" name="seat_column"/>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_seat_status" class="col-sm-2 control-label">状态</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_seat_status" placeholder="状态" name="seat_status">
								<option value="1">完好</option>
									<option value="0">信息待定</option>
									<option value="1">完好</option>
									<option value="-1">损坏</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateseat()">保存修改</button>
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
	function editseat(id) {
		$.ajax({
			type:"get",
			url:"<%=basePath%>seat/detail.action",
			data:{"id":id},
			success:function(data) {
				$("#edit_seat_id").val(data.seat_id);
				$("#edit_studio_id").val(data.studio_id);
				$("#edit_seat_row").val(data.seat_row);
				$("#edit_seat_column").val(data.seat_column);
				$("#edit_seat_status").val(data.seat_status);
			}
		});
	}
	
	function updateseat() {
		$.post("<%=basePath%>seat/update.action",$("#edit_seat_form").serialize(),function(data){
			alert("座位信息更新成功！");
			window.location.reload();
		});
	}
		
	</script>
</body>
	
</html>
