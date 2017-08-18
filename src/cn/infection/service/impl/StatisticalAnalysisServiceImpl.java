package cn.infection.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.infection.dao.StatisticalAnalysisDao;
import cn.infection.model.StatisticsPage;
import cn.infection.service.StatisticalAnalysisService;

@Service
public class StatisticalAnalysisServiceImpl implements StatisticalAnalysisService {
	@Autowired
	private StatisticalAnalysisDao statisticalAnalysisDao;

	@Override
	public List<Map<String, Object>> getStatisticsDeathByAge(StatisticsPage statisticsPage) {
		List<Map<String, Object>> list = statisticalAnalysisDao.getStatisticsDeathByAge(statisticsPage);
		List<Map<String, Object>> li = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> map : list) {
			if (map.get("sex").toString().contains("0")) {
				map.put("boyCount", map.get("count"));
				map.put("girlCount", 0);
			} else {
				map.put("boyCount", 0);
				map.put("girlCount", map.get("count"));
			}
			map.put("sexCount", Integer.parseInt(map.get("boyCount").toString()) + Integer.parseInt(map.get("girlCount").toString()));
			li.add(map);
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> getStatisticsMorbidityByAge(StatisticsPage statisticsPage) {
		List<Map<String, Object>> list = statisticalAnalysisDao.getStatisticsMorbidityByAge(statisticsPage);
		List<Map<String, Object>> li = new ArrayList<Map<String, Object>>();
		for (Map<String, Object> map : list) {
			if (map.get("sex").toString().contains("0")) {
				map.put("boyCount", map.get("count"));
				map.put("girlCount", 0);
			} else {
				map.put("boyCount", 0);
				map.put("girlCount", map.get("count"));
			}
			map.put("sexCount", Integer.parseInt(map.get("boyCount").toString()) + Integer.parseInt(map.get("girlCount").toString()));
			li.add(map);
		}
		return list;
	}

	@Override
	public int getStatisticsByAgeCount(StatisticsPage statisticsPage) {
		return statisticalAnalysisDao.getStatisticsByAgeCount(statisticsPage);
	}

	@Override
	public List<Map<String, Object>> getStatisticsDeathBySchool(StatisticsPage statisticsPage) {
		List<Map<String, Object>> list = statisticalAnalysisDao.getStatisticsDeathBySchool(statisticsPage);
		return list;
	}

	@Override
	public List<Map<String, Object>> getStatisticsMorbidityBySchool(StatisticsPage statisticsPage) {
		List<Map<String, Object>> list = statisticalAnalysisDao.getStatisticsMorbidityBySchool(statisticsPage);
		return list;
	}

	@Override
	public int getStatisticsBySchoolCount(StatisticsPage statisticsPage) {
		return statisticalAnalysisDao.getStatisticsBySchoolCount(statisticsPage);
	}

	@Override
	public List<Map<String, Object>> getDataByAge(StatisticsPage statisticsPage) {
		return statisticalAnalysisDao.getDataByAge(statisticsPage);
	}

	@Override
	public List<Map<String, Object>> getDataBySchool(
			StatisticsPage statisticsPage) {
		return statisticalAnalysisDao.getDataBySchool(statisticsPage);
	}

}
