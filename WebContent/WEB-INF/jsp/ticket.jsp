<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <title>售票页面</title>
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
		       
        <link rel="stylesheet" type="text/css" href="../css/jq22.css" />
        <style type="text/css">
            .front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
            .booking_area {float: right;position: relative;width:200px;height: 450px; }
            .booking_area h3 {margin: 5px 5px 0 0;font-size: 16px;}
            .booking_area p{line-height:26px; font-size:16px; color:#999}
            .booking_area p span{color:#666}
            div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
            div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
            div.seatCharts-row {height: 35px;}
            div.seatCharts-seat.available {background-color: #B9DEA0;}
            div.seatCharts-seat.focused {background-color: #76B474;border: none;}
            div.seatCharts-seat.selected {background-color: #E6CAC4;}
            div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}
            div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}
            div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}
            ul.seatCharts-legendList {padding-left: 0px;}
            .seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
            span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
            .checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
            #seats_chose {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}
            #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
        </style>
    </head>
    <body>

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
		<br/>

        <div class="container">
          <h2 class="title"><a href="#">售票页面</a></h2>
            <div class="demo clearfix">
                <!---左边座位列表----->
                <div id="seat_area">
                    <div class="front">屏幕</div>					
                </div>
                <!---右边选座信息----->
                <form action="<%=basePath%>ticket/sell.action" method="post">
	                <div class="booking_area">
	                	<div id="timeShow"></div>
	                	<!-- <div id="timer" style="color:red"></div> -->
	                	<input type="hidden" name="sched_id" value="${scheduleAll.sched_id }" />
	                    <p>演播厅名：<span>${scheduleAll.studio.studio_name }</span></p>
	                  	<p>票价：<span>${scheduleAll.sched_ticket_price } ￥</span></p>
	                   	<p>座位：</p>
	                    <ul id="seats_chose"></ul>
	                    <p>票数：<span id="tickects_num">0</span></p>
	                    <p>总价：<b>￥<span id="total_price">0</span></b></p>
	                    <input type="submit" class="btn" value="确定购买"/>
	                    <div id="legend">
	                    	<br/>已售出或异常的票信息不再显示
	                    </div>
	                 </div>
                </form>
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
            var price = ${scheduleAll.sched_ticket_price }; //电影票价
            $(document).ready(function() {
                var $cart = $('#seats_chose'), //座位区
                        $tickects_num = $('#tickects_num'), //票数
                        $total_price = $('#total_price'); //票价总额
                var sc = $('#seat_area').seatCharts({
                    map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道
                         	            
                    	 ${initseat} 
                    ],
                    naming: {//设置行列等信息
                        top: false, //不显示顶部横坐标（行） 
                        getLabel: function(character, row, column) { //返回座位信息 
                            return column;
                        }
                    },
                    legend: {//定义图例
                        node: $('#legend'),
                        items: [
                            ['a', 'available', '可用座'],
                           /*  ['c', 'unavailable', '坏座'] */
                        ]
                    },
                    click: function() {
                    	
                        if (this.status() == 'available') { //若为可选座状态，添加座位
                            
                            $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>'+'<input type="hidden" name="xx" value="'+(this.settings.row + 1)+'_'+this.settings.label+'"/>')
                                    .attr('id', 'cart-item-' + this.settings.id)
                                    .data('seatId', this.settings.id)
                                    .appendTo($cart);
                        	//开始倒计时
                        	document.getElementById("timeShow").innerHTML = "<div id='timer' style='color:red'></div>";
                        	//调整数据库中票状态为锁定
                        	<%-- window.location.href='<%=basePath%>ticket/lockTicket.action?schedid='+${scheduleAll.sched_id }+
                        			'&row='+(this.settings.row + 1)+'&col='+this.settings.label; --%>
                   			$.post("<%=basePath%>ticket/lockTicket.action",
                   				{"id":${scheduleAll.sched_id},"row":(this.settings.row + 1),"col":this.settings.label},function(data){
               					
               				});
                        	
                            $tickects_num.text(sc.find('selected').length + 1); //统计选票数量
                            $total_price.text(getTotalPrice(sc) + price);//计算票价总金额
                            return 'selected';
                        } else if (this.status() == 'selected') { //若为选中状态
                   			$.post("<%=basePath%>ticket/lockCancel.action",
                       			{"id":${scheduleAll.sched_id},"row":(this.settings.row + 1),"col":this.settings.label},function(data){
                   				alert("票已取消锁定");
                   			});
                            $tickects_num.text(sc.find('selected').length - 1);//更新票数量
                            $total_price.text(getTotalPrice(sc) - price);//更新票价总金额
                            $('#cart-item-' + this.settings.id).remove();//删除已预订座位
                            return 'available';
                        } else if (this.status() == 'unavailable') { //若为已售出状态
                             $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>'+'<input type="hidden" name="xx" value="'+(this.settings.row + 1)+'_'+this.settings.label+'"/>')
                                    .attr('id', 'cart-item-' + this.settings.id)
                                    .data('seatId', this.settings.id)
                                    .appendTo($cart);
                            return 'selected';
                        }  else {
                            return this.style();
                        }
                    }
                });
                //设置已售出的座位
                sc.get([${seat}]).status('unavailable');
            });
            function getTotalPrice(sc) { //计算票价总额
                var total = 0;
                sc.find('selected').each(function() {
                    total += price;
                });
                return total;
            }
        </script>
        <script type="text/javascript">        
            var maxtime = 2*60; //每次卖票选择时长不得超过2 分钟
            function CountDown() {
                if (maxtime >= 0) {
                    minutes = Math.floor(maxtime / 60);
                    seconds = Math.floor(maxtime % 60);
                    msg = "操作时间还有" + minutes + "分" + seconds + "秒";
                    //document.all["timer"].innerHTML = msg;
                    document.getElementById("timer").innerHTML = msg;
                    --maxtime;
                } else{
                    clearInterval(timer);
                    $.post("<%=basePath%>ticket/lockCheck.action",{
                    	"id":${scheduleAll.sched_id}},function(data){
               				alert("票已全部取消锁定");
               				window.location.reload();
               			});
                    /* window.location.reload(); */
                   /*  alert("操作超时！！"); */
                    <%-- window.location.href='<%=basePath%>ticket/lockCheck.action; --%>
                }
            }
            timer = setInterval("CountDown()", 1000);           
        </script>
    </body>
</html>
