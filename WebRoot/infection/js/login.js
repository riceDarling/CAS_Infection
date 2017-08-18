
$(document).on("click",".loginbtn",function(){
	var name=$("#name").val();
	var password=$("#password").val();
	$.cookie("username", name);
	$.cookie("password", password);
	$.ajax({
		url:config.url+"account/login",
		timeout:10000,
		dataType:"json",
		type:"post",
		data:{
			'name':name,
			'password':password
		},
		success:function(data){
//			console.log(data);
			if(data.success){
				$.cookie("id",data.t.id);
				$.cookie("nickname",data.t.nickname);
				$.cookie("usertype",data.t.level);
				data.t.level==1?location.href="index.jsp":location.href="index2.jsp";
			}else{
				alert(data.msg);
			}
			
		}
	})
})

$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		var name=$("#name").val();
		var password=$("#password").val();
		$.cookie("username", name);
		$.cookie("password", password);
		$.ajax({
			url:config.url+"account/login",
			timeout:10000,
			dataType:"json",
			type:"post",
			data:{
				'name':name,
				'password':password
			},
			success:function(data){
//				console.log(data);
				$.cookie("id",data.t.id);
				$.cookie("nickname",data.t.nickname);
				$.cookie("usertype",data.t.level);
				data.t.level==1?location.href="index.jsp":location.href="index2.jsp";
			}
		})
	}
});