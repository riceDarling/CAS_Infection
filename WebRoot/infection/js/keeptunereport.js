$(function() {
	selectById();
	$(".task_publish_bon").click(function() {
		$(".task_publish_file").click();
	});
	$("#keeptunereport_from_addbtn").click(function() {
		if(AllisNes()){
			var data=$("#keeptunereport_from").serialize()+"&cardId=" + GetRequest();
			$.ajax({
				url : config.url + "report/update",
				data : data,
				type : "post",
				timeout : 10000,
				success : function(data) {
					console.log(data);
					alert(data.msg);
					location.href = "report.jsp";
				}
			});
		}
		
	});

});

var pic_num = 0;
function ajaxFileUpload() {
	$.ajaxFileUpload({
		url : '/Infection/upload/file',
		secureuri : false,
		fileElementId : 'uploadImage1',
		dataType : 'json',
		data : {},
		success : function(data, status) {
			if (data.error != null) {
				alert(data.error);
				return;
			} else {
				pic_num = pic_num + 1;
				$("<img src='http://" + data.t + "' class= '" + data.t + "' title = '" + data.t + "' " + "class='" + data.t + "' style='border: 1px solid #DDD9D0;cursor:pointer;margin-right:5px;width:16%;'>").appendTo($('.vip_img')).click(function() {
					var title = this.title;
					var class_name = this.className;
					var self = $(this);
					self.remove(); // 移除页面中的图片
					$("input[name='keeptuneimg']").val($("input[name='keeptuneimg']").val().replace(class_name + ",", ""));
					pic_num = pic_num - 1;

				});
				$("input[name='keeptuneimg']").val($("input[name='keeptuneimg']").val() + data.t + ",");
			}
		},
		error : function(data, status, e) {
			alert(e);
		}
	})
};

function GetRequest() {
	var url = location.search;
	if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		return str;
	}
};
function selectById() {
	var cardId = GetRequest();
	$.ajax({
		type : 'POST',
		url : "/Infection/report/selectById",
		dataType : 'json',
		async : true,
		data : {
			cardId : cardId
		},
		success : function(data) {
			if (data.success) {
				console.log(data.msg);
				if (data.t.level == 1) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("幼儿园(民办)");
				} else if (data.t.level == 2) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("幼儿园(国办)");
				} else if (data.t.level == 3) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("小学");
				} else if (data.t.level == 4) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("中学");
				} else if (data.t.level == 5) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("民办学校");
				} else if (data.t.level == 6) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("职业学校");
				} else if (data.t.level == 7) {
					$(".edittable tbody tr:eq(0) td:eq(1)").text("街道文教科");
				}
				;
				if (data.t.schoolName == null) {
					$(".edittable tbody tr:eq(1) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(1) td:eq(1)").text(data.t.schoolName);
				}
				;
				if (data.t.classes == null) {
					$(".edittable tbody tr:eq(2) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(2) td:eq(1)").text(data.t.classes);
				}
				;

				if (data.t.patientName == null) {
					$(".edittable tbody tr:eq(3) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(3) td:eq(1)").text(data.t.patientName);
				}
				;

				if (data.t.parentName == null) {
					$(".edittable tbody tr:eq(4) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(4) td:eq(1)").text(data.t.parentName);
				}
				;
				if (data.t.idNumber == null) {
					$(".edittable tbody tr:eq(5) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(5) td:eq(1)").text(data.t.idNumber);
				}
				;
				if (data.t.sex == null) {
					$(".edittable tbody tr:eq(6) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(6) td:eq(1)").text(data.t.sex);
				}
				;

				if (data.t.birthDay == null) {
					$(".edittable tbody tr:eq(7) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(7) td:eq(1)").text(data.t.birthDay);
				}
				;
				if (data.t.age == null) {
					$(".edittable tbody tr:eq(8) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(8) td:eq(1)").text(data.t.age);
				}
				;

				if (data.t.telephone == null) {
					$(".edittable tbody tr:eq(9) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(9) td:eq(1)").text(data.t.telephone);
				}
				;
				switch (data.t.area) {
				case 0:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("本县区");
					break;
				case 1:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("本市其他县区");
					break;
				case 2:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("本省其他城市");
					break;
				case 3:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("其他省");
					break;
				case 4:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("港澳台");
					break;
				case 5:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("外籍");
					break;
				default:
					$(".edittable tbody tr:eq(10) td:eq(1)").text("");
					break;
				}
				;
				if (data.t.address == null) {
					$(".edittable tbody tr:eq(11) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(11) td:eq(1)").text(data.t.address);
				}
				;
				if (data.t.typeName == null) {
					$(".edittable tbody tr:eq(12) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(12) td:eq(1)").text(data.t.typeName);
				}
				;
				if (data.t.infectionName == null) {
					$(".edittable tbody tr:eq(13) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(13) td:eq(1)").text(data.t.infectionName);
				}
				;

				if (data.t.onsetTime == null) {
					$(".edittable tbody tr:eq(14) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(14) td:eq(1)").text(data.t.onsetTime);
				}
				;

				if (data.t.diagnosisTime == null) {
					$(".edittable tbody tr:eq(15) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(15) td:eq(1)").text(data.t.diagnosisTime);
				}
				;

				if (data.t.deathTime == null) {
					$(".edittable tbody tr:eq(16) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(16) td:eq(1)").text(data.t.deathTime);
				}
				;

				if (data.t.reporter == null) {
					$(".edittable tbody tr:eq(17) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(17) td:eq(1)").text(data.t.reporter);
				}
				;

				if (data.t.fillTime == null) {
					$(".edittable tbody tr:eq(18) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(18) td:eq(1)").text(data.t.fillTime);
				}
				;

				if (data.t.isInfection == 1) {
					$(".edittable tbody tr:eq(19) td:eq(1)").text("有");
				} else {
					$(".edittable tbody tr:eq(19) td:eq(1)").text("无");
				}
				;

				if (data.t.diagnosisImg == null) {
					$(".edittable tbody tr:eq(20) td:eq(1)").text("");
				} else {
					// 定义一数组
					var strs = new Array();
					// 字符分割
					strs = data.t.diagnosisImg.split(",");
					var html = "";
					for (i in strs) {
						html += "<img src='http://" + strs[i] + "' style='width:100px'/>&nbsp;&nbsp;";
					}
					$(".edittable tbody tr:eq(20) td:eq(1)").append(html);
				}
				;

				if (data.t.note == null) {
					$(".edittable tbody tr:eq(21) td:eq(1)").text("");
				} else {
					$(".edittable tbody tr:eq(21) td:eq(1)").text(data.t.note);
				}
				;
				
				
				if (data.t.keeptuneimg == null) {
					//$(".edittable tbody tr:eq(21) td:eq(1)").text("");
				} else {
					// $(".edittable tbody tr:eq(21) td:eq(1)
					// input[name='diagnosisImg']").attr("value",data.t.diagnosisImg);
					$("input[name='keeptuneimg']").val(data.t.keeptuneimg);
					// 定义一数组
					var strs = new Array();
					// 字符分割
					strs = data.t.keeptuneimg.split(",");
					var html = "";
					for (var i=0;i<(strs.length-1);i++) {
						html += "<img src='http://" + strs[i] + "' class= 'btn " + strs[i] + "' title = '" + strs[i] + "' " + "class='" + strs[i] + "' style='border: 1px solid #DDD9D0;cursor:pointer;margin-right:5px;width:16%;'>";
					}
					$(".edittable tbody tr:eq(22) td:eq(1)").append(html);
				}
				;

				$(".btn").click(function() {
					var title = this.title;
					var class_name = this.className;
					var self = $(this);
					self.remove();
					// console.log(title);
					// console.log(class_name);
					// console.log($("input[name='diagnosisImg']").val());
					$("input[name='keeptuneimg']").val($("input[name='keeptuneimg']").val().replace(title + ",", ""));
					pic_num = pic_num - 1;
				});
				

			}

		}

	});
};