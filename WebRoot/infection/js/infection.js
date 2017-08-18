$(function() {
	selectByCond();
});

function selectByCond(){
	var infection_type = $("#select_type").find("option:selected").val();
	var infection_name = $("#infection_name").val();
	var data_json = {
		"typeId" : infection_type,
		"name":infection_name,
		"page":1
	};
	getPageContent("infection","/Infection/infection/getAllInfection",1,$(".YApage>td"),data_json);
}

function pushListContent(data){
	var result = data.t.list;
	var html = "";
	for(var i = 0; i < result.length; i++){
		html += "<tr>"
				+ "<td>"+(i+1)+"</td>"
				+ "<td>"+result[i].typeName+"</td>"
				+ "<td>"+result[i].infectionName+"</td>"
				+ "<td>"+result[i].insulateTime+"天</td>"
				+ "<td><input type=\"button\" id_xk=\""+result[i].infectionId+"\" value=\"订正\"><input type=\"button\" id_xk=\""+result[i].infectionId+"\" value=\"删除\"><input type=\"button\"  id_xk=\""+result[i].infectionId+"\" value=\"详情\"></td>"
				+ "</tr>";
	}
	$("#infectionList").html(html);
	$("#infection_foot").html('第' + data.t.currentPage + '页 共' + data.t.pageTotal + '页 共' + data.t.totalCount + '条');
}

function allType(){
	$("#select_type").empty();
	$.ajax({
		type : 'POST',
		url : "/Infection/type/selectAllType",
		dataType : 'json',
		async : true,
		success:function(date){
			var res = date.t;
	        	$("#select_type").append("<option value=''>请选择</option>");
			for (var i = 0;i < res.length; i++) {
	        	$("#select_type").append("<option value="+res[i].typeId+">" + res[i].typeName + "</option>");
	        }
		}
	});
}

allType();