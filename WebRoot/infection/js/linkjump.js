
linkjump={
	"管理已有传染病种类":"infectiontype",
	"新增传染病种类":"addinfectiontype",
	"管理已有传染病":"infection",
	"新增传染病":"addinfection",
	"管理已有学校":"school",
	"新增学校":"addschool",
	"管理已有报告卡":"report",
	"新增报告卡":"addreport",
	"分年龄统计":"statisticsByAge",
	"分学校统计":"statisticsBySchool",
	//"分人群统计":"statisticsByThrong",
	//"分年龄实时统计":"statisticsByAgeRealtime",
	//"分学校实时统计":"statisticsBySchoolRealtime",
	//"分人群实时统计":"statisticsByThrongRealtime",
	"分时间段统计饼状图":"statisticsByTime",
	"分时间段统计柱状图":"statisticsByHistogram",
	"分时间段统计折线图":"statisticsByLine",
	"日常管理":"managesys",
	"管理架构":"index_firsttime",
	"传染病防控知识":"doclist"
		
}
$(document).on("click",".leftListContent_xk dd",function(){
	if(linkjump[$(this).text()]!=undefined&&linkjump[$(this).text()]!=null&&linkjump[$(this).text()]!=""){
		location.href = linkjump[$(this).text()]+".jsp";
	}else if($(this).text()=="制度汇编"){
		window.open("pdf1.jsp");
	}
})
if($.cookie("usertype")==1){
	$(document).ready(function(){
		$(".leftListContent_xk").load("leftNav.jsp");
		infoload();
	})
}else if($.cookie("usertype")==0){
		$.ajax({
			type : 'POST',
			url : config.url + "structure/selectBySchoolIdNum",
			dataType : 'json',
			async : false,
			success : function(data) {
				if (data.t) {
					$(document).ready(function(){
						$(".leftListContent_xk").load("leftNav2.jsp");
						infoload();
					})
					
				}else{
					var thishref = location.href.split("/")
					thishref = thishref[thishref.length-1];
					if(thishref!="index_firsttime_edit.jsp"){
						location.href="index_firsttime_edit.jsp";
					}else{
						infoload();
					}
				}
			}
		})
}else{
		location.href="login.jsp";
}
function infoload(){
	$(".bodyNav_xk").html("<span>某某某你好，欢迎光临！</span>");
	var html="";
	html+="<li id=\"homepage\" class=\"tabstyle1\">首页</li>";
	html+="<li id=\"passwordEdit\" class=\"tabstyle2\">信息修改</li>";
	html+="<li id=\"logout\" class=\"tabstyle2\">退出登录</li>"
	$(".bodyTop_xk>ul").html(html);
	$(".bodyrighttop_xk").remove();
	$(".leftListContent_xk dl dd").each(function(){
		if ($(this).text()==$("title").text()) {
			$(this).addClass("on_xk");
		} else{
		}
	});
}
	
$(document).ready(function(){
	
});
$(document).on("click","#homepage",function(){
	$.cookie("usertype")==1?location.href="index.jsp":location.href="index2.jsp";
});

$(document).on("click","#passwordEdit",function(){
	location.href="passwordedit.jsp";
});
function isNes(nesname){
	$("[nes=\""+nesname+"\"]").parent().children("[nesalarm]").remove();
	if($("[nes=\""+nesname+"\"]").val()==""||$("[nes=\""+nesname+"\"]").val()==null||$("[nes=\""+nesname+"\"]").val()==undefined){
		$("[nes=\""+nesname+"\"]").parent().append("<span nesalarm>"+nesname+"为必填项，不能为空！</span>");
		return false;
	}
	else{
		return true;
	}
}

function AllisNes(){
	var ifContinue=true;
	$("[nes]:not(':hidden [nes]')").each(function(){
		ifContinue*=isNes($(this).attr("nes"));
	})
	return ifContinue;
}
