
// 根据学校级别获取学校列表
function getAllSchoolByLevel() {
	data_json = {
		"levelId" : $("#addreport_schooltype option:selected").val(),
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
			$("#addreport_school").html(html);

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
			$("#addreport_infectiontype").html(html);

		}
	})
};
// 根据疾病种类获取疾病列表
function getAllByTypeId() {
	data_json = {
		"typeId" : $("#addreport_infectiontype option:selected").val(),
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
			$("#addreport_infectionname").html(html);

		}
	})
};

function insert(data) {
	$.ajax({
		url : config.url + "report/insert",
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

$(document).ready(function() {
	selectAllType();
	var usertype=$.cookie("usertype");
	//console.log(usertype);
	//判断当前登录用户
	if(usertype==0){
		$(".edittable tbody tr:eq(0)").hide();
		$(".edittable tbody tr:eq(1)").hide();
	}
	$("#addreport_infectiontype").change(function() {
		getAllByTypeId();
	});
	$("#addreport_schooltype").change(function() {
		getAllSchoolByLevel();
	});
	$("#addreport_from_addbtn").click(function() {
		//console.log($("#addreport_from").serialize());
		if(AllisNes()){
			insert($("#addreport_from").serialize());
		}
	});
	$(".task_publish_bon").click(function() {
		$(".task_publish_file").click();
	});
	var time_plugin = "";
	$(".time_plugin_lv_onclick").click(function(){
		time_plugin = $(this);
	});
	$(document).on("click",".time_plugin_lv_click",function(){
		if($(time_plugin).attr("id")=="addreport_birthDay"){
			setTimeout(function(){
				//alert($(".time_plugin_lv_onclick").val());
				//alert(jsGetAge($(".time_plugin_lv_onclick").val()));
				var age=jsGetAge($(".time_plugin_lv_onclick").val());
				$("#addreport_age").val(age);
			},500);
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

