$(function() {
	selectByCond();
});

function selectByCond(){
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var data_json = {
			"startTime" : startTime,
			"endTime":endTime,
			"page":1
	};
	
	getPageContent("index","/Infection/report/getIndexDate",1,$("#leftTable tfoot tr td:eq(0)"),data_json);
	getPageContent("index","/Infection/report/getOtherDate",1,$("#rightTable tfoot tr td:eq(0)"),data_json);
}


function pushListContent(data){
//	console.log(data);
	if (data.t.hasOwnProperty("schoolCount")) {
		$("#infeCount").html(data.t.infeCount);
		$("#notSchoolCount").html(data.t.notSchoolCount);
		$("#schoolCount").html(data.t.schoolCount);
		var result = data.t.iPage.list;
		var html = "";
		for(var i = 0; i < result.length; i++){
			html += "<tr>"
				+ "<td value="+result[i].schoolId+">"+result[i].schoolName+"</td>"
				+ "<td value="+result[i].schoolId+">"+result[i].countNum+"</td>"
				+ "</tr>";
		}
		$("#leftData").html(html);
		$("#leftPage").html('第' + data.t.iPage.currentPage + '页 共' + data.t.iPage.pageTotal + '页 共' + data.t.iPage.totalCount + '条');

	} else {
		var result = data.t.list;
		var html = "";
		for(var i = 0; i < result.length; i++){
			html += "<tr>"
				+ "<td value="+result[i].schoolId+">"+result[i].schoolName+"</td>"
				+ "<td value="+result[i].schoolId+"><input type='button' value='通知'/></td>"
				+ "</tr>";
		}
		$("#rightData").html(html);
		$("#rightPage").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
		
	}
}

$(document).on("click","#rightData td input",function(){
	var schoolId = $(this).parent("td").attr("value");
	$.ajax({
		url : "/Infection/notices/insert",
		dataType : "json",
		async : true,
		type : "post",
		data : {
			"schoolId" : schoolId
		},
		success : function (data) {
			alert("发送成功");
		}
	});
	
});

$(document).on("dblclick", "#leftData tr", function() {
	var schoolId = $(this).children().attr("value");
			var html = "";
			html += "<div class=\"popupwindow\" thispopup=\"detailA\" parm=\""+schoolId+"\">";
			html += "<div class=\"popupbody\">";
			html += "<ul>";
			html += "<li class=\"popupmain\">";
			html += "<div class=\"popup\">";
			html += "<div class=\"popuptitle\"><span>传染病详情</span></div>";
			html += "<div class=\"popupcontent\">";
			html += "<table id=\"detailA\" class=\"edittable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
				html+= "<thead><tr><td>疾病名</td><td>数量</td></tr></thead>";
			html+= "<tbody>";
			html+= "</tbody>";
			html+="<tfoot>"
				html+="<tr>";
			html+="<td id=\"detailAdetail\" colspan=\"2\">";
			html+="</td>";
			html+="</tr>";
			html+="<tr class=\"YApage\">";
			html+="<td id=\"detailApage\" style=\"text-align:center\" colspan=\"2\">";
			html+="</td>";
			html+="</tr>";
			html+="<tr>";
			html+="<td colspan=\"2\">";
			html+="<input type=\"button\" value=\"关闭\" closebtn>";
			html+="</td>";
			html+="</tr>";
			html+="</tfoot>"
				html+="</table>";
			html += "</div>";
			html += "</div>";
			html += "</li>";
			html += "</ul>";
			html += "</div>";
			html += "<div class=\"bgcover\"></div>";
			html += "<script type=\"text/javascript\" src=\"js/detailA.js\"></script>"
			html += "</div>";
			$("body").append(html);
	});
	
$(document).on("dblclick", "#detailA tbody tr", function() {
	var html = "";
	html += "<div class=\"popupwindow\" thispopup=\"detailB\" parm=\""+$("[thispopup=\"detailA\"]").attr("parm")+"\" parm2=\""+$(this).attr("value")+"\" >";
	html += "<div class=\"popupbody\">";
	html += "<ul>";
	html += "<li class=\"popupmain\">";
	html += "<div class=\"popup\">";
	html += "<div class=\"popuptitle\"><span>传染病详情</span></div>";
	html += "<div class=\"popupcontent\">";
	html += "<table id=\"detailB\" class=\"edittable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
	html+= "<thead><tr><td>班级</td><td>姓名</td></tr></thead>";
	html+= "<tbody>";
	html+= "</tbody>";
	html+="<tfoot>"
	html+="<tr>";
	html+="<td id=\"detailBdetail\" colspan=\"2\">";
	html+="</td>";
	html+="</tr>";
	html+="<tr class=\"YApage\">";
	html+="<td id=\"detailBpage\" style=\"text-align:center\" colspan=\"2\">";
	html+="</td>";
	html+="</tr>";
	html+="<tr>";
	html+="<td colspan=\"2\">";
	html+="<input type=\"button\" value=\"关闭\" closebtn>";
	html+="</td>";
	html+="</tr>";
	html+="</tfoot>"
	html+="</table>";
	html += "</div>";
	html += "</div>";
	html += "</li>";
	html += "</ul>";
	html += "</div>";
	html += "<div class=\"bgcover\"></div>";
	html += "<script type=\"text/javascript\" src=\"js/detailB.js\"></script>"
	html += "</div>";
	$("body").append(html);
});
$(document).on("dblclick", "#detailB tbody tr", function() {
	
	window.open(getURL + "detailsreport" +  ".jsp?" + $(this).attr("value"));
});
$(document).on("click","[closebtn]",function(){
	$(this).parents(".popupwindow").remove();
})
