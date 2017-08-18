thisname_lv_img = "";
img_id = "";
$(function() {
	$(".task_publish_bon").click(function() {
		$(".task_publish_file").click();
	});
	
	getPlanById();
	
	$("#editmanagesys_from_addbtn").click(function(){
		//alert($(".thisname_lv_img").attr("value"));
		if($(".thisname_lv_img").attr("value")==""||$(".thisname_lv_img").attr("value")==null||$(".thisname_lv_img").attr("value")==undefined){
			alert("请上传文件后再提交！");
		}else{
			update("planimg="+$(".thisname_lv_img").attr("value"));
		}
	});

});
function update(data) {
	data += "&id=" + GetRequest();
	//console.log(data);
	$.ajax({
		url : config.url + "plan/update",
		data : data,
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			alert(data.msg);
			location.href="managesys.jsp";
		}
	});
};
function getPlanById(){
	var id = GetRequest();
	$.ajax({
		url : config.url + "plan/selectById",
		data : {
			id : id
		},
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			if(data.success){
				$("#editmanagesys_tr_1").append(data.t.planName);
				if(data.t.planimg!=null){
					
				}
				
			}
			
			
		}
	});
};
function GetRequest() {
	var url = location.search;
	if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		return str;
	}
};
$(document).on('click','img[src="img/upload.png"]',function(){
	$('img[alt="上传照片"]').attr("class", "");
	$(this).attr("class", "thisname_lv_img");
	$(this).next("input:file").click();
})
$(document).on('change',"input:file",function(){
	UploadImg($(this).attr("id"));
})

function UploadImg(id) {
	$.ajaxFileUpload({
		url: config.url + 'upload/file',
		secureuri: false,
		fileElementId: id,
		dataType: 'json',
		type: 'post',
		success: function(data, status) {
			if(data.success){
				$(".thisname_lv_img").attr("src","img/file.png");
				$(".thisname_lv_img").attr("value", data.t);
			}
			
		}
	})
};