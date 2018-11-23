<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	response.setHeader("Expires", "Sat,6 May 1995 12:00:00 GMT");
	response.setHeader("Cache-Control", "no-store,no-cache,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="css/style.css" />

   	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-jp.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/default/easyui.css"/>
    <script type="text/javascript">
               $(function(){
		         $("#vu_user_name").validatebox({
		             required:true,
		             missingMessage:"请输入用户名"
		             
		          })   
		          
		        $("#pwd").validatebox({
		             required:true,
		             missingMessage:"请输入密码"
		             
		          })  
               })  
    </script>
    
</head>
<body>
<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="login" class="wrap">
	<div class="main">
		<div class="corner"></div>
		<div class="introduce">
			<h2>百知</h2>
			<p>网上调查系统...</p>
		</div>
		<div class="login">
			<h2>用户登录</h2>
			<form method="post" action="login.con">
				<dl id="loginBox">
					<dt>用户名：</dt>
					<dd><input type="text" class="input-text" name="vu_user_name" id="vu_user_name"/></dd>
					<dt>密　码：</dt>
					<dd><input type="password" class="input-text" name="vu_password" id="pwd"/></dd>
					<dt></dt>
					<dd><input type="submit" class="input-button" value="登录" /> <a href="reg.jsp">新用户注册</a></dd>
				</dl>
			</form>
			<div class="error"></div>
		</div>
	</div>
</div>
<div class="wrap">
</div>
<div id="footer" class="wrap">
	百知 &copy; 版权所有
</div>
</body>
</html>

