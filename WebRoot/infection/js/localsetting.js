//	getURL = "http://192.168.3.16:8020/CRB/"
//	getURL = "http://192.168.0.200:8080/infection/"
//getURL = "http://localhost:8080/Infection/infection/"
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
config = {
		url: "http://"+service_ip+":8080/Infection/"
}
getURL = "http://"+service_ip+":8080/Infection/infection/"
$.ajaxSetup({
	async:false
})