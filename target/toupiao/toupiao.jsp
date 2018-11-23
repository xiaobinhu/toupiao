<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>参与投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-jp.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/default/easyui.css"/>
     <script type="text/javascript">
          $(function(){
          
          //投票页面的展示----------------------------
            $("#idd").val(${param.id});
             $.ajax({
                 url:"toupiao.con",
                 type:"get",
                 data:{"id":${param.id}},
                 success:function(a){
                  console.log(a)
                  $("#vs_title").html(a.message.vs_title) ; 
                  $("#sum").html(a.message.changeCount) ;  
                  $("#aaa").html(a.message.personCount);
                  var list =a.list;
                  for(var i=0;i<list.length;i++){
                      if(a.vs_type==0){
                      $("#xuanxiang").append("<li><input type='radio' value='"+list[i].vo_id+"'  name='oids'/>"+list[i].vo_option+"</li>");
                      }else{
                      $("#xuanxiang").append("<li><input type='checkbox' value='"+list[i].vo_id+"' name='oids'/>"+list[i].vo_option+"</li>");
                      }
                  }
                  
                 }
             });
          });
         //投票页面的展示----------------------------end 
          
          //投票-------------------------
          function qutoupiao(){
            var a = $("[name=oids]")
            var c= 0;
            for(var i=0;i<a.length;i++){
             
               if($(a[i]).prop("checked")){
                 c=1;
               }  
            }
            
            if(c==1){
            $("#myform").form("submit",{
               url:"addd.con",
               	success:function(data){
	             data=JSON.parse(data);
	            if(data){
	                 alert("投票成功");
                     parent.location.reload();
                     
	              }else{
	                  alert("投票失败,您已经投过票了");
	              } 
	          }
            })
          }else{
             alert("请先选中");
          }
          }
          //投票-------------------------end
     </script>
	
</head>
<body>
<jsp:include page="top.jsp" />
<div id="vote" class="wrap">
	<h2>参与投票</h2>
	<ul class="list">
		<li>
			<h4 id="vs_title"></h4>
			<p class="info">共有<span id="sum">aa</span>个选项，已有<span id="aaa">0</span>个网友参与了投票。</p>
			<form method="post" id="myform">
				
				<ol id="xuanxiang">
				     
				   <%-- <c:forEach items="${requestScope.list}" var="a">
				   
				   <li><input type='radio' name="vo_id"/></li>
					<li><input <c:if test='${requestScope.vs_type==0}'> type='radio'</c:if> <c:if test='${requestScope.vs_type==1}'> type='checkbox'</c:if> type='checkbox' name="vo_id"/>${a.vo_option}</li>
				   </c:forEach> --%>
				</ol>
				<p class="voteView">
					<input type="button" value="投票" onclick="qutoupiao()"/>
					<a href="vote!view.action?subject.id=">查看</a>
				</p>
				
				  <input type="hidden" id="idd" value="" name="vs_id"/>
			</form>
		</li>
	</ul>
</div>
<div id="footer" class="wrap">
	百知 &copy; 版权所有
</div>
</body>
</html>
