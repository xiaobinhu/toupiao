<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showAll.jsp' starting page</title>
    
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
	    
	    //页面展示 分页 所有主题选项展示 ----------------------------
	       $("#table").datagrid({
	          title:"投票信息展示",
	          width:630,
	          height:387,
	          url:"selectBy.con",
	          pagination:true,//分页控件
	          columns:[[
	            {title:"",field:"vs_id",width:30},
	            {title:"投票标题",field:"vs_title",width:400},
	            {title:"选项数",field:"changeCount"},
	            {title:"投票人数",field:"personCount"},
	            {title:"操作",field:"cz",
	              formatter:function(value,rowData,rowIndex){
	              
	                  
	                  return "<a href='javascript:void(0)' onclick='totoupiao("+rowData.vs_id+")'>参与投票</a>" ; 
	                // return "<a href='javascript:void(0)' onclick='totoupiao()'>参与投票</a>"; 
	                /*  return "<a href='toupiao.con?id="+rowData.vs_id+"' onclick='totoupiao()'>参与投票</a>"; */
	                //return "<a href='javascript:void(0)'>aaaa</a>"
	              }
	            }
	          ]],
	           striped:true,
	           toolbar:"#tool",//工具栏
	           
	         //页面展示 分页 所有主题选项展示  end-------------------
	         // 双击事件，管理主体以及选项---------------
	           onDblClickRow:function(rowIndex,rowData){
                   //console.log(rowData)
                   //var list =rowData.list1;
                   $("#hidden").val(rowData.vs_id);
                   $("#option").html("");
                   $("#titlee").val(rowData.vs_title);
	               $.ajax({
	                 url:"option.con",
	                 type:"get",
	                 data:{"sid":rowData.vs_id},
	                  success:function(data){
	                   var list = data.list1;
	                   console.log(list)
	                   for(var i=0;i<list.length;i++){
	                      
	                     if(i==0){
	                      $("#option").append("<input type='checkbox' name='delete' value='"+list[0].vo_id+"' /><input type='text'  value='"+list[0].vo_option+"'/><br/>");
	                     }
	                     else{
	                     $("#option").append("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='checkbox' name='delete' value='"+list[i].vo_id+"' /><input type='text'  value='"+list[i].vo_option+"'/><br/>");         
	                         }
	                      }
	                  } 
	               });
	               
	               $.ajax({
	                 url:"type.con",
	                 type:"get",
	                 data:{"sid":rowData.vs_id},
	                 success:function(data){
	                     if(data.type==0){
	                      $("#dan").prop("checked",true); 
	                     
	                     }else{
	                       $("#duo").prop("checked",true);
	                     }
	                 
	                 }
	               })
	               
	              $("#guanli").dialog("open");
	              
	            }
	       });
	         // 双击事件，管理主体以及选项end-------------------
	         
	         //发布新投票主题弹窗-----------------
	       $("#toadd").dialog({
              closed:true,
              width:400,
              resizable:true,
              closable:true,
              title:"发布新投票"
	           });
	         //发布新投票主题弹窗end-----------------  
	         
	         //管理主体弹窗------------------ 
	       	   $("#guanli").dialog({
              closed:true,
              width:400,
              resizable:true,
              closable:true,
              title:"管理选项"
	           }); 
	        //管理主体弹窗------------------ end      
	    });
	    
	    //搜索刷新---------------
	    function check(){
	      var a = $("#title").val();
	       $("#table").datagrid("reload",{"title":a});
	    }
	    //搜索刷新end-------------------------
	    
	    function fabu(){
	       $("#toadd").dialog("open");
	    
	    }
	    //增加新的选项框-----------------
	    var i =1;
	    function check1(){
	       $("#addpan").append("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='text' name='list["+i+"].vo_option'/><br/>");
	       i++;
	    }
	   //增加新的选项框-----------------end
	   
	   //管理弹窗增加新的选项框-----------------
	    var f=0;
	    function check3(){
	    var c = $("#option").html();
	       if(c==""){
	          $("#option").append("<input type='checkbox' name='delete' value='0' /><input type='text' name='list["+f+"].vo_option'/><br/>");
	       }else{
	       $("#option").append("&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='checkbox' name='delete' value='0' /><input type='text' name='list["+f+"].vo_option'/><br/>");
	       }
	       f++;
	    }
	   //管理弹窗增加新的选项框-----------------end 
	   
	   
	    function check2(){
	        $("#toadd").dialog("close");
	    }
	    
	      function check6(){
	        $("#guanli").dialog("close");
	    }
	     //添加主题 提交form表单------------------
	    function toadd1(){
	      $("#myform").form("submit",{
	           url:"add.con",
	           success:function(data){
	              data=JSON.parse(data);
	              if(data){
	                 i=1;
	                 alert("添加成功");
	                 $("#toadd").dialog("close");
	                 $("#table").datagrid("reload"); 
	              }else{
	                  alert("添加失败");
	              }
	           }
	         
	        }) ;
	    } 
	    //添加主题 提交form表单------------------end
	    
	    //管理弹窗 提交form表单----------------
	    function guanli(){
	       $("#myform1").form("submit",{
	           url:"guanli.con",
	           success:function(data){
	              data=JSON.parse(data);
	              if(data){
	                 alert("管理成功");
	                 $("#guanli").dialog("close");
	                 $("#table").datagrid("reload"); 
	                 f=0;
	              }else{
	                  alert("管理失败");
	              }
	           }
	       
	       })
	    }
	    
	    //管理弹窗 提交form表单----------------end
	    
	    //增加选项卡-------------------------
	   function totoupiao(aa){
	        //得到页签是否存在
	
	        var a = $("#xuanxiang").tabs("exists","投票"+aa);
	       
	        if(a){
	            //如果存在 则选中原来的标签
	            $("#xuanxiang").tabs("select","投票"+aa);
	        }else{
	        
	            $("#xuanxiang").tabs("add",{
	                title:"投票",
	                closable:true,//是否展示关闭按钮
	                content:"<iframe src='toupiao.jsp?id="+aa+"' width='100%' height='100%''></iframe>" //选项卡面板内容
	            });
	        }
	    }
	    //增加选项卡 ----------------------end
	</script>
  </head>
  
  <body class="easyui-layout">

<!--       <table id="table">
      </table>
   
      <div id="tool">
          <a href="JavaScript:void(0)"  class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="fabu()">添加</a><br/>
         <input type="text" name="title" id="title"/><input type="button" value="搜索" onclick="check()"/> 
     </div>
     
     <div id="toadd">
          <form id="myform" method="post">
        
                                        投票内容：<input type="text" name="vs_title"/><br/>
             
                                        投票类型：<input type="radio" name="vs_type" value="0"/>单选<input type="radio" name="vs_type" value="1"/>多选<br/>
             
                                       投票选项：<span id="addpan"><input type="text" name="list[0].vo_option"/><br/></span>
             
             <input type="button" value="确定" onclick="toadd1()"/>&nbsp&nbsp&nbsp<a href="javascript:void(0)" onclick="check1()">增加选项</a>&nbsp&nbsp<a href="javascript:void(0)" onclick="check2()">取消操作</a>
        
         </form>
     </div> 
     
    <div id="guanli">
         <form id="myform1" method="post">
           
                                        投票内容：<input type="text" name="vs_title" id="titlee"/><br/>
                                       投票类型：<input type="radio" name="vs_type" value="0" id="dan"/>单选<input type="radio" name="vs_type" value="1" id="duo"/>多选<br/>
                                       投票选项：<span id="option"></span>
                    <input type="hidden"  id="hidden" name="sid"/>
             <input type="button" value="确定" onclick="guanli()"/>&nbsp&nbsp&nbsp<a href="javascript:void(0)" onclick="check3()">增加选项</a>&nbsp&nbsp<a href="javascript:void(0)" onclick="check6()">取消操作</a>
             
       </form>
   </div> -->
     
      <div data-options="region:'north',title:'无聊',split:true,height:100"></div>   
      <div data-options="region:'south',title:'有病',split:true,height:100"></div>  
  	  <div data-options="region:'west',split:true,title:'导航菜单',width:200"></div>
  	  
  	  <div data-options="region:'east',split:true,title:'公共信息',width:200"></div>
  	  <div data-options="region:'center',title:'展示页面'">
           <div id="xuanxiang" class="easyui-tabs" data-options="fit:true">
           
              <div title="首页" >   
  	            <table id="table">
                </table>
              </div>
              
           </div> 
      </div>       
      <div id="tool">
          <a href="JavaScript:void(0)"  class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="fabu()">添加</a><br/>
         <input type="text" name="title" id="title"/><input type="button" value="搜索" onclick="check()"/> 
     </div>
     
     <div id="toadd">
          <form id="myform" method="post">
        
                                        投票内容：<input type="text" name="vs_title"/><br/>
             
                                        投票类型：<input type="radio" name="vs_type" value="0"/>单选<input type="radio" name="vs_type" value="1"/>多选<br/>
             
                                       投票选项：<span id="addpan"><input type="text" name="list[0].vo_option"/><br/></span>
             
             <input type="button" value="确定" onclick="toadd1()"/>&nbsp&nbsp&nbsp<a href="javascript:void(0)" onclick="check1()">增加选项</a>&nbsp&nbsp<a href="javascript:void(0)" onclick="check2()">取消操作</a>
        
         </form>
     </div> 
     
    <div id="guanli">
         <form id="myform1" method="post">
           
                                       投票内容：<input type="text" name="vs_title" id="titlee"/><br/>
                                       投票类型：<input type="radio" name="vs_type" value="0" id="dan"/>单选<input type="radio" name="vs_type" value="1" id="duo"/>多选<br/>
                                       投票选项：<span id="option"></span>
                    <input type="hidden"  id="hidden" name="sid"/>
             <input type="button" value="确定" onclick="guanli()"/>&nbsp&nbsp&nbsp<a href="javascript:void(0)" onclick="check3()">增加选项</a>&nbsp&nbsp<a href="javascript:void(0)" onclick="check6()">取消操作</a>
             
       </form>
   </div>
  	       
  	       
  	  
     
     
     
     
  </body>
</html>
