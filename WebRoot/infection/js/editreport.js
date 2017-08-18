
var oData= new Date();
var year = oData .getFullYear(); //获取完整的年份(4位,1970-????)
var month = oData.getMonth()+1; //获取当前月份(0-11,0代表1月)
var data = oData.getDate(); //获取当前日(1-31)
var day = oData.getDay(); //获取当前星期X(0-6,0代表星期天)
var h = oData.getHours(); //获取当前小时数(0-23)
var m = oData.getMinutes(); //获取当前分钟数(0-59)
var s = oData.getSeconds(); //获取当前秒数(0-59)
var data_zyl = year+"-" +month+"-" + data+ " "+ h+":"+ m +":" + s;
$(function() {
	selectById();

	selectAllType();
	$("#editreport_infectiontype").change(function() {
		getAllByTypeId();
	});
	$("#editreport_schooltype").change(function() {
		getAllSchoolByLevel();
	});
	$("#editreport_from_addbtn").click(function() {
		if(AllisNes()){
			update($("#editreport_from").serialize());
		};
	});
	$(".task_publish_bon").click(function() {
		$(".task_publish_file").click();
	});
	var time_plugin = "";
	$(".time_plugin_lv_onclick").click(function(){
		time_plugin = $(this);
	});
	$(document).on("click",".time_plugin_lv_click",function(){
		if($(time_plugin).attr("id")=="editreport_birthDay"){
			setTimeout(function(){
				//alert($(".time_plugin_lv_onclick").val());
				//alert(jsGetAge($(".time_plugin_lv_onclick").val()));
				var age=jsGetAge($(".time_plugin_lv_onclick").val());
				$("#editreport_age").val(age);
			},500);
		}
		
	});

});
function update(data) {
	data += "&cardId=" + GetRequest()+"&revisedTime="+data_zyl;
	//console.log(data);
	$.ajax({
		url : config.url + "report/update",
		data : data,
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			alert(data.msg);
			location.href="report.jsp";
		}
	});
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
			$("#editreport_schooltype option").each(function() {
				if ($(this).val() == data.t.level) {
					$(this).attr("selected", "selected");
				} else {
					$(this).removeAttr("selected");
				}
			});
			getAllSchoolByLevel();
			$("#editreport_school option").each(function() {
				if ($(this).val() == data.t.schoolId) {
					$(this).attr("selected", "selected");
				} else {
					$(this).removeAttr("selected");
				}
			});

			$("#editreport_infectiontype option").each(function() {
				if ($(this).val() == data.t.typeId) {
					$(this).attr("selected", "selected");
				} else {
					$(this).removeAttr("selected");
				}
			});
			getAllByTypeId();
			
			/*$("#editreport_infectionname option").each(function() {
				if ($(this).val() == data.t.infectionId) {
					$(this).attr("selected", "selected");
				} else {
					$(this).removeAttr("selected");
				}
			});*/
			
			$("#editreport_infectionname input").each(function() {
				if ($(this).val() == data.t.infectionId) {
					$(this).prop("checked", true);
				} else {
					//$(this).removeAttr("selected");
				}
			});

			$("#editreport_type option").each(function() {
				if ($(this).val() == data.t.type) {
					$(this).attr("selected", "selected");
				} else {
					$(this).removeAttr("selected");
				}
			});

			if (data.t.sex == 0) {
				$(".edittable tbody tr:eq(6) td:eq(1) input:radio:eq(0)").prop("checked", true);
			} else {
				$(".edittable tbody tr:eq(6) td:eq(1) input:radio:eq(1)").prop("checked", true);
			}
			;

			switch (data.t.area) {
			case 0:
				$(".edittable tbody tr:eq(10) td:eq(1) input:radio:eq(0)").prop("checked", true);
				break;
			case 1:
				$(".edittable tbody tr:eq(10) td:eq(1) input:radio:eq(1)").prop("checked", true);
				break;
			case 2:
				$(".edittable tbody tr:eq(10) td:eq(1) input:radio:eq(2)").prop("checked", true);
				break;
			case 3:
				$(".edittable tbody tr:eq(10) td:eq(1) input:radio:eq(3)").prop("checked", true);
				break;
			case 4:
				$(".edittable tbody tr:eq(10) td:eq(1) input:radio:eq(4)").prop("checked", true);
				break;
			case 5:
				$(".edittable tbody tr:eq(10) td:eq(1) input:radio:eq(5)").prop("checked", true);
				break;
			default:
				break;

			}
			;

			/*
			if (data.t.isInfection == 0) {
				$(".edittable tbody tr:eq(20) td:eq(1) input:radio:eq(0)").prop("checked", true);
			} else {
				$(".edittable tbody tr:eq(20) td:eq(1) input:radio:eq(1)").prop("checked", true);
			}
			;*/

			if (data.t.isInfectionnum == null) {
				$(".edittable tbody tr:eq(20) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(20) td:eq(1) input").val(data.t.isInfectionnum);
			}
			
			if (data.t.classes == null) {
				$(".edittable tbody tr:eq(2) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(2) td:eq(1) input").val(data.t.classes);
			}
			;

			if (data.t.patientName == null) {
				$(".edittable tbody tr:eq(3) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(3) td:eq(1) input").val(data.t.patientName);
			}
			;

			if (data.t.parentName == null) {
				$(".edittable tbody tr:eq(4) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(4) td:eq(1) input").val(data.t.parentName);
			}
			;
			if (data.t.idNumber == null) {
				$(".edittable tbody tr:eq(5) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(5) td:eq(1) input").val(data.t.idNumber);
			}
			;
			if (data.t.birthDay == null) {
				$(".edittable tbody tr:eq(7) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(7) td:eq(1) input").val(data.t.birthDay);
			}
			;
			if (data.t.age == null) {
				$(".edittable tbody tr:eq(8) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(8) td:eq(1) input").val(data.t.age);
			}
			;
			if (data.t.telephone == null) {
				$(".edittable tbody tr:eq(9) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(9) td:eq(1) input").val(data.t.telephone);
			}
			;
			if (data.t.address == null) {
				$(".edittable tbody tr:eq(11) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(11) td:eq(1) input").val(data.t.address);
			}
			;

			if (data.t.onsetTime == null) {
				$(".edittable tbody tr:eq(15) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(15) td:eq(1) input").val(data.t.onsetTime);
			}
			;

			if (data.t.diagnosisTime == null) {
				$(".edittable tbody tr:eq(16) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(16) td:eq(1) input").val(data.t.diagnosisTime);
			}
			;

			if (data.t.deathTime == null) {
				$(".edittable tbody tr:eq(17) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(17) td:eq(1) input").val(data.t.deathTime);
			}
			;

			if (data.t.reporter == null) {
				$(".edittable tbody tr:eq(18) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(18) td:eq(1) input").val(data.t.reporter);
			}
			;

			if (data.t.fillTime == null) {
				$(".edittable tbody tr:eq(19) td:eq(1) input").val("");
			} else {
				$(".edittable tbody tr:eq(19) td:eq(1) input").val(data.t.fillTime);
			}
			;

			if (data.t.diagnosisImg == null) {
				//$(".edittable tbody tr:eq(21) td:eq(1)").text("");
			} else {
				// $(".edittable tbody tr:eq(21) td:eq(1)
				// input[name='diagnosisImg']").attr("value",data.t.diagnosisImg);
				$("input[name='diagnosisImg']").val(data.t.diagnosisImg);
				// 定义一数组
				var strs = new Array();
				// 字符分割
				strs = data.t.diagnosisImg.split(",");
				var html = "";
				for (var i=0;i<(strs.length-1);i++) {
					html += "<img src='http://" + strs[i] + "' class= 'btn " + strs[i] + "' title = '" + strs[i] + "' " + "class='" + strs[i] + "' style='border: 1px solid #DDD9D0;cursor:pointer;margin-right:5px;width:16%;'>";
				}
				$(".edittable tbody tr:eq(21) td:eq(1)").append(html);
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
				$("input[name='diagnosisImg']").val($("input[name='diagnosisImg']").val().replace(title + ",", ""));
				pic_num = pic_num - 1;
			});

			if (data.t.note == null) {
				$(".edittable tbody tr:eq(22) td:eq(1) textarea").val("");
			} else {
				$(".edittable tbody tr:eq(22) td:eq(1) textarea").val(data.t.note);
			}
			;
		}

	});
};

// 根据学校级别获取学校列表
function getAllSchoolByLevel() {
	data_json = {
		"levelId" : $("#editreport_schooltype option:selected").val(),
	}
	$.ajax({
		url : config.url + "school/getAllSchoolByLevel",
		data : data_json,
		dataType : "json",
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			var html = "";
			html += "<option value=''>请选择</option>";
			if (data.success) {
				for (i in data.obj) {
					html += "<option value='" + data.obj[i].schoolId + "'>" + data.obj[i].schoolName + "</option>";
				}
			}
			$("#editreport_school").html(html);

		}
	})
};
// 获取全部疾病种类
function selectAllType() {
	$.ajax({
		url : config.url + "type/selectAllType",
		dataType : "json",
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			var html = "";
			html += "<option value=''>请选择</option>";
			if (data.success) {
				for (i in data.t) {
					html += "<option value='" + data.t[i].typeId + "'>" + data.t[i].typeName + "</option>";
				}
			}
			$("#editreport_infectiontype").html(html);

		}
	})
};
// 根据疾病种类获取疾病列表
function getAllByTypeId() {
	data_json = {
		"typeId" : $("#editreport_infectiontype option:selected").val(),
	}
	$.ajax({
		url : config.url + "infection/getAllByTypeId",
		data : data_json,
		dataType : "json",
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			var html = "";
			if (data.success) {
				for (i in data.obj) {
					html+='<input type="radio" name="infectionId" id="" value="'+data.obj[i].infectionId+'" /><label for="">'+ data.obj[i].infectionName+'</label>';
				}
			}
			$("#editreport_infectionname").html(html);

		}
	})
};
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
					$("input[name='diagnosisImg']").val($("input[name='diagnosisImg']").val().replace(class_name + ",", ""));
					pic_num = pic_num - 1;

				});
				$("input[name='diagnosisImg']").val($("input[name='diagnosisImg']").val() + data.t + ",");
			}
		},
		error : function(data, status, e) {
			alert(e);
		}
	})
};