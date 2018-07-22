<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link href="<%=basePath %>static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<title>登录 </title>

</head>
<body>

<div class="header"> <h1>光线国际影院管理系统</h1></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="<%=basePath %>login/login.action" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="usernametextid" name="emp_no" type="text" placeholder="账户" class="input-text size-L"  required >
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input name=emp_pass type="password" placeholder="密码" class="input-text size-L" required onclick="checkstate()">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" name="checkcode" placeholder="验证码" required style="width:150px;">
          &nbsp;&nbsp;&nbsp;<img id="imgid" onclick="changeImg()"
					src="${pageContext.request.contextPath}/checkIdServlet"><span>点击图片更换</span><br/>
					<span><font color="red">
						<c:if test="${ sessionScope.checkError == 0}">
							验证码出错
						</c:if>
					</font></span>
					<br/>
		</div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">西安邮电大学  BS剧院票务管理系统</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
	function changeImg(){
		var img = document.getElementById("imgid");
		img.src="${pageContext.request.contextPath}/checkIdServlet?time="+new Date().getTime();
	}	
	
	function checkstate(){
		var value=document.getElementById("usernametextid").value;
		if(value!=null){
				$.post("<%=basePath%>login/checkstatus.action",{"no":value},function(data){
/* 					window.location.reload(); */
						if(${sessionScope.userStatus  == 0}){
							if(confirm('是否前去激活?')) {
								window.location.href="<%=basePath%>activate.jsp";
							}else{
								alert("未激活账号不可登录系统！");
							}
						}
					});
		}
	}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/my.js"></script>
</body>
</html>