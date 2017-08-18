var oData = new Date();
var year = oData.getFullYear(); // 获取完整的年份(4位,1970-????)
var month = oData.getMonth() + 1; // 获取当前月份(0-11,0代表1月)
var data = oData.getDate(); // 获取当前日(1-31)
var day = oData.getDay(); // 获取当前星期X(0-6,0代表星期天)
var h = oData.getHours(); // 获取当前小时数(0-23)
var m = oData.getMinutes(); // 获取当前分钟数(0-59)
var s = oData.getSeconds(); // 获取当前秒数(0-59)
var data_zyl = year + "-" + month + "-" + data + " " + h + ":" + m + ":" + s;

$(function() {
	nowOfReport();
	selectByCond();
});

function nowOfReport() {
	$
			.ajax({
				type : 'POST',
				url : "/Infection/report/getNowReportBySchoolId",
				dataType : 'json',
				async : true,
				data : {},
				success : function(data) {
					var html = "";
					if (data.t == 0) {
						html += '<div style="float: right;padding-right: 20px;padding-top: 2px;"><input id="zero_report" type="button" value="零报告"></div>';
						alert("今日未上报报告卡，如无疫情，请上传零报告！");

					} else {
						html += '<div style="float: right;padding-right: 20px;padding-top: 2px;"><span style="color:#ffffff;">今日已上报数量：'
								+ data.t + '条</span></div>';
					}
					$(".bodyNav_xk").append(html);
				}
			});
};
$(document).on("click", "#zero_report", function() {
	$.ajax({
		type : 'POST',
		url : "/Infection/report/insert",
		dataType : 'json',
		async : true,
		data : {
			"iszero" : 1,
			"fillTime" : data_zyl
		},
		success : function(data) {
			alert("已上报零报告");
			window.location.reload();
		}
	});
});

function selectByCond() {
	var data_json = {
		"isRead" : $("#isRead option:selected").val(),
		"page" : 1
	};
	getPageContent("index2", "/Infection/notices/selectByAdmin", 1,
			$(".YApage>td"), data_json);

}

function pushListContent(data) {
	// console.log(data);
	var result = data.t.list;
	var html = "";
	var lev = "";
	for (var i = 0; i < result.length; i++) {
		html += "<tr>";
		if (result[i].isRead == 0) {
			lev = "未读";
		} else if (result[i].isRead == 1) {
			lev = "已读";
		}
		if (result[i].content != null) {
			html += "<td>" + result[i].content + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (result[i].createTime != null) {
			html += "<td>" + result[i].createTime + "</td>";
		} else {
			html += "<td>" + '' + "</td>";
		}
		if (result[i].isRead == 0) {
			html += "<td time=" + result[i].createTime + " value="
					+ result[i].schoolId + ">" + lev
					+ "<input type=\"button\" value=\"标记为已读\"></td>";
		} else {
			html += "<td time=" + result[i].createTime + " value="
					+ result[i].schoolId + ">" + lev + "</td>";
		}
		html += "</tr>";
	}
	$("#tbIndex").html(html);
	$("#tbFoot tr:eq(0) td").html(
			'第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共'
					+ data.t.totalCount + '条');
}

$(document).on("click", "#tbIndex td input", function() {
	var schoolId = $(this).parent("td").attr("value");
	// var time = $(this).parent("td").attr("time");
	var time = $(this).parents('tr').children('td').eq(1).text();
	var data_json = {
		"schoolId" : schoolId,
		"createTime" : time
	};
	$.ajax({
		type : 'POST',
		url : "/Infection/notices/update",
		dataType : 'json',
		async : true,
		data : data_json,
		success : function(data) {
			alert("标记为已读！");
			window.location.reload();
		}
	});
});

// 全部标记为已读（当前登录人）
function updateAll() {
	$.ajax({
		type : 'POST',
		url : "/Infection/notices/updateAll",
		dataType : 'json',
		async : true,
		success : function(data) {
			alert("全部标记为已读！");
			window.location.reload();
		}
	});
}
