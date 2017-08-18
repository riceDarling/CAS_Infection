
function getAllReport(data_json) {
	getPageContent("report", "/Infection/report/getAllReport", 1, $(".YApage>td"), data_json);
};
function pushListContent(data) {
	var html = "";
	for (var i = 0; i < data.t.list.length; i++) {
		html += "<tr>";
		html += "<td>" + (i + 1) + "</td>";
		if (data.t.list[i].cardId != null) {
			html += "<td>" + data.t.list[i].cardId + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].patientName != null) {
			html += "<td>" + data.t.list[i].patientName + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].sex == 1) {
			html += "<td>女</td>";
		} else {
			html += "<td>男</td>";
		}
		if (data.t.list[i].age != null) {
			html += "<td>" + data.t.list[i].age + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].schoolName != null) {
			html += "<td>" + data.t.list[i].schoolName + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].classes != null) {
			html += "<td>" + data.t.list[i].classes + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].address != null) {
			html += "<td title='" + data.t.list[i].address + "'>" + data.t.list[i].address + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].typeName != null) {
			html += "<td>" + data.t.list[i].typeName + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].infectionName != null) {
			html += "<td>" + data.t.list[i].infectionName + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].diagnosisTime != null) {
			html += "<td>" + data.t.list[i].diagnosisTime + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].fillTime != null) {
			html += "<td>" + data.t.list[i].fillTime + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}

		if (data.t.list[i].revisedTime != null) {
			html += "<td>" + data.t.list[i].revisedTime + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (data.t.list[i].auditTime != null) {
			html += "<td>" + data.t.list[i].auditTime + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if(data.t.list[i].isDel == 1||data.t.list[i].end==1){
			html += '<td><input type="button" value="详情" id_xk=' + data.t.list[i].cardId + '></td>';
		}else{
			html += '<td><input type="button" value="订正" id_xk=' + data.t.list[i].cardId + '><input type="button" value="追踪" id_xk=' + data.t.list[i].cardId + '><input type="button" value="详情" id_xk=' + data.t.list[i].cardId + '><input type="button" value="删除" id_xk=' + data.t.list[i].cardId + '></td>';
		}
		
		
		if (data.t.list[i].isDel == 1||data.t.list[i].end==1) {
			html+='<td></td>';
		} else if (data.t.list[i].isPass == 1) {
			//审核通过的
			if(data.t.list[i].restore==1){
				//申请结案
				html += '<td><input type="button" value="留调" id_xk=' + data.t.list[i].cardId + '><input type="button" value="结案" id_xk=' + data.t.list[i].cardId + '><input type="button" value="整改落实情况" id_xk=' + data.t.list[i].cardId + '></td>';			
			}else{
				//未复课
				html += '<td><input type="button" value="留调" id_xk=' + data.t.list[i].cardId + '><input type="button" value="复课" id_xk=' + data.t.list[i].cardId + '><input type="button" value="整改落实情况" id_xk=' + data.t.list[i].cardId + '></td>';		
			}
		} else {
			//未通过审核的
			var usertype=$.cookie("usertype");
			if(usertype==0){
				//普通用户没有审核操作
				html += '<td></td>';	
			}else{
				//管理员审核操作
				html += '<td><input type="button" value="审核" id_xk=' + data.t.list[i].cardId + '></td>';
				
			}
				}
		html += "</tr>";

	}
	$("#report_tbody").html(html);
	$("#report_footer").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
}

// 根据学校级别获取学校列表
function getAllSchoolByLevel() {
	data_json = {
		"levelId" : $("#report_schooltype option:selected").val(),
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
			html += "<option value=''>-学校名称-</option>";
			if (data.success) {
				for (i in data.obj) {
					html += "<option value='" + data.obj[i].schoolId + "'>" + data.obj[i].schoolName + "</option>";
				}
			}
			$("#report_school").html(html);

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
			$("#report_infectiontype").html(html);

		}
	})
};
// 根据疾病种类获取疾病列表
function getAllByTypeId() {
	data_json = {
		"typeId" : $("#report_infectiontype option:selected").val(),
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
			html += "<option value=''>选择名称</option>";
			if (data.success) {
				for (i in data.obj) {
					html += "<option value='" + data.obj[i].infectionId + "'>" + data.obj[i].infectionName + "</option>";
				}
			}
			$("#report_infectionname").html(html);

		}
	})
};
$(document).ready(function() {
	var usertype=$.cookie("usertype");
	console.log(usertype);
	//此处根据当前登录的账号来查询，如果为普通用户，多传usertype字段，后台根据来处理schoolId
	if(usertype==0){
		$("#report_schooltype").hide();
		$("#report_school").hide();
	}
	
	getAllReport();
	$("#report_select_btn").click(function() {
		//console.log($("#report_select_form").serialize());
		getAllReport($("#report_select_form").serialize());
	});
	
	selectAllType();
	$("#report_infectiontype").change(function() {
		getAllByTypeId();
	});
	$("#report_schooltype").change(function() {
		getAllSchoolByLevel();
	});
	
});
