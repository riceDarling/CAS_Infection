$(document).ready(function(){
	if($.cookie("usertype")==0){
		$(".bodyrightmain_xk>.bordergrp").hide();
		$(".bodyrightmain_xk>.edittable").show();
		$("#index_firsttime_edit").prop("disabled",true).hide();
		index_firsttime_select(null);	
	}else if($.cookie("usertype")==1){
		$(".bodyrightmain_xk>.bordergrp").show();
		$(".bodyrightmain_xk>.edittable").hide();
		$("#index_firsttime_edit").prop("disabled",true).hide();
	};
	$("#index_firsttime_edit:enabled").click(function(){
		location.href="index_firsttime_edit.jsp";
	});
	
	$("#index_firsttime_schooltype").change(function() {
		getSchoolByLevel();
	});
});
$(document).on("click","#index_firsttime_select_btn",function(){	
		var schoolId=$("#index_firsttime_school option:selected").val();
		index_firsttime_select(schoolId);	
});
function index_firsttime_select(schoolid){
	$.ajax({
		url : config.url +"structure/selectBySchoolId",
		datatype:"json",
		type:"post",
		async:false,
		data:{"schoolId" : schoolid},
		success:function(data){
			if(data.success){
				if(data.obj.length){
					data=data.obj;
					var html_level0 = "";
					var html_level1 = "";
					var html_level2 = "";
					for(one in data){
						switch(data[one]["rank"]){
							case 0:
								html_level0+='<ul class="dendrogramtab" >'
								+'<li class="singlecontent"><label>校长:</label><span>'+data[one]["name"]+'</span></li>'
								+'<li class="singlecontent"><label>职责:</label><span>'+data[one]["duties"]+'</span></li>'
								+'</ul>';
								break;
							case 1:
								html_level1+='<ul class="dendrogramtab">'
								+'<li class="multicontent"><label>姓名:</label><span>'+data[one]["name"]+'</span><label>职务:</label><span>'+data[one]["position"]+'</span></li>'
								+'<li class="singlecontent"><label>职责:</label><span>'+data[one]["duties"]+'</span></li>'
								+'</ul>';
								break;
							case 2:
								html_level2+='<ul class="dendrogramtab">'
								+'<li class="multicontent"><label>姓名:</label><span>'+data[one]["name"]+'</span><label>职务:</label><span>'+data[one]["position"]+'</span></li>'
								+'<li class="singlecontent"><label>职责:</label><span>'+data[one]["duties"]+'</span></li>'
								+'</ul>';
								break;
							default:
								break;
						}
					}
					$("#index_firsttime_level0").html(html_level0);
					$("#index_firsttime_level1").html(html_level1);
					$("#index_firsttime_level2").html(html_level2);
					$(".bodyrightmain_xk>.edittable").show();
					if($.cookie("usertype")==0){
						$("#index_firsttime_edit").prop("disabled",false).show();
					}
					
				}else{
					if($.cookie("usertype")==0){
						location.href="index_firsttime_edit.jsp";
					}else if($.cookie("usertype")==1){
						$("#index_firsttime_level0").html("");
						$("#index_firsttime_level1").html("");
						$("#index_firsttime_level2").html("");
						$(".bodyrightmain_xk>.edittable").hide();
					}
				}
			}
			
		}
	})
};

// 根据学校级别获取学校列表
function getSchoolByLevel() {
	data_json = {
		"levelId" : $("#index_firsttime_schooltype option:selected").val(),
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
			$("#index_firsttime_school").html(html);

		}
	})
};