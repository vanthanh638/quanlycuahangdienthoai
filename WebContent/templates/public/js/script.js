$(document).ready(function() {
	$("#frmMobile").validate({
		rules:{
			"name_mobile":{
				required: true,
			},
			"gia":{
				required: true,
			},
		},
		messages:{
			"name_mobile":{
				required: "<span style=\"color:red\" >  Tên không được để trống..! </span>",
			},
			"gia":{
				required: "<span style=\"color:red\" >  Giá không được để trống..! </span>",
			},
		},
	});
	$("#frmProducer").validate({
		rules:{
			"name_pro":{
				required: true,
			},
		},
		messages:{
			"name_pro":{
				required: "<span style=\"color:red\" >  Nhập tên hãng sản xuất </span>",
			},
		},
	});
	$("#contact-form").validate({
		rules:{
			"name":{
				required: true,
			},
			"phone":{
				required: true,
			},
		},
		messages:{
			"name":{
				required: "<span style=\"color:red\" >  Nhập họ tên </span>",
			},
			"phone":{
				required: "<span style=\"color:red\" >  Nhập số điện thoại </span>",
			},
		},
	});
	$("#frmLogin").validate({
		rules:{
			"username":{
				required: true,
			},
			"password":{
				required: true,
			},
		},
		messages:{
			"username":{
				required: "<span style=\"color:red\" >  Nhập username </span>",
			},
			"password":{
				required: "<span style=\"color:red\" >  Nhập mật khẩu </span>",
			},
		}
	});
	$("#frm-add-account").validate({
		rules:{
			"username":{
				required: true,
			},
			"password":{
				required: true,
			},
			"re_password":{
				required: true,
				equalTo: "#password",
			},
			"fullname":{
				required: true,
			},
		},
		messages:{
			"username":{
				required: "<span style=\"color:red\" >  Nhập username </span>",
			},
			"password":{
				required: "<span style=\"color:red\" >  Nhập password </span>",
			},
			"re_password":{
				required: "<span style=\"color:red\" >  Nhập password </span>",
				equalTo: "<span style=\"color:red\" >  password phải trùng với password ở trên </span>",
			},
			"fullname":{
				required: "<span style=\"color:red\" >  Nhập họ tên </span>",
			},
		}
	});
	$("#frmInfor").validate({
		rules:{
			"fullname":{
				required: true,
			},
			"address":{
				required: true,
			},
			"phone":{
				required: true,
			},
		},
		messages:{
			"fullname":{
				required: "<span style=\"color:red\" >  Nhập họ tên </span>",
			},
			"address":{
				required: "<span style=\"color:red\" >  Nhập địa chỉ </span>",
			},
			"phone":{
				required: "<span style=\"color:red\" >  Nhập số điện thoại </span>",
			},
		}
	});
	$("#frmAbout").validate({
		rules:{
			"title":{
				required: true,
			},
		},
		messages:{
			"title":{
				required: "<span style=\"color:red\" >  Nhập tiêu đề </span>",
			},
		}
	});
	
});