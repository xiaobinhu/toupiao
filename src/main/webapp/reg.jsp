<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注   册</title>
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
		          
           
		      $.extend($.fn.validatebox.defaults.rules, {    
		              checkpwd: {    
		               validator: function(value, param){
		                 var a = $("#pwd").val();   
		                return a==value;    
		        },    
		        message: "两次输入密码不一致"   
		                     }     
		               });
             $("#rpwd").validatebox({
		          required:true,
		          validType:"checkpwd",
		          missingMessage:"请输入重复密码"
		             
		        })   
         })
              
    
    </script>

</head>
<body>
<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="navbar" class="wrap">
	<div class="search">
	<!--  
		<form method="get" action="index.html">
			<input type="text" name="keywords" class="input-text" /><input type="submit" name="submit" class="input-button" value="" />
		</form>
	-->	
	</div>
</div>
<div id="register" class="box">
	<h2>新用户注册</h2>
	<div class="content">
	   <form method="post" action="reg.con">
			<dl>
		
				
				<dt>用户名：</dt>
				<dd><input type="text" class="input-text" name="vu_user_name"  id="vu_user_name"/></dd>
				<dt>密码：</dt>
				<dd><input type="password" class="input-text" name="vu_password" id="pwd"/></dd>
				<dt>确认密码：</dt>
				<dd><input type="password" class="input-text" id="rpwd"/></dd>
				<dt></dt>
				<dd><input type="submit" class="input-button" value=" "/></dd>
			</dl>
		</form>
		
	</div>
</div>
<div id="footer" class="wrap">
	百知 &copy; 版权所有
</div>
</body>
</html>