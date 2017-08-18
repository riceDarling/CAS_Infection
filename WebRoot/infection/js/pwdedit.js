$(function(){
	$("#account").val($.cookie("username"));
//	$("#nickname").val($.cookie("nickname"));
//	$("#pwd").val($.cookie("password"));
});

$(document).on("click","#updateInfo",function(){
	if(AllisNes()){
		var data_json = {
				"id" : $.cookie("id"),
				"nickname" : $("#nickname").val(),
				"password" : $("#pwd").val()
			};
			$.ajax({
				
				type : 'POST',
				
				url : "/Infection/account/update",
				
				dataType : 'json',
				
				async : true,
				
				data : data_json,
				
				success : function (data){
					alert("信息修改成功！");
					if(confirm("是否重新登录？")) {
						$.cookie("usertype",null);
						location.href="login.jsp";
					} else {
						location.href="index2.jsp";
					}
				}
			});
	}
	
});
