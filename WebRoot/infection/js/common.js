var oData= new Date();
var year = oData .getFullYear(); //获取完整的年份(4位,1970-????)
var month = oData.getMonth()+1; //获取当前月份(0-11,0代表1月)
var data = oData.getDate(); //获取当前日(1-31)
var day = oData.getDay(); //获取当前星期X(0-6,0代表星期天)
var h = oData.getHours(); //获取当前小时数(0-23)
var m = oData.getMinutes(); //获取当前分钟数(0-59)
var s = oData.getSeconds(); //获取当前秒数(0-59)
var data_zyl = year+"-" +month+"-" + data+ " "+ h+":"+ m +":" + s;

var service_ip="localhost";

$(document).ready(function() {
	var contenttop = 0;
	$(".mainlistbox_xk").prev().each(function() {
		contenttop += $(this).outerHeight();
	})
	$(".mainlistbox_xk").css("padding-top", contenttop + 10);
	exit();
	
	//设置欢迎
	data= {
		"username": $.cookie("username"),
		"nickname": $.cookie("nickname")
		};
	$(".bodyNav_xk span").text(data.nickname + "  您好,欢迎光临！");
});

$(document).on("click", ".mainlist_xk input[type='button']", function() {
	var thisID_xk = $(this).attr("id_xk");
	switch($(this).val()) {
		case "订正":
			location.href = getURL + "edit" + $("title").attr("keywords") + ".jsp?" + thisID_xk;
			break;
		case "详情":
			window.open(getURL + "details" + $("title").attr("keywords") + ".jsp?" + $(this).attr("id_xk"));
			break;
		case "复课":
			location.href = getURL + "restore" + $("title").attr("keywords") + ".jsp?" + $(this).attr("id_xk");
			break;
		case "删除":
			if(confirm("确认删除该条目吗？")) {
				try {
					deletebyId(thisID_xk);

				} catch(e) {
				}

			}
			break;
		case "审核":
			if(confirm("是否通过该条审核？")) {
				try {
					update(thisID_xk);

				} catch(e) {
				}

			}
			break;
		case "编辑":
			location.href = getURL + "editmanagesys.jsp?" + $(this).attr("id_xk");
			break;
		case "结案":
			if(confirm("是否结案？")) {
				try {
					end(thisID_xk);
				} catch(e) {
				}

			}		
			break;	
		case "留调":
			location.href = getURL + "keeptune" + $("title").attr("keywords") + ".jsp?" + $(this).attr("id_xk");
			break;	
		case "整改落实情况":	
			location.href = getURL + "implementation" + $("title").attr("keywords") + ".jsp?" + $(this).attr("id_xk");
			break;
		case "追踪":	
			location.href = getURL + "tracking" + $("title").attr("keywords") + ".jsp?" + $(this).attr("id_xk");
			break;
		case "下载":	
			//日常管理文件下载
			window.open("/Infection/plan/filedown?id=" + $(this).attr("id_xk"));
			break;
		default:
			if($(this).attr("id_xk") == undefined || $(this).attr("id_xk") == null || $(this).attr("id_xk") == "") {
				alert("未定义的功能按键");
			}
			break;
	}

});

//结案
function end(thisID_xk){
	$.ajax({
		type : 'POST',
		url:"/Infection/report/end",
		dataType : 'json',
		async : true,
		data : {
			"cardId" : thisID_xk,
			"end":1,
		},
		success : function(data) {
			window.location.reload();
		}
	});
};
function update(thisID_xk){
	$.ajax({
		type : 'POST',
		url:"/Infection/report/update",
		dataType : 'json',
		async : true,
		data : {
			"auditTime":data_zyl,
			"cardId" : thisID_xk,
			"isPass":1,
		},
		success : function(data) {
			window.location.reload();
		}
	});
};

function deletebyId(thisID_xk){
	
	var delete_id = thisID_xk;
	//alert(delete_id);
	var delete_url = "";
	switch($("title").attr("keywords")){
	case "school":
		delete_url = "/Infection/school/delete";
		break;
	case "infection":
		delete_url = "/Infection/infection/delete";
		break;
	case "report":
		delete_url = "/Infection/report/delete";
		break;
	case "infectiontype":
		delete_url = "/Infection/type/delete";
		break;
	default:
		break;
	}
	$.ajax({
		type : 'POST',

		url:delete_url,

		dataType : 'json',

		async : true,

		data : {
			"id" : delete_id,
		},

		success : function(data) {
			window.location.reload();
		}
	});
	
}


function getPageContent(thisnavon,geturl,pagenum,thiselement,data_json){
	var result_wd;
	$.ajax({
		url:geturl+"?currentPage="+pagenum,
		dataType:"json",
		type:"post",
		data:data_json,
		timeout:1000,
		success:function(data){
			console.log(data);
			result_wd = data;
			if (data.t.hasOwnProperty("iPage")) {
				var thispagettl = data.t.iPage.pageTotal;
			}else{
				var thispagettl = data.t.pageTotal
			}
			pagechange(thisnavon,geturl,pagenum,thiselement,thispagettl);
		}
	});
	if(thiselement.is("#detailApage")){
		try{
		pushListContentA(result_wd);
		}catch(e){
			
		}
	}
	else if(thiselement.is("#detailBpage")){
		try{
			pushListContentB(result_wd);
		}catch(e){
				
		}
	}else{
		try{
			pushListContent(result_wd);
		}catch(e){
			
		}
	}
	
}

function pagechange(thisnavon,geturl,pagenum,thiselement,wholelength,data_json) {
	var html = "";
	html += '<a class="button ';
	if(pagenum == 1) {
		html += 'off_xk';
	}
	html += '" id_xk="homepage">首页</a>';
	html += '<a class="button ';
	if(pagenum == 1) {
		html += 'off_xk';
	}
	html += '" id_xk="prevpage">&lt;</a>';
	var minlength = Math.min(wholelength, 5);
	var pageorder = Math.max(Math.min(pagenum - 2, wholelength - 4), 1);
	for(var i = pageorder; i < pageorder + minlength; i++) {
		html += '<a class="button ';
		if(i == pagenum) {
			html += 'on_xk';
		};
		html += '" id_xk="num">' + i + '</a>';
	}
	html += '<a class="button ';
	if(pagenum == wholelength) {
		html += 'off_xk';
	}
	html += '" id_xk="nextpage">&gt;</a>';
	html += '<a class="button ';
	if(pagenum == wholelength) {
		html += 'off_xk';
	}
	html += '" id_xk="endpage">尾页</a>';
	// $(document).on("click", ".Yapage a.button:not('.off_xk'):not('.on_xk')", function() {
	$(thiselement).html(html).off("click").on("click", "a.button:not('.off_xk'):not('.on_xk')", function() {
		switch($(this).attr("id_xk")) {
			case "homepage":
				pagenum = 1;
				break;
			case "prevpage":
				pagenum--;
				break;
			case "nextpage":
				pagenum++;
				break;
			case "endpage":
				pagenum = wholelength;
				break;
			case "num":
				pagenum = $(this).text() * 1;
				break;
			default:
				break;
		};
		getPageContent(thisnavon,geturl,pagenum,thiselement,data_json);
		return;
	});
}
function exit(){
	$("#logout").click(function(){
		$.ajax({
			url:config.url+"account/exit",
			dataType:"json",
			type:"post",
			timeout:1000,
			success:function(data){
				if (data.success) {
					$.cookie("usertype",null);
					location.href="login.jsp";
				}
			}
		});
	});
}
//根据学校级别获取学校列表
function getAllSchoolByLevel() {
	data_json = {
		"levelId" : $("#report_schooltype option:selected").val(),
	}
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
			$("#report_schoolName").html(html);

		}
	})
};
// 获取全部疾病种类
function selectAllType() {
	$.ajax({
		url : config.url + "type/selectAllType",
		dataType : "json",
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			var html = "";
			html += "<option value=''>请选择</option>";
			if (data.success) {
				for (i in data.t) {
					html += "<option value='" + data.t[i].typeId + "'>" + data.t[i].typeName + "</option>";
				}
			}
			$("#report_infectiontype").html(html);

		}
	})
};
// 根据疾病种类获取疾病列表
function getAllByTypeId() {
	data_json = {
		"typeId" : $("#report_infectiontype option:selected").val(),
	}
	$.ajax({
		url : config.url + "infection/getAllByTypeId",
		data : data_json,
		dataType : "json",
		type : "post",
		timeout : 10000,
		success : function(data) {
			console.log(data);
			var html = "";
			html += "<option value=''>选择名称</option>";
			if (data.success) {
				for (i in data.obj) {
					html += "<option value='" + data.obj[i].infectionId + "'>" + data.obj[i].infectionName + "</option>";
				}
			}
			$("#report_infectionname").html(html);

		}
	})
};

/*根据出生日期算出年龄*/  
function jsGetAge(strBirthday){         
    var returnAge;  
    var strBirthdayArr=strBirthday.split("-");  
    var birthYear = strBirthdayArr[0];  
    var birthMonth = strBirthdayArr[1];  
    var birthDay = strBirthdayArr[2];  
      
    d = new Date();  
    var nowYear = d.getFullYear();  
    var nowMonth = d.getMonth() + 1;  
    var nowDay = d.getDate();  
      
    if(nowYear == birthYear){  
        returnAge = 0;//同年 则为0岁  
    }  
    else{  
        var ageDiff = nowYear - birthYear ; //年之差  
        if(ageDiff > 0){  
            if(nowMonth == birthMonth) {  
                var dayDiff = nowDay - birthDay;//日之差  
                if(dayDiff < 0)  
                {  
                    returnAge = ageDiff - 1;  
                }  
                else  
                {  
                    returnAge = ageDiff ;  
                }  
            }  
            else  
            {  
                var monthDiff = nowMonth - birthMonth;//月之差  
                if(monthDiff < 0)  
                {  
                    returnAge = ageDiff - 1;  
                }  
                else  
                {  
                    returnAge = ageDiff ;  
                }  
            }  
        }  
        else  
        {  
            returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天  
        }  
    }  
      
    return returnAge;//返回周岁年龄  
      
}  
