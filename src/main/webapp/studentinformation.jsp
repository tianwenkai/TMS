<%--
  Created by IntelliJ IDEA.
  User: 喵
  Date: 2020/3/11
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="l" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<title>个人信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${APPPATH }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APPPATH }/css/font-awesome.min.css">
<link rel="stylesheet" href="${APPPATH }/css/main.css">
<link rel="stylesheet" href="${APPPATH }/css/doc.min.css">
<style type="text/css">
    .div1 {
        float: left;
        height: 600px;
        width: 1000px;

    }

    .div2 {
        float: left;
        height: 600px;
        width: 500px;
        background-image: url("../img/bj3.jpg");
        background-size: 100% 100%;
    }

    .div3 {
        float: right;
        height: 600px;
        width: 500px;
    }

    .tree li {
        list-style-type: none;
        cursor: pointer;
    }
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">个人信息中心</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle"
                                data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${loginUser.uname } <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                            <li class="divider"></li>
                            <li><a href="${APPPATH }/looginout"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
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
                <div class="tree">
                    <ul style="padding-left:0px;" class="list-group">
                    
                     			<li class="list-group-item tree-closed" >
						           <a href="${APPPATH}/main"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a> 
					            </li>
                        <li class="list-group-item tree-closed">
                            <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 个人信息中心 <span class="badge" style="float:right">3</span></span>
                            <ul style="margin-top:10px;display:none;">
                                
                                <li style="height:30px;">
                                    <a href="${APPPATH }/student/information"><i class="glyphicon glyphicon-user"></i> 个人信息列表</a>
                                </li>
                                <li style="height:30px;">
                                    <a href="${APPPATH }/student/updateByOne?sid=${param.sid}"><i class="glyphicon glyphicon-king"></i> 个人信息修改</a>
                                </li>
                                <li style="height:30px;">
                                    <a href="${APPPATH }/student/usernamepassword"><i class="glyphicon glyphicon-lock"></i>账号密码修改</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="div1">
                        <div class="div2">

                        </div>
                        <div class="div3">
                            <table>
                                <caption>个人信息</caption>
                                <tr>
                                    <td>
                                        <div>
                                            <h5>姓名：${student.sname}</h5>
                                        </div>
                                        <div>
                                            <h5>性别：${student.ssex}</h5>
                                        </div>
                                        <div>
                                            <h5>年龄：${student.sage}</h5>
                                        </div>
                                        <div>
                                            <h5>电话：${student.sphone}</h5>
                                        </div>
                                        <div>
                                            <h5>邮箱：${student.semail}</h5>
                                        </div>
                                        <div>
                                            <h5>生日：<fmt:formatDate value="${student.sbirthday}" type="date" pattern="yyyy-MM-dd"></fmt:formatDate></h5>
                                        </div>
                                        <div>
                                            <h5>籍贯：${student.sbirthplace}</h5>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
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
        $(".list-group-item").click(function () {
            if ($(this).find("ul")) {
                $(this).toggleClass("tree-closed");
                if ($(this).hasClass("tree-closed")) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });

    });
</script>
</body>
</html>