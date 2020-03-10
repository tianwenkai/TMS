<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APPPATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APPPATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APPPATH}/css/login.css">
	<style>

	</style>
  </head>
  <body>
  	
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">平台</a></div>
        </div>
      </div>
    </nav>

    <div class="container">
   <form class="form-signin">
        <a class="btn btn-lg btn-success btn-block" href="${APPPATH}/studentlogin.jsp" > 学员登录</a>
          <a class="btn btn-lg btn-success btn-block" href="${APPPATH}/emplogin.jsp" > 员工登录</a>
          </form>
    </div>
    <script src="${APPPATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APPPATH}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APPPATH}/layer/layer.js"></script>
  </body>
</html>