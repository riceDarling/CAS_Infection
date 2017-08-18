package cn.infection.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GetDateFormat {
	
	/**
	 * X轴
	 * @param month
	 * @return
	 * @throws ParseException 
	 */
	public static List<String> getXDate(String startYear, String endYear, String month) throws ParseException{
		//格式化
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); 
		//x轴
		List<String> list = new ArrayList<String>();
		//时间拼接
		String dt = "";
		//最大月份长度
		int maxDate = 0;
		int thisDate = 0;
		Date cDate = null;
		int sy = Integer.parseInt(startYear);
		int ey = Integer.parseInt(endYear);
		if (month != null && !month.equals("")) {
			for (int i = sy; i <= ey; i++) {
				dt = i + "-" + month + "-01";
				cal.setTime(sdf.parse(dt));  
				//获取此月长度
				thisDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				//取最大月份长度
				if (thisDate > maxDate) {
					maxDate = thisDate;
					cDate = cal.getTime();
				}
			}
			cal.setTime(cDate);
			//格式化
			SimpleDateFormat sDate = new SimpleDateFormat("MM-dd");
			for (int i = 0; i < maxDate; i++) {
				list.add(sDate.format(cal.getTime()));
				cal.add(Calendar.DATE, 1);
			}
		} else {
			for (int i = 1; i < 13; i++) {
					list.add(i + "月");
			}
		}
		
		return list;
	}
	
	/**
	 * 获取对比年的全部年的时间集合
	 * @param startYear
	 * @param endYear
	 * @param month
	 * @return
	 * @throws ParseException 
	 */
	public static List<Object> getDateList(String startYear, String endYear, String month) throws ParseException{
		//格式化
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); 
		//x轴
		List<Object> list = new ArrayList<Object>();
		//时间拼接
		String dt = "";
		//最大月份长度
		int maxDate = 0;
		int thisDate = 0;
		Date cDate = null;
		int sy = Integer.parseInt(startYear);
		int ey = Integer.parseInt(endYear);
		if (month != null && !month.equals("")) {
			
			for (int i = sy; i <= ey; i++) {
				//Map<String, Object> map = new HashMap<String, Object>();
				dt = i + "-" + month + "-01";
				cal.setTime(sdf.parse(dt));  
				thisDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				List<String> listYear = new ArrayList<String>();
				for (int j = 0; j < thisDate; j++) {
					listYear.add(sdf.format(cal.getTime()));
					cal.add(Calendar.DATE, 1);
				}
				//map.put(String.valueOf(i), listYear);
				list.add(listYear);
			}
		} else {
			for (int i = sy; i <= ey; i++) {
				List<String> listYear = new ArrayList<String>();
				for (int j = 1; j < 13; j++) {
					if (j < 10) {
						listYear.add(i + "-0" + j);
					} else {
						listYear.add(i + "-" + j);
					}
				}
				list.add(listYear);
			}
		}
		
		return list;
	}
	
	public static void main(String[] args) throws ParseException {
		String startYear = "2011";
		String endYear = "2017";
		String month = "02";
		List<Object> list = (List<Object>) getDateList(startYear,endYear,month).get(1);
		System.out.println(list);
		//System.out.println(getXDate(startYear,endYear,month));
	}
}
