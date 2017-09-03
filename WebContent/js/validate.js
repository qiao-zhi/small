$(function() {
	$("#addform").validate({
		rules : {
			name : {
				required : true
			},
			xinghao : {
				required : true
			},
			address : {
				required : true
			},
			department : {
				required : true
			},
			unit : {
				required : true
			},
			number : {
				required : true,
				number : true
			},
			price : {
				required : true,
				number : true
			},
			totalprice : {
				required : true,
				number : true
			},
			come : {
				required : true,
			},
			buytime : {
				required : true,
			},
			useperson : {
				required : true,
			},
			handleperson : {
				required : true,
			},
			admini : {
				required : true,
			}

		},
		messages : {
			name : {
				required : "名称不能为空"
			},
			xinghao : {
				required : "型号不能为空"
			},
			address : {
				required : "地址不能为空"
			},
			department : {
				required : "部门不能为空"
			},
			unit : {
				required : "单位不能为空"
			},
			number : {
				required : "数量不能为空",
				number : "必须为数字"
			},
			price : {
				required : "单价不能为空",
				number : "必须为数字"
			},
			totalprice : {
				required : "总价不能为空",
				number : "必须为数字"
			},
			come : {
				required : "来源不能为空"
			},
			buytime : {
				required : "构建日期不能为空"
			},
			useperson : {
				required : "使用人不能为空"
			},
			handleperson : {
				required : "处理人不能为空"
			},
			admini : {
				required : "管理员不能为空"
			}
		},
		errorElement : "label", // 用来创建错误提示信息标签
		success : function(label) { // 验证成功后的执行的回调函数
			// label指向上面那个错误提示信息标签label
			label.text("正确") // 清空错误提示消息
			.addClass("success"); // 加上自定义的success类
		}

	});
})