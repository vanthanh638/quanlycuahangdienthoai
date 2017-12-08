$(document).ready(function() {
	/*$("#frmMobile").validate({
		rules:{
			"tensanpham":{
				required: true,
			},
			"gia":{
				required: true,
			},
		},
		messages:{
			"tensanpham":{
				required: "<span style=\"color:red\" >  Tên không được để trống..! </span>",
			},
			"gia":{
				required: "<span style=\"color:red\" >  Giá không được để trống..! </span>",
			},
		},
	});*/
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
			"tendaydu":{
				required: true,
			},
			"sodienthoai":{
				required: true,
			},
		},
		messages:{
			"tendaydu":{
				required: "<span style=\"color:red\" >  Nhập họ tên </span>",
			},
			"sodienthoai":{
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
			"tendangnhap":{
				required: true,
			},
			"matkhau":{
				required: true,
			},
			"re_password":{
				required: true,
				equalTo: "#password",
			},
			"tendaydu":{
				required: true,
			},
		},
		messages:{
			"tendangnhap":{
				required: "<span style=\"color:red\" >  Nhập username </span>",
			},
			"matkhau":{
				required: "<span style=\"color:red\" >  Nhập password </span>",
			},
			"re_password":{
				required: "<span style=\"color:red\" >  Nhập password </span>",
				equalTo: "<span style=\"color:red\" >  password phải trùng với password ở trên </span>",
			},
			"tendaydu":{
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

function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}