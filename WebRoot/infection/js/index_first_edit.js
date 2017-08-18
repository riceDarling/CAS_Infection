$(document).ready(function(){
	index_firsttime_edit_select();
	
});
function singletablast(){
	$(".dendrogramtab").each(function(){
		if($(this).siblings(".dendrogramtab").length==0){
			$(this).children(".reducebtn").hide().prop("disabled",true);
		}else{
			$(this).children(".reducebtn").show().prop("disabled",false);
		}
	});
}
$(document).on("click","#savethispage",function(){
	var ifsubmit = true;
	var submitdata=[];
	var data_level0 ={};
	data_level0["name"]=$("#index_firsttime_edit_level0 [subid='name']").val();
	data_level0["position"]="校长";
	data_level0["rank"]=0;
	data_level0["duties"]=$("#index_firsttime_edit_level0 [subid='duties']").val();
	for(var one in data_level0){
		if(one ==""||one ==null||one ==undefined){
			ifsubmit*=false;
		}
	}
	submitdata.push(data_level0);
	
	$("#index_firsttime_edit_level1>.dendrogramtab").each(function(){
		var data_level1={};
		data_level1["name"]=$(this).find("[subid='name']").val();
		data_level1["position"]=$(this).find("[subid='position']").val();
		data_level1["rank"]=1;
		data_level1["duties"]=$(this).find("[subid='duties']").val();
		for(var one in data_level1){
			if(one ==""||one ==null||one ==undefined){
				ifsubmit*=false;
			}
		}
		submitdata.push(data_level1);
		
	})
	$("#index_firsttime_edit_level2>.dendrogramtab").each(function(){
		var data_level2={};
		data_level2["name"]=$(this).find("[subid='name']").val();
		data_level2["position"]=$(this).find("[subid='position']").val();
		data_level2["rank"]=2;
		data_level2["duties"]=$(this).find("[subid='duties']").val();
		for(var one in data_level2){
			if(one ==""||one ==null||one ==undefined){
				ifsubmit*=false;
			}
		}
		submitdata.push(data_level2);

	});
	if(ifsubmit){
		$.ajax({
			url : config.url +"structure/selectBySchoolIdNum",
			datatype:"json",
			type:"post",
			async:false,
			success:function(data){
				if(data.success){
					//data.t为true时代表已有数据，执行更新，data.t为false时代表没有数据，执行新建
					if(data.t){
						var urlname = "structure/updateS";
						var hreflink="index_firsttime.jsp";
					}else{
						var urlname = "structure/insertS";
						var hreflink="index2.jsp";
					}
					$.ajax({
						url : config.url + urlname,
						type:"post",
						data:{
							"data":JSON.stringify(submitdata)
						},
							
						async:false,
						success:function(data){
							alert(data.msg);
							location.href=hreflink;
						}
					})
				}
			}
		})
	}else{
		alert("请填写完整信息！");
	}
	
	
})
$(document).on("click",".reducebtn:enabled",function(){
	if(confirm("确认删除？")){
		$(this).parents(".dendrogramtab").remove();
		singletablast();
	};
})
$(document).on("click",".addbtn",function(){
	var html = "";
	html+='<ul class="dendrogramtab">'
		+'<li class="multicontent"><label>姓名:</label><span><input type="text" subid="name" value="" /></span><label>职务:</label><span><input type="text" subid="position" value="" /></span></li>'
		+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols=""></textarea></span></li>'
		+'<li class="reducebtn">X</li>'
		+'</ul>';
	$(this).before(html);
	singletablast();
});

$(document).on("click","#cancel",function(){
	index_firsttime_edit_select();
});
function index_firsttime_edit_select(){
	$.ajax({
		url : config.url +"structure/selectBySchoolId",
		datatype:"json",
		type:"post",
		async:false,
		success:function(data){
			if(data.success){
				if(data.obj.length){
					data=data.obj;
					var html_level0 = "";
					var html_level1 = "";
					var html_level2 = "";
					for(var one in data){
						switch(data[one]["rank"]){
							case 0:
								html_level0+='<ul class="dendrogramtab" >'
								+'<li class="singlecontent"><label>校长:</label><span><input type="text" subid="name" value="'+data[one]["name"]+'" /></span></li>'
								+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols="">'+data[one]["duties"]+'</textarea></span></li>'
								+'</ul>';
								break;
							case 1:
								html_level1+='<ul class="dendrogramtab">'
								+'<li class="multicontent"><label>姓名:</label><span><input type="text" subid="name" value="'+data[one]["name"]+'" /></span><label>职务:</label><span><input type="text" subid="position" value="'+data[one]["position"]+'" /></span></li>'
								+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols="">'+data[one]["duties"]+'</textarea></span></li>'
								+'<li class="reducebtn">X</li>'
								+'</ul>';
								break;
							case 2:
								html_level2+='<ul class="dendrogramtab">'
								+'<li class="multicontent"><label>姓名:</label><span><input type="text" subid="name" value="'+data[one]["name"]+'" /></span><label>职务:</label><span><input type="text" subid="position" value="'+data[one]["position"]+'" /></span></li>'
								+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols="">'+data[one]["duties"]+'</textarea></span></li>'
								+'<li class="reducebtn">X</li>'
								+'</ul>';
								break;
							default:
								break;
						}
					}
				}else{
					html_level0+='<ul class="dendrogramtab" >'
						+'<li class="singlecontent"><label>校长:</label><span><input type="text" subid="name" value="" /></span></li>'
						+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols=""></textarea></span></li>'
						+'</ul>';
					html_level1+='<ul class="dendrogramtab">'
						+'<li class="multicontent"><label>姓名:</label><span><input type="text" subid="name" value="" /></span><label>职务:</label><span><input type="text" subid="position" value="" /></span></li>'
						+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols=""></textarea></span></li>'
						+'<li class="reducebtn">X</li>'
						+'</ul>';
					html_level2+='<ul class="dendrogramtab">'
						+'<li class="multicontent"><label>姓名:</label><span><input type="text" subid="name" value="" /></span><label>职务:</label><span><input type="text" subid="position" value="" /></span></li>'
						+'<li class="singlecontent"><label>职责:</label><span><textarea subid="duties" name="" rows="" cols=""></textarea></span></li>'
						+'<li class="reducebtn">X</li>'
						+'</ul>';
				}
				html_level1+='<div class="addbtn"></div>';
				html_level2+='<div class="addbtn"></div>';
				$("#index_firsttime_edit_level0").html(html_level0);
				$("#index_firsttime_edit_level1").html(html_level1);
				$("#index_firsttime_edit_level2").html(html_level2);
				singletablast();
			}
			
		}
	})
};