<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APPPATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APPPATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APPPATH}/css/main.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
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
					<i class="glyphicon glyphicon-user"></i> ${loginUser.uname }<span class="caret"></span>
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
			</div>
		</div>
      </div>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;" action="${APPPATH}/user/index" method="post">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" type="text" placeholder="请输入查询条件" name="uname">
    </div>
  </div>
  <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" onclick="deleteUsers()" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APPPATH}/user/save'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
          <form id="delForm" name="form1">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox" id="checkAll"></th>
                  <th>账号</th>
                  <th>名称</th>
                  <th>邮箱地址</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
             
              </tbody>
			  <tfoot>
			  
			  </tfoot>
            </table>
            </form>
          </div>
			  </div>
			</div>
        </div>
      </div>

    <script src="${APPPATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APPPATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APPPATH}/script/docs.min.js"></script>
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
	            $("#checkAll").click(function(){
	            	var flag=$(this).prop("checked");
	            	$.each($(".abc"),function(index,obj){
	            		obj.checked=flag;
	            		
	            	})
	            })
	            
            });
            //换页函数,携带表单信息
            function goPage(nowPage){
	  			  form1.nowPage.value=nowPage;
	  			  form1.submit();
	  		  }
            $("[name=pageRow] option[value=${pageBean.pageRow}]").attr("selected","selected");
	  		  
           //单个删除
           function deleteUser(uid){
        	   layer.confirm("是否删除该用户?",  {icon: 3, title:'提示'}, function(cindex){
   			    layer.close(cindex);
   			    $.ajax({
   			    	url:"${APPPATH}/user/delete",
   			    	type:"post",
   			    	data:{"uid":uid},
   			    	success:function(result){
   			    		if(result.flag){
   			    			layer.msg("删除成功!", {time:1000, icon:6, shift:6}, function(){});
   			    			window.location.href="${APPPATH}/user/index";
   			    		}else{
   			    			layer.msg("删除失败!", {time:1000, icon:5, shift:5}, function(){});
   			    		}
   			    	}
   			    });
   			    
   			}, function(cindex){
   			    layer.close(cindex);
   			});
            };
            
            //批量删除
             function deleteUsers(){
            	layer.confirm("是否删除选中的用户?",  {icon: 3, title:'提示'}, function(cindex){
    			    layer.close(cindex);
    			    $.ajax({
    			    	url:"${APPPATH}/user/deleteUsers",
    			    	type:"post",
    			    	data:$("#delForm").serialize(),
    			    	success:function(result){
    			    		if(result.flag){
    			    			layer.msg("删除成功!", {time:1000, icon:6, shift:6}, function(){});
    			    			window.location.href="${APPPATH}/user/index";
    			    		}else{
    			    			layer.msg("删除失败!", {time:1000, icon:5, shift:5}, function(){});
    			    		}
    			    	}
    			    });
    			    
    			}, function(cindex){
    			    layer.close(cindex);
    			});
            }
            
            //修改
           function updateUser(uid){
                window.location.href = "${APPPATH}/user/update?uid="+uid;
            };
           function assignRole(uid){
            	window.location.href="${APPPATH}/user/assignRole?uid="+uid;
            }
            
        </script>
  </body>
</html>