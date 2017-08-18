
$(document).ready(function() {
	getPlan();
	
	$("#managesys_schooltype").change(function() {
		getSchoolByLevel();
	});
	$("#managesys_select_btn").click(function() {
		getPlanBySchoolId();
	});
	
});
function getPlan() {
	$
			.ajax({
				url : config.url + "plan/getPlan",
				dataType : "json",
				type : "post",
				timeout : 10000,
				success : function(data) {
					console.log(data);
					if (data.success) {
						if (data.obj == null) {
							$(".bordergrp").show();
						} else {
							var html = "";
							for (i in data.obj) {
								var temp=data.obj[i];
								html += '<tr><td>'+temp.planName+'</td><td class="imgline"><div>';
								
								if(temp.planimg!=null&&temp.planimg.trim()!=""){
									html+='<img src="./img/file.png" style="width:5%"/>';	
									html+='</div></td><td><input type="button" name="" id="" value="编辑" id_xk="'+temp.id+'"/><input type="button" name="" id="" value="下载" id_xk="'+temp.id+'"/></td></tr>';
								}else{
									html+='</div></td><td><input type="button" name="" id="" value="编辑" id_xk="'+temp.id+'"/></td></tr>';
								}
								
							}
							$(".edittable tbody").html(html);
						}
					}

				}
			});
};



function getPlanBySchoolId() {
	data_json = {
		"schoolId" : $("#managesys_school option:selected").val(),
	}
	$.ajax({
		url : config.url + "plan/getPlanBySchoolId",
		data : data_json,
		dataType : "json",
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			if(data.success){
				var html = "";
				for (i in data.obj) {
					var temp=data.obj[i];
					html += '<tr><td>'+temp.planName+'</td><td class="imgline"><div>';
					
					if(temp.planimg!=null&&temp.planimg.trim()!=""){
						html+='<img src="./img/file.png" style="width:5%"/>';
						html+='</div></td><td><input type="button" name="" id="" value="下载" id_xk="'+temp.id+'"/></td></tr>';			
					}else{
						html+='<td></td></tr>';
					}
					
					//html+='</div></td><td><input type="button" name="" id="" value="编辑" id_xk="'+temp.id+'"/></td></tr>';
					//
				}
				$(".edittable tbody").html(html);
			}
		}
	})
};

//根据学校级别获取学校列表
function getSchoolByLevel() {
	data_json = {
		"levelId" : $("#managesys_schooltype option:selected").val(),
	};
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
			$("#managesys_school").html(html);

		}
	})
};