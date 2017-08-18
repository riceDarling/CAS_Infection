/*$("[thispopup=\"detailA\"]").on("click","",function)*/
	selectByCondB();


function selectByCondB(){
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var schoolId = $("[thispopup=\"detailB\"]").attr("parm");
	var infectionId = $("[thispopup=\"detailB\"]").attr("parm2");
	var data_json = {
		"startTime" : startTime,
		"endTime":endTime,
		"infectionId":infectionId,
		"schoolId" : schoolId
	};
	getPageContent("detailA","/Infection/report/getReportDetail",1,$("#detailBpage"),data_json);

}

function pushListContentB(data){
//	console.log(data);
	var result = data.t.list;
	var html = "";
	for(var i = 0; i < result.length; i++){
		html += "<tr value="+result[i].cardId+">"
				+ "<td>"+result[i].classes+"</td>"
				+ "<td>"+result[i].patientName+"</td>"
				+ "</tr>";
	}
	$("#detailB tbody").html(html);
	$("#detailBdetail").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
}
