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
      </div>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;" action="${APPPATH}/clazz/index" method="post">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" type="text" placeholder="请输入班级名称" name="queryVal">
    </div>
  </div>
  <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" onclick="deleteUsers()" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APPPATH}/clazz/save'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
          <form id="delForm" name="form1">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox" id="checkAll"></th>
                  <th>名称</th>
                  <th>容纳人数</th>
                  <th>班主任</th>
                  <th>开班时间</th>
                  <th>结班时间</th>
                  <th>状态</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${pageBean.list }" var="clazz" varStatus="i">
                <tr>
                  <td>${i.count }</td>
				  <td><input type="checkbox" class="abc" name="uids" value="${clazz.cid }"></td>
                  <td>${clazz.cname }</td>
                  <td>${clazz.cpeoplecount}</td>
                  <td>${clazz.emp.ename}</td>
                  <td>${clazz.cstarttime }</td>
                  <td>${clazz.clasttime }</td>
                  <td>${clazz.cstatus }</td>
                  <td>
				      <button type="button" onclick="updateClazz(${clazz.cid})" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
					  <button type="button" onclick="deleteClazz(${clazz.cid})" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
				  </td>
                </tr>
                </c:forEach>
              </tbody>
			  <tfoot>
			     <tr>
				     <td colspan="10" align="center">
						<ul class="pagination">
								<li class="${pageBean.nowPage==1?'disabled':''}"><a href="javascript:goPage(${pageBean.nowPage==1?1:pageBean.nowPage-1})">上一页</a></li>
								<c:forEach begin="1" end="${pageBean.countPage}" var="num">
									<c:if test="${pageBean.nowPage==num}">
										<li class="active"><a href="#">${num}<span class="sr-only">(current)</span></a></li>
									</c:if>
									<c:if test="${pageBean.nowPage!=num}">
										<li><a href="javascript:goPage(${num})">${num}<span class="sr-only">(current)</span></a></li>
									</c:if>
								</c:forEach>
								<li class="${pageBean.nowPage==pageBean.countPage?'disabled':''}"><a href="javascript:goPage(${pageBean.nowPage==pageBean.countPage?pageBean.countPage:pageBean.nowPage+1})">下一页</a></li>
						</ul>
						<input type="hidden" name="nowPage" value="1">
					 </td>
				 </tr>
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
            });
	  		  
          //换页函数,携带表单信息
            function goPage(nowPage){
	  			  form1.nowPage.value=nowPage;
	  			  form1.submit();
	  		  }
          
           //单个删除
           function deleteClazz(cid){
        	   layer.confirm("是否删除班级?",  {icon: 3, title:'提示'}, function(cindex){
   			    layer.close(cindex);
   			    $.ajax({
   			    	url:"${APPPATH}/clazz/delete",
   			    	type:"post",
   			    	data:{"cid":cid},
   			    	success:function(result){
   			    		if(result.flag){
   			    			layer.msg("删除成功!", {time:1000, icon:6, shift:6}, function(){});
   			    			window.location.href="${APPPATH}/clazz/index";
   			    		}else{
   			    			layer.msg("删除失败!", {time:1000, icon:5, shift:5}, function(){});
   			    		}
   			    	}
   			    });
   			    
   			}, function(cindex){
   			    layer.close(cindex);
   			});
            };
            
            //修改
           function updateClazz(cid){
                window.location.href = "${APPPATH}/clazz/update?cid="+cid;
            };
            
        </script>
  </body>
</html>