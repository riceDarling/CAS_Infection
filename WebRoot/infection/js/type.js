$(function() {
	selectByCond();
});

function selectByCond(){
	var type_name = $("#type_name").val();
	var data_json = {
		"name":type_name,
		"page":1
	};
	getPageContent("type","/Infection/type/getAllType",1,$(".YApage>td"),data_json);

}

function pushListContent(data){
//	console.log(data);
	var result = data.t.list;
	var html = "";
	for(var i = 0; i < result.length; i++){
		html += "<tr>"
				+ "<td>"+(i+1)+"</td>"
				+ "<td>"+result[i].typeId+"</td>"
				+ "<td>"+result[i].typeName+"</td>"
				+ "<td><input type=\"button\" id_xk=\""+result[i].typeId+"\" value=\"订正\"><input type=\"button\" id_xk=\""+result[i].typeId+"\" value=\"删除\"><input type=\"button\"  id_xk=\""+result[i].typeId+"\" value=\"详情\"></td>"
				+ "</tr>";
	}
	$("#typeList").html(html);
	$("#type_foot").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
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
//		        	$("#select_level").append("<option>" + res[i].level + "</option>");
//		        }
//		}
//	});
//}
//
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




