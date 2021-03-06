<%@ page language="java" pageEncoding="utf-8"%>
<%@	 taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APPPATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APPPATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APPPATH }/css/main.css">
	<link rel="stylesheet" href="${APPPATH }/css/doc.min.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i> ${loginUser.uname } <span class="caret"></span>
				  </button>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人信息</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
						<li class="divider"></li>
						<li><a href="${APPPATH}/loginout"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
					  </ul>
			    </div>
			</li>
            <li style="margin-left:10px;padding-top:8px;">
				<button type="button" class="btn btn-default btn-danger">
				  <span class="glyphicon glyphicon-question-sign"></span> 帮助
				</button>
			</li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
			<ul style="padding-left:0px;" class="list-group">
					<li class="list-group-item tree-closed" >
						<a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a> 
					</li>
					<li class="list-group-item tree-closed">
						<span><i class="glyphicon glyphicon glyphicon-tasks"></i> 系统管理 <span class="badge" style="float:right">5</span></span> 
						<ul style="margin-top:10px;display:none;">
							<li style="height:30px;">
								<a href="${APPPATH}/clazz/index"><i class="glyphicon glyphicon-user"></i> 班级管理</a> 
							</li>
							<li style="height:30px;">
								<a href="${APPPATH}/role/list"><i class="glyphicon glyphicon-king"></i> 角色管理</a> 
							</li>
							<li style="height:30px;">
								<a href="${APPPATH}/discipline/index"><i class="glyphicon glyphicon-lock"></i> 学科管理</a> 
							</li>
							<li style="height:30px;">
								<a href="${APPPATH}/course/list"><i class="glyphicon glyphicon-lock"></i> 课程表管理</a> 
							</li>
							<li style="height:30px;">
								<a href="${APPPATH}/classroom/index"><i class="glyphicon glyphicon-lock"></i> 教室管理</a> 
							</li>
						</ul>
					</li>
				</ul>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="${APPPATH}/main">首页</a></li>
				  <li><a href="${APPPATH }/user/index">数据列表</a></li>
				  <li class="active">新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="saveForm">
				  <div class="form-group">
					<label for="exampleInputPassword1">班级名称</label>
					<input type="text" class="form-control" id="cname" name="cname" placeholder="请输入班级名称">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">班级容纳人数</label>
					<input type="text" class="form-control" id="cpeoplecount" name="cpeoplecount" placeholder="请输入班级人数">
				  </div>
				  <label for="exampleInputPassword1">班主任</label>
				   <select name="eid" id="empListByRole">
				  	<c:forEach items="${empListByRole }" var="empListByRole">
				  		<option value="${empListByRole.eid }">${empListByRole.ename }</option>
				  	</c:forEach>			  
				  </select>
				  <div class="form-group">
					<label for="exampleInputEmail1">开班时间</label>
					<input type="date" class="form-control" id="cstarttime" name="cstarttime" >
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">结班时间</label>
					<input type="date" class="form-control" id="clasttime" name="clasttime" >
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">状态</label>
					<input type="text" class="form-control" id="cstatus" name="cstatus" placeholder="请填写开班状态">
				  </div>
				  <button type="button" id="btnSave" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
				  <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
				</form>
			  </div>
			</div>
        </div>
      </div>
    </div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">帮助</h4>
		  </div>
		  <div class="modal-body">
			<div class="bs-callout bs-callout-info">
				<h4>测试标题1</h4>
				<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>测试标题2</h4>
				<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
			  </div>
		  </div>
		</div>
	  </div>
	</div>
    <script src="${APPPATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APPPATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APPPATH }/script/docs.min.js"></script>
	<script src="${APPPATH }/layer/layer.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
			    $("#btnSave").click(function(){
			    	$.ajax({
			    		url:"${APPPATH}/clazz/saveClazz",
			    		type:"post",
			    		data:$("#saveForm").serialize(),
			    		success:function(result){
			    			if(result.flag){
			    				layer.msg("新增成功!", {time:1000, icon:6, shift:6}, function(){});
			    				window.location.href="${APPPATH}/clazz/index";
			    			}else{
			    				layer.msg("新增失败!", {time:1000, icon:5, shift:5}, function(){});
			    			}
			    		}
			    	});
			    });
            });
        </script>
  </body>
</html>
