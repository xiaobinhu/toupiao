<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'kirto.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-jp.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/default/easyui.css">
	
	<script type="text/javascript">
	     $(function(){
	       $("#tree").tree({
	          url:"selectCategory.con",
	          //定义一个点击事件 用户在点击选项卡的时候会触发 对应函数的参数 就是点击的选项卡
	          onClick:function(treeNode){
	             showBook(treeNode) 
	          }              
	       })
	       
	       $("#xuanxiang").tabs({
	          fit:true
	       
	       })
	    })
	    
	    
	    function showUser(){
	     
	        //得到页签是否存在
	        var a = $("#xuanxiang").tabs("exists","用户信息展示");
	       
	        if(a){
	            //如果存在 则选中原来的标签
	            $("#xuanxiang").tabs("select","用户信息展示");
	        }else{
	        
	            $("#xuanxiang").tabs("add",{
	                title:"用户信息展示",
	                closable:true,//是否展示关闭按钮
	                content:"<iframe src='showAll.jsp' width='100%' height='100%''></iframe>" //选项卡面板内容
	            });
	        }
	    }
	    
	    
	    function showBook(treeNode){
	        var a = $("#xuanxiang").tabs("exists",treeNode.text);
	        if(a){
	          $("#xuanxiang").tabs("select",treeNode.text); 
	        
	        }else{
	          $("#xuanxiang").tabs("add",{
	               title: treeNode.text,
	               closable:true,//是否展示关闭按钮
	               content:"<iframe src='showBook.jsp?id="+treeNode.id+"'width='100%' height='100%'></iframe>"
	          })
	        
	        }
	    }
	    
	</script>
  </head>
  
  <body class="easyui-layout">
      <div data-options="region:'north',title:'无聊',split:true,height:100"></div>   
      <div data-options="region:'south',title:'有病',split:true,height:100"></div>  
  	  <div data-options="region:'west',split:true,title:'导航菜单',width:200"></div>
  	  
  	  <div data-options="region:'east',split:true,title:'公共信息',width:200"></div>
  	  <div data-options="region:'center',title:'展示页面'">
  	     
  	  </div> 
  	  
  </body>
</html>
