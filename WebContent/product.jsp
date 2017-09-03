<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="baseurl" value="${pageContext.request.contextPath}/"></c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN">
<c:set var="baseurl" value="${pageContext.request.contextPath}"></c:set>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>主要界面</title>
<link href="${baseurl }/css/bootstrap.css" rel="stylesheet">
<link href="${baseurl }/css/jquery-ui.css" rel="stylesheet">
<link href="${baseurl }/css/jquery_ui.style.css" rel="stylesheet">
<!-- 引入自己写的CSS -->
<link href="${baseurl }/css/product.css" rel="stylesheet">
<style type="text/css">
/*validate中不成功显示的样式设置*/
label.error {
	background: url(${baseurl }/img/unchecked.gif) no-repeat 10px 3px;
	padding-left: 30px;
	font-family: georgia;
	font-size: 15px;
	font-style: normal;
	color: red;
}

label.success {
	background: url(${baseurl }/img/checked.gif) no-repeat 10px 3px;
	color: blue;
	padding-left: 30px;
}
</style>
<!-- 引入jQuery核心js文件 -->
<script src="js/jquery-2.1.0.js"></script>
<!-- <script src="js/jquery.js"></script> -->
<!-- 引入BootStrap核心js文件 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/product.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-ui.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validate.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/messages_zh.js" type="text/javascript" charset="utf-8"></script>
<script src="js/validate.js" type="text/javascript" charset="utf-8"></script>


<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script src="js/easyui-lang-zh_CN.js" type="text/javascript"
	charset="utf-8"></script>

</head>

<body>
	<div id="container">
		<!--放头-->
		<div id="top">

			<h4>&nbsp;&nbsp;&nbsp;固定资产登记</h4>
			<div class="pull-right">
				<span>欢迎您</span> <i class="glyphicon glyphicon-user"></i>
				<lable class="username">root</lable>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"
					onclick="logout()">退出系统</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<!--清除浮动-->
			<div class="clearfix"></div>
		</div>

		<!-- 横线 -->
		<hr />

		<!-- 查询条件以及表格 -->
		<div id="bottom">

			<!-- 查询条件 -->
			<form class="bs-example bs-example-form" role="form" id="queryForm"
				action="${baseurl }/fenYe" method="post">
				<div class="input-group  fudong">
					<span class="input-group-addon">名称</span> <input type="text"
						class="form-control" placeholder="请输入名称进行查询" name="queryName"
						value="${queryName}">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="input-group fudong">
					<span class="input-group-addon">存放地点</span> <input type="text"
						class="form-control" placeholder="请输入地点进行查询" name="queryAddress"
						value="${queryAddress}">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="input-group fudong">
					<span class="input-group-addon ">购建日期</span> <select
						class="form-control" name="queryDate">
						<option>请选择期限</option>
						<option value="1" <c:if test="${'1' eq queryDate}">selected</c:if>>最近三个月</option>
						<option value="2" <c:if test="${'2' eq queryDate}">selected</c:if>>最近6个月</option>
						<option value="3" <c:if test="${'3' eq queryDate}">selected</c:if>>最近一年</option>
					</select>
				</div>
				<div class="clearfix"></div>
				<br />
				<p type="button" class="btn btn-default btn-lg" data-toggle="modal"
					data-target="#add">
					<span class="glyphicon glyphicon-plus"></span>添加记录
				</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a type="button" class="btn btn-default btn-lg" id="queryCondition"><span
					class="glyphicon glyphicon-search"></span>查询</a>
			</form>
			<hr />
			<br />

			<!-- 表格数据 -->
			<table class="table table-striped table-bordered">
				<thead>
					<tr style="background-color: #EEEEEE">
						<th>名称</th>
						<th>规格及型号</th>
						<th>存放地点</th>
						<th>来源</th>
						<th>购建日期</th>
						<th>使用人</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.productList}" var="register">
						<tr>
							<th>${register.name}</th>
							<th>${register.xinghao}</th>
							<th>${register.address}</th>
							<th>${register.come}</th>
							<th>${register.buytime}</th>
							<th>${register.useperson}</th>
							<th><a class="" href="javascript:void(0)"
								onclick="query2(${register.id})" title="编辑"> <span
									class="glyphicon glyphicon-pencil"></span>
							</a> <a class="" href="javascript:void(0)"
								onclick="deleteById(${register.id})" title="删除"> <span
									class="glyphicon glyphicon-trash"></span> <!-- 查询单个 -->
							</a> <a class="queryA" href="javascript:void(0)"
								onclick="query(${register.id})" title="查看详细信息"> <span
									class="glyphicon glyphicon-search"></span>
							</a></th>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 如果pageBean的总数大于8显示分页 -->
		<c:if test="${pageBean.totalCount > 8}">
			<div id="paginationID"
				style="background: #efefef; border: 1px solid #ccc; width: 100%"></div>
		</c:if>


		<!-- 		<div id="footer">
			<font>Copyright ©2017 Small</font>
		</div> -->
		<%-- 
		<!--分页 -->
		<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
			<ul class="pagination" style="text-align: center; margin-top: 10px;">
				<!-- 上一页 -->
				<!-- 判断当前页是否是第一页 -->
				<c:if test="${pageBean.currentPage==1 }">
					<li class="disabled"><a href="javascript:void(0);"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage!=1 }">
					<li><a
						href="${pageContext.request.contextPath }/fenYe?currentPage=${pageBean.currentPage-1}&queryName=${queryName}&queryAddress=${queryAddress}&queryDate=${queryDate}&getTag=getMethod"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>




				<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
					<!-- 判断当前页 -->
					<c:if test="${pageBean.currentPage==page }">
						<li class="active"><a href="javascript:void(0);">${page}</a></li>
					</c:if>
					<c:if test="${pageBean.currentPage!=page }">
						<li><a class="test"
							href="${pageContext.request.contextPath }/fenYe?currentPage=${page}&queryName=${queryName}&queryAddress=${queryAddress}&queryDate=${queryDate}&getTag=getMethod">${page}</a></li>
					</c:if>

				</c:forEach>

				<!-- 判断当前页是否是最后一页 -->
				<c:if test="${pageBean.currentPage==pageBean.totalPage }">
					<li class="disabled"><a href="javascript:void(0);"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
					<li><a class="test"
						href="${pageContext.request.contextPath }/fenYe?currentPage=${pageBean.currentPage+1}&queryName=${queryName}&queryAddress=${queryAddress}&queryDate=${queryDate}&getTag=getMethod"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>

			</ul>
		</div>
		<!-- 分页结束 --> --%>






		<!-- 增加模态框（Modal） -->
		<div>
			<div class="modal fade" id="add" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">增加记录</h4>
						</div>
						<form id="addform"
							action="${pageContext.request.contextPath }/productServlet?type=add"
							method="post">
							<div class="modal-body">
								<div class="input-group">
									<span class="input-group-addon">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</span>
									<input type="text" class="form-control" name="name" id="name"
										placeholder="请输入名称">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">规格及型号</span> <input type="text"
										name="xinghao" id="xinghao" class="form-control"
										placeholder="请输入规格及型号">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">存&nbsp;放&nbsp;地&nbsp;点</span> <input
										type="text" class="form-control" placeholder="请输入存放地点名称"
										name="address" id="address">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">使&nbsp;用&nbsp;部&nbsp;门</span> <input
										name="department" id="department" type="text"
										class="form-control" placeholder="请输入使用部门名称">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</span>
									<input type="text" name="unit" class="form-control"
										placeholder="请输入单位名称">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</span>
									<input type="text" class="form-control" placeholder="请输入数量"
										name="number">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</span>
									<input type="text" class="form-control" placeholder="请输入单价"
										name="price">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额</span>
									<input type="text" class="form-control" placeholder="请输入金额"
										name="totalprice">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源</span>
									<input type="text" class="form-control" placeholder="请输入来源"
										name="come">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">购&nbsp;建&nbsp;日&nbsp;期</span> <input
										type="text" class="form-control datepicker"
										style="z-index: 9999; background-color: #ffffff"
										placeholder="请输入购建日期" name="buytime" readonly="readonly">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">使&nbsp;&nbsp;&nbsp;用&nbsp;&nbsp;&nbsp;人</span>
									<input type="text" class="form-control" placeholder="请输入使用人名称"
										name="useperson">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">经&nbsp;&nbsp;&nbsp;办&nbsp;&nbsp;&nbsp;人</span>
									<input type="text" class="form-control" placeholder="请输入经办人名称"
										name="handleperson">
								</div>
								<br />
								<div class="input-group">
									<span class="input-group-addon">管&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;员</span>
									<input type="text" class="form-control" placeholder="请输入管理员名称"
										name="admini">
								</div>
								<input type="hidden" name="hid"
									value="<%=request.getSession().getAttribute("add")%>">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>




			<!-- 详细信息模态框（Modal） -->
			<div>
				<div class="modal fade" id="queryInfo" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">详细信息</h4>
							</div>
							<form
								action="${pageContext.request.contextPath }/productServlet?type=info"
								method="post">
								<div class="modal-body">
									<div class="input-group">
										<span class="input-group-addon">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</span>
										<input type="text" class="form-control" placeholder="请输入名称"
											id="name1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">规格及型号</span> <input
											type="text" class="form-control" placeholder="请输入规格及型号"
											id="xinghao1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">存&nbsp;放&nbsp;地&nbsp;点</span>
										<input type="text" class="form-control"
											placeholder="请输入存放地点名称" id="address1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">使&nbsp;用&nbsp;部&nbsp;门</span>
										<input type="text" class="form-control"
											placeholder="请输入使用部门名称" id="department1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</span>
										<input type="text" class="form-control" placeholder="请输入单位名称"
											id="unit1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</span>
										<input type="text" class="form-control" placeholder="请输入数量"
											id="number1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</span>
										<input type="text" class="form-control" placeholder="请输入单价"
											id="price1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额</span>
										<input type="text" class="form-control" placeholder="请输入金额"
											id="totalprice1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源</span>
										<input type="text" class="form-control" placeholder="请输入来源"
											id="come1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">购&nbsp;建&nbsp;日&nbsp;期</span>
										<input type="text" class="form-control" placeholder="请输入购建日期"
											id="buytime1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">使&nbsp;&nbsp;&nbsp;用&nbsp;&nbsp;&nbsp;人</span>
										<input type="text" class="form-control" placeholder="请输入使用人名称"
											id="useperson1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">经&nbsp;&nbsp;&nbsp;办&nbsp;&nbsp;&nbsp;人</span>
										<input type="text" class="form-control" placeholder="请输入经办人名称"
											id="handleperson1" readonly="readonly">
									</div>
									<br />
									<div class="input-group">
										<span class="input-group-addon">管&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;员</span>
										<input type="text" class="form-control" placeholder="请输入管理员名称"
											id="admini1" readonly="readonly">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<!-- <button type="submit" class="btn btn-primary">提交</button> -->
								</div>
							</form>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

				<!-- 修改模态框（Modal） -->
				<div>
					<div class="modal fade" id="updateInfo" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">修改信息</h4>
								</div>
								<form action="${baseurl}/productServlet?type=update"
									method="post">
									<div class="modal-body">
										<!-- 隐藏一个id -->
										<input type="text" name="id2" id="id2" value=""
											hidden="hidden" />

										<div class="input-group">
											<span class="input-group-addon">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</span>
											<input type="text" class="form-control" placeholder="请输入名称"
												name="name2" id="name2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">规格及型号</span> <input
												type="text" class="form-control" placeholder="请输入规格及型号"
												name="xinghao2" id="xinghao2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">存&nbsp;放&nbsp;地&nbsp;点</span>
											<input type="text" class="form-control"
												placeholder="请输入存放地点名称" name="address2" id="address2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">使&nbsp;用&nbsp;部&nbsp;门</span>
											<input type="text" class="form-control"
												placeholder="请输入使用部门名称" id="department2" name="department2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</span>
											<input type="text" class="form-control" placeholder="请输入单位名称"
												id="unit2" name="unit2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</span>
											<input type="text" class="form-control" placeholder="请输入数量"
												id="number2" name="number2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</span>
											<input type="text" class="form-control" placeholder="请输入单价"
												name="price2" id="price2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额</span>
											<input type="text" class="form-control" placeholder="请输入金额"
												id="totalprice2" name="totalprice2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源</span>
											<input type="text" class="form-control" placeholder="请输入来源"
												id="come2" name="come2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">购&nbsp;建&nbsp;日&nbsp;期</span>
											<input type="text" class="form-control datepicker"
												style="z-index: 9999; background-color: #ffffff"
												placeholder="请输入购建日期" id="buytime2" name="buytime2"
												readonly="readonly">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">使&nbsp;&nbsp;&nbsp;用&nbsp;&nbsp;&nbsp;人</span>
											<input type="text" class="form-control"
												placeholder="请输入使用人名称" id="useperson2" name="useperson2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">经&nbsp;&nbsp;&nbsp;办&nbsp;&nbsp;&nbsp;人</span>
											<input type="text" class="form-control"
												placeholder="请输入经办人名称" id="handleperson2"
												name="handleperson2">
										</div>
										<br />
										<div class="input-group">
											<span class="input-group-addon">管&nbsp;&nbsp;&nbsp;理&nbsp;&nbsp;&nbsp;员</span>
											<input type="text" class="form-control"
												placeholder="请输入管理员名称" id="admini2" name="admini2">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
									<input type="hidden" name="hid"
										value="<%=request.getSession().getAttribute("update")%>">
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
				</div>
</body>
<script type="text/javascript">
//pagination组建名
$('#paginationID').pagination({
	//			组件属性
	"total": ${pageBean.totalCount},
	"pageSize": 8,
	"pageNumber": ${pageBean.currentPage},
	"pageList": [8],
	"layout": ['list', 'sep', 'first', 'prev', 'manual', 'next', 'last', 'links'],
	"onSelectPage": function(pageNumber, b) {
 	/* 	alert("pageNumber=" + pageNumber);
		alert("pageSize=" + b); */ 
		
		var url="${pageContext.request.contextPath }/fenYe?currentPage="+pageNumber+"&queryName=${queryName}&queryAddress=${queryAddress}&queryDate=${queryDate}&getTag=getMethod";
		url= encodeURI(url);
		window.location.href=url; 
/* 		$.ajax({
			url:"${baseurl}/fenYe",
			async:true,
			type:"POST",
			/* "queryName":"${queryName}","queryAddress":"${queryAddress}","queryDate":"${queryDate}", */
			/**date:{"currentPage":1},
			success: function(data){
                },
            error:function(){
            	alert("请求失败");
                },
            dataType:"text"
           
		}); */
		
/* 	    $.post(
	            "${baseurl}/fenYe",    //请求地址
	            //"name=qlq&password=qlq",   //请求参数
	            {"currentPage":pageNumber,"queryName":"${queryName}","queryAddress":"${queryAddress}","queryDate":"${queryDate}"},  //请求传递的参数，也可以是JSON
	            function(){     //data表示传递回来的数据，只有在成功的时候才有
	                /* window.location.reload(); */
/* 	                },
	                "json"         //表示返回内容的格式,json会将传回来的自动解析成json对象
	    ); */ 
		
	}
});
</script>

</html>