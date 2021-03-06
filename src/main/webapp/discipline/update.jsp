<%@ page language="java" pageEncoding="utf-8"%>
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
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i> ${loginUser.uname } <span class="caret"></span>
				  </button>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
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
				  <li class="active">修改</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form">
				  <div class="form-group">
				  <input type="hidden" id="disid" value="${discipline.disid }" />
					<label for="exampleInputPassword1">学科名称</label>
					<input type="text" class="form-control" id="disname" value="${discipline.disname }">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">学科费用</label>
					<input type="text" class="form-control" id="discost" value="${discipline.discost}">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">学科课时</label>
					<input type="text" class="form-control" id="discoursetime" value="${discipline.discoursetime}">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">学科描述</label>
					<input type="text" class="form-control" id="disstatus" value="${discipline.disstatus}">
				  </div>
				  <button type="button" id="btnUpdate" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
				  <button type="button" id="btnReset" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
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
			    $("#btnUpdate").click(function(){
			    	var discostVal = $("#discost").val();
			    	if(discostVal==""){
			    		layer.msg("学科学费不能为空!", {time:1000, icon:0, shift:5}, function(){});
			    		return;
			    	}
			    	var disnameVal = $("#disname").val();
			    	if(disnameVal==""){
			    		layer.msg("学科名称不能为空!", {time:1000, icon:0, shift:5}, function(){});
			    		return;
			    	}
			    	var discoursetimeVal = $("#discoursetime").val();
			    	if(discoursetimeVal==""){
			    		layer.msg("课时不能为空!", {time:1000, icon:0, shift:5}, function(){});
			    		return;
			    	}
			    	$.ajax({
			    		url:"${APPPATH}/discipline/updateDiscipline",
			    		type:"post",
			    		data:{"disid":$("#disid").val(),"discost":$("#discost").val(),"disname":$("#disname").val(),"discoursetime":$("#discoursetime").val()},
			    		success:function(result){
			    			if(result.flag){
			    				layer.msg("学科信息修改成功!", {time:1000, icon:6, shift:6}, function(){});
			    				window.location.href='${APPPATH}/discipline/index';
			    			}else{
			    				layer.msg("学科信息修改失败!", {time:1000, icon:5, shift:5}, function(){});
			    			}
			    		}
			    	});
			    });
            });
        </script>
  </body>
</html>
