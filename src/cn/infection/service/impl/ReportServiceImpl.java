package cn.infection.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.InfectionReportDao;
import cn.infection.entity.InfectionReport;
import cn.infection.model.ChartsPage;
import cn.infection.model.LineChartParams;
import cn.infection.model.ReportPage;
import cn.infection.service.ReportService;
import cn.infection.utils.FormatDateUtils;
import cn.infection.utils.GetDateFormat;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private InfectionReportDao irDao;
	
	@Override
	public int insert(InfectionReport ir) {
		ir.setFillTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return irDao.insertSelective(ir);
	}

	@Override
	public int delete(String id) {
		return irDao.deleteByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public int update(InfectionReport ir) {
		return irDao.updateByPrimaryKeySelective(ir);
	}

	@Override
	public InfectionReport selectById(String id) {
		return irDao.selectByPrimaryKey(Integer.parseInt(id));
	}

	@Override
	public List<InfectionReport> getAllReport(ReportPage iPage) {
		return irDao.getAllReport(iPage);
	}

	@Override
	public int getAllCount(ReportPage iPage) {
		return irDao.getAllCount(iPage);
	}

	@Override
	public List<Map<String, Object>> getIndexData(ReportPage iPage) {
		
		return irDao.getIndexData(iPage);
	}

	@Override
	public int getIndexCount(ReportPage iPage) {
		return 0;
	}

	@Override
	public Map<String, Object> indexDate(ReportPage lPage) {
		//最终返回的map结果集
		Map<String, Object> map = new HashMap<String, Object>();
		//列表左侧数据
		List<Map<String, Object>> leftDate = irDao.getIndexData(lPage);
		//列表左侧记录数
		int leftCount = irDao.getIndexCount(lPage);

		//未上报学校
		int notSchoolCount = irDao.getNotSchoolCount(lPage);
		//传染病数量
		int infeCount = 0;
		//已上报学校
		int schoolCount = 0;
		try {
			infeCount = irDao.getInfectionCount(lPage);
			schoolCount = leftDate.size();
		} catch (Exception e) {
			
		}
		
		lPage.setTotalCount(leftCount);
		lPage.setList(leftDate);
		map.put("iPage", lPage);

		map.put("iPage", lPage);

		map.put("schoolCount", schoolCount);
		map.put("notSchoolCount", notSchoolCount);
		map.put("infeCount", infeCount);
		
		return map;
	}

	public Map<String, Object> otherDate(ReportPage rPage) {
		//最终返回的map结果集
		Map<String, Object> map = new HashMap<String, Object>();
		//列表右侧数据
		List<Map<String, Object>> rightDate = irDao.getOtherData(rPage);
		//列表右侧记录数
		int rightCount = irDao.getOtherCount(rPage);
		
		rPage.setTotalCount(rightCount);
		rPage.setList(rightDate);
		map.put("rPage", rPage);
		return map;
	}

	@Override
	public List<Map<String, Object>> getOtherData(ReportPage iPage) {
		return irDao.getOtherData(iPage);
	}

	@Override
	public int getOtherCount(ReportPage iPage) {
		return irDao.getOtherCount(iPage);
	}

	@Override
	public Map<String, Object> getChart(ChartsPage cPage) {
		//返回的结果集
		Map<String, Object> map = new HashMap<String, Object>();
		//存储的数据
		List<Object> list = new ArrayList<Object>();
		//发病数据
		List<Map<String, Object>> dataMap = irDao.getChartData(cPage);
		for (int i = 0; i < dataMap.size(); i++) {
				List<Object> lt = new ArrayList<Object>();
				lt.add(dataMap.get(i).get("infectionName").toString());
				lt.add(Integer.parseInt(dataMap.get(i).get("count").toString()));
				list.add(lt);
		}
		map.put("data", list);
		map.put("name", "分时间段统计图");
		map.put("type", "pie");
		
		return map;
	}

	@Override
	public Map<String, Object> getChartHis(ChartsPage cPage) {
		//返回的结果集
		Map<String, Object> map = new HashMap<String, Object>();
		//map数据
		Map<String, Object> mapData = new HashMap<String, Object>();
		//x轴
		List<Object> list = new ArrayList<Object>();
		//数据
		List<Object> listData = new ArrayList<Object>();
		//发病数据
		List<Map<String, Object>> dataMap = irDao.getChartData(cPage);
		for (int i = 0; i < dataMap.size(); i++) {
			//List<Object> lt = new ArrayList<Object>();
			//lt.add(dataMap.get(i).get("infectionName").toString());
			//lt.add(Integer.parseInt(dataMap.get(i).get("count").toString()));
			list.add(dataMap.get(i).get("infectionName").toString());
		}
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < dataMap.size(); j++) {
				if (list.get(i).equals(dataMap.get(j).get("infectionName").toString())) {
					listData.add(Integer.parseInt(dataMap.get(i).get("count").toString()));
				}
			}
		}
		mapData.put("name", "发病数");
		mapData.put("data", listData);
		map.put("data", mapData);
		map.put("xAxis", list);
		return map;
	}

	@Override
	public List<String> getSchoolIdByCond(ChartsPage cPage) {
		List<Map<String, Object>> listData = irDao.getSchoolIdByCond(cPage);
		List<String> list = new ArrayList<String>();
		for (Map<String, Object> map : listData) {
			list.add(map.get("schoolId").toString());
		}
		return list;
	}

	@Override
	public Map<String, Object> getLineChart(LineChartParams lcParams) throws ParseException {
		//最外层map集合
		Map<String, Object> mapAll = new HashMap<String, Object>();
		//折线对比图的数据
		List listData = new ArrayList();
		
		int startYear = Integer.parseInt(lcParams.getStartYear());
		int endYear = Integer.parseInt(lcParams.getEndYear());
		String month = lcParams.getMonth();
		
		//各个年份的数据集合
		List<Object> data = new ArrayList<Object>();
		for (int i = startYear; i <= endYear; i++) {
			if (month != null && !month.equals("")) {
				lcParams.setYear(i + "-" + month + "-01");
			} else {
				lcParams.setYear(i + "-01-01");
			}
			//lcParams.setYear(String.valueOf(i));
			//接收SQL数据集合
			List<Map<String, Object>> list = irDao.getLineChart(lcParams);
			data.add(list);
		}
		
		//X轴
		List<String> xDate = new GetDateFormat().getXDate(lcParams.getStartYear(), lcParams.getEndYear(), month);
		//时间集合
		List<Object> listDate = new GetDateFormat().getDateList(lcParams.getStartYear(), lcParams.getEndYear(), month);
		
		//共几年
		int timeScope = endYear - startYear;
		int j = 0;
		for (int i = startYear; i <= endYear; i++) {
			//处理后的每年数据
			Map<String, Object> oneMap = new HashMap<String, Object>();
			if (month != null && !month.equals("")) {
				oneMap.put("name", i + "-" + month);
			} else {
				oneMap.put("name", i + "年");
			}
			
			//每年的时间集合
			List<String> oneList = (List<String>) listDate.get(j);
			//每年的数据集合
			List<Map<String, Object>> oneData = (List<Map<String, Object>>) data.get(j);
			//处理后存放每年的数据的集合
			List lt = new ArrayList();
			for (int m = 0; m < oneList.size(); m++) {
				lt.add(0);
				for (int k = 0; k < oneData.size(); k++) {
					if ((oneData.get(k).get("fillTime").toString()).equals(oneList.get(m).toString())) {
						lt.set(m, oneData.get(k).get("count"));
					}
				}
			}
			oneMap.put("data", lt);
			listData.add(oneMap);
			j++;
		}
		
		mapAll.put("xAxis", xDate);
		mapAll.put("data", listData);
		
		return mapAll;
	}

	@Override
	public InfectionReport selectReportById(String id) {
		return irDao.selectReportById(Integer.parseInt(id));
	}

	@Override
	public List<Map<String,Object>> getReportBySchoolId(ReportPage iPage) {
		return irDao.getReportBySchoolId(iPage);
	}

	@Override
	public int getReportCountBySchoolId(ReportPage iPage) {
		return irDao.getReportCountBySchoolId(iPage);
	}

	@Override
	public List<Map<String, Object>> getReportDetail(ReportPage iPage) {
		return irDao.getReportDetail(iPage);
	}

	@Override
	public int getReportDetailCount(ReportPage iPage) {
		return irDao.getReportDetailCount(iPage);
	}

	@Override
	public int getNowReportBySchoolId(int schoolId) {
		int count = 0;
//		try {
			count = irDao.getNowReportBySchoolId(schoolId);
//		} catch (Exception e) {
//			
//		}
		return count;
	}

	@Override
	public int restore(InfectionReport ir) {
		int state=0;
		try {
			Integer insulateTime=irDao.selectInsulateTimeByReportId(ir.getCardId());
			String onsetTime=irDao.selectonsetTimeByReportId(ir.getCardId());
			if(onsetTime!=null||onsetTime.trim().length()>0){
				Date onsetTimeDate=FormatDateUtils.stringToDate(onsetTime);
				Date now=new Date();
				
				long start=onsetTimeDate.getTime();
				long end=now.getTime();
				long days =(end-start) / (1000 * 60 * 60 * 24); 
				if(days>=insulateTime){
					irDao.updateByPrimaryKeySelective(ir);
					//完全正常的情况下，返回2
					state= 2;
				}else{
					//没有达到时间限制，返回1
					state= 1;
				}
			}
		} catch (Exception e) {
			
		}	
		return state;
	}

}
