<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录页面</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<!-- 引入jQuery核心js文件 -->
<script src="js/jquery-2.1.0.js"></script>
<!-- 引入BootStrap核心js文件 -->
<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<div id="container">

		<form class="form-horizontal" role="form"
			action="${pageContext.request.contextPath }/loginServlet">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="" name="username"
						placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
				<div class="col-sm-10">
					<input type="password" name="password" class="form-control"
						id="lastname" placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox" name="autoLogin">自动登录
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">登录</button>
				</div>
			</div>
		</form>

	</div>
</body>

</html>