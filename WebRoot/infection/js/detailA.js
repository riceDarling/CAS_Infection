/*$("[thispopup=\"detailA\"]").on("click","",function)*/
selectByCondA();


function selectByCondA(){
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var schoolId = $("[thispopup=\"detailA\"]").attr("parm");
	var data_json = {
		"startTime" : startTime,
		"endTime":endTime,
		"schoolId" : schoolId
	};
	getPageContent("detailA","/Infection/report/getReportBySchoolId",1,$("#detailApage"),data_json);

}

function pushListContentA(data){
//	console.log(data);
	var result = data.t.list;
	var html = "";
	if (result.length == 1 && result[0].count == 0) {
	} else {
		for(var i = 0; i < result.length; i++){
			html += "<tr value="+result[i].infectionId+">";
			if (result[i].infectionName != null && result[i].infectionName != undefined) {
				html += "<td>"+result[i].infectionName+"</td>";
				html += "<td>"+result[i].count+"</td>";
			}
			html += "</tr>";
		}
	}
	$("#detailA tbody").html(html);
	$("#detailAdetail").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
}
