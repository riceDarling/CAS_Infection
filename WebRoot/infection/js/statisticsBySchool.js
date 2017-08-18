$(document).ready(function() {
	var usertype=$.cookie("usertype");
	console.log(usertype);
	//此处根据当前登录的账号来查询，如果为普通用户，多传usertype字段，后台根据来处理schoolId
	if(usertype==0){
		$("#divide_user").hide();
	}
	getStatisticsBySchool();
	selectAllType();
	$("#report_infectiontype").change(function() {
		getAllByTypeId();
	});
	$("#report_schooltype").change(function() {
		getAllSchoolByLevel();
	});
	$("#byschool_select_btn").click(function() {
		console.log($("#byschool_select_form").serialize());
		getStatisticsBySchool($("#byschool_select_form").serialize());
	});
});
function getStatisticsBySchool(data_json) {
	getPageContent("statisticsBySchool", "/Infection/statistical/getStatisticsBySchool", 1, $(".YApage>td"), data_json);
};
function pushListContent(data) {
	var html = "";
	for (var i = 0; i < data.t.list.length; i++) {
		html += "<tr>";
		html += "<td>" + data.t.list[i].schoolName + "</td>";
		html += "<td>" + data.t.list[i].boyIll + "</td>";
		html += "<td>" + data.t.list[i].girlIll + "</td>";
		html += "<td>" + data.t.list[i].totalIll + "</td>";
		html += "<td>" + data.t.list[i].boyDeath + "</td>";
		html += "<td>" + data.t.list[i].girlDeath + "</td>";
		html += "<td>" + data.t.list[i].totalDeath + "</td>";
		html += "</tr>";

	}
//	for (var i = 0; i < data.t.list[0].length; i++) {
//		html += "<tr>";
//		html += "<td>" + data.t.list[0][i].schoolName + "</td>";
//		html += "<td>" + data.t.list[0][i].boyCount + "</td>";
//		html += "<td>" + data.t.list[0][i].girlCount + "</td>";
//		html += "<td>" + data.t.list[0][i].sexCount + "</td>";
//		html += "<td>" + data.t.list[1][i].boyCount + "</td>";
//		html += "<td>" + data.t.list[1][i].girlCount + "</td>";
//		html += "<td>" + data.t.list[1][i].sexCount + "</td>";
//		html += "</tr>";
//		
//	}
	$(".mainlist_xk tbody").html(html);
	$("tfoot tr:eq(0) td").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
}
//根据学校级别获取学校列表
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