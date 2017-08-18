$(function() {
	selectByCond();
});

function selectByCond(){
	var select_level = $("#select_level").find("option:selected").val();
	var select_id = $("#select_schoolId").val();
	var select_name = $("#select_schoolName").val();
	if (select_level == "请选择") {
		select_level = "";
	}
	var data_json = {
		"level" : select_level,
		"schoolId":select_id,
		"schoolName":select_name,
		"page":1
	};
	getPageContent("school","/Infection/school/getAllSchool",1,$(".YApage>td"),data_json);

}

function pushListContent(data){
//	console.log(data);
	var result = data.t.list;
	var html = "";
	var lev = "";
	for(var i = 0; i < result.length; i++){
		if (result[i].level == 1) {
			lev = "幼儿园(民办)";
		} else if (result[i].level == 2) {
			lev = "幼儿园(国办)";
		} else if (result[i].level == 3) {
			lev = "小学";
		} else if (result[i].level == 4) {
			lev = "中学";
		} else if (result[i].level == 5) {
			lev = "民办学校";
		} else if (result[i].level == 6) {
			lev = "职业学校";
		} else if (result[i].level == 7) {
			lev = "街道文教科";
		}
		html += "<tr>"
				+ "<td>"+(i+1)+"</td>"
				+ "<td>"+result[i].schoolId+"</td>"
				+ "<td>"+result[i].schoolName+"</td>"
				+ "<td>"+lev+"</td>"
				+ "<td>"+result[i].postalcode+"</td>"
				+ "<td>"+result[i].limkman+"</td>"
				+ "<td>"+result[i].telephone+"</td>"
				+ "<td>"+result[i].address+"</td>"
				+ "<td><input type=\"button\" id_xk=\""+result[i].schoolId+"\" value=\"订正\"><input type=\"button\" id_xk=\""+result[i].schoolId+"\" value=\"删除\"><input type=\"button\"  id_xk=\""+result[i].schoolId+"\" value=\"详情\"></td>"
				+ "</tr>";
	}
	$("#schoolList").html(html);
	$("#school_foot").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
}
//function allLevel(){
//	var slv = $("#select_level").val();
//	$("#select_level").empty();
//	$.ajax({
//		
//		type : 'POST',
//
//		url : "/Infection/school/getAllLevel",
//
//		dataType : 'json',
//
//		async : true,
//
//		success:function(date){
//			var res = date.t;
//	        	$("#select_level").append("<option>请选择</option>");
//			for (var i = 0;i < res.length; i++) {
//	        	$("#select_level").append("<option>" + res[i].level + "</option>");
//	        }
//		}
//	});
//}

//allLevel();
//onclick=\"deleteSchool()\"
//function deleteSchool(){
//	var schoolId = $(this).attr("id_xk");
//	alert(schoolId);
//	$.ajax({
//
//		type : 'POST',
//
//		url : "/Infection/school/delete",
//
//		dataType : 'json',
//
//		async : true,
//		
//		data : {
//			schoolId : schoolId,
//		},
//		
//		success : function () {
//		}
//	
//	});
//}




