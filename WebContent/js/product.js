//查询单个
function query(id) {
	$.ajax({
		url : "/small/productServlet",
		async : true,
		type : "POST",
		data : {
			"type" : "query",
			"id" : id
		},
		// 成功后开启模态框
		success : showQuery,
		error : function() {
			alert("请求失败");
		},
		dataType : "json"
	});
}

// 查询成功后向模态框插入数据并开启模态框。data是返回的JSON对象
function showQuery(data) {
	$("#name1").val(data.name);
	$("#xinghao1").val(data.xinghao);
	$("#address1").val(data.address);
	$("#department1").val(data.department);
	$("#unit1").val(data.unit);
	$("#number1").val(data.number);
	$("#price1").val(data.price);
	$("#totalprice1").val(data.totalprice);
	$("#come1").val(data.come);
	$("#buytime1").val(data.buytime);
	$("#useperson1").val(data.useperson);
	$("#handleperson1").val(data.handleperson);
	$("#admini1").val(data.admini);
	// 显示模态框
	$('#queryInfo').modal('show');
}

// 修改
function query2(id) {
	$.ajax({
		url : "/small/productServlet",
		async : true,
		type : "POST",
		data : {
			"type" : "query",
			"id" : id
		},
		// 成功后开启模态框
		success : showQuery2,
		error : function() {
			alert("请求失败");
		},
		dataType : "json"
	});
}
// 查询成功后向模态框插入数据并开启模态框。data是返回的JSON对象
function showQuery2(data) {
	$("#id2").val(data.id);
	$("#name2").val(data.name);
	$("#xinghao2").val(data.xinghao);
	$("#address2").val(data.address);
	$("#department2").val(data.department);
	$("#unit2").val(data.unit);
	$("#number2").val(data.number);
	$("#price2").val(data.price);
	$("#totalprice2").val(data.totalprice);
	$("#come2").val(data.come);
	$("#buytime2").val(data.buytime);
	$("#useperson2").val(data.useperson);
	$("#handleperson2").val(data.handleperson);
	$("#admini2").val(data.admini);
	// 显示模态框
	$('#updateInfo').modal('show');
}

// 删除一条记录
function deleteById(id) {
	var re = confirm("确认删除？");
	if (re == true) {
		// 调用删除方法
		deleteInfo(id);
	} else {
	}
}
// ajax异步删除后刷新页面
function deleteInfo(id) {
	$.ajax({
		url : "/small/productServlet",
		async : true,
		type : "POST",
		data : {
			"type" : "delete",
			"id" : id
		},
		success : function(data) {
			alert(data);
			// 删除成功后刷新页面
			window.location.reload();
		},
		error : function() {
			alert("请求失败");
		},
		dataType : "text"
	});
}

function logout() {
	var queren = confirm("确定要退出系统吗？");
	if (queren == "1") {
		self.location = "/small/logoutServlet";
	} else {

	}
}

// jQuery函数
$(function() {

	/* 日期控件* */
	$(".datepicker").datepicker(
			{
				// changeMonth : true,
				// changeYear : true,
				// showButtonPanel : true,
				monthNamesShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月",
						"八月", "九月", "十月", "十月", "十二月" ],
				dateFormat : "yy-mm-dd", // 设置日期格式
				dayNamesMin : [ "一", "二", "三", "四", "五", "六", "日" ],
				maxDate : "+0M +0d", // 最大日期可设为五个月五天之后
			});

	// 分页组合条件查询(动态提交表单)
	$("#queryCondition").click(function() {
		$("#queryForm").submit();
	});

	$(".test").each(function() {
		var h = $(this).attr("href");
		$(this).attr({
			href : encodeURI(h)
		});
	});

});
