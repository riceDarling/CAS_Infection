package cn.infection.service;

import java.util.List;
import java.util.Map;

import cn.infection.model.StatisticsPage;

public interface StatisticalAnalysisService {
	/**
	 * 统计分析-按年龄统计-死亡人数
	 * 
	 * @param statisticsPage
	 * @return
	 */
	List<Map<String, Object>> getStatisticsDeathByAge(StatisticsPage statisticsPage);
	/**
	 * 统计分析-按年龄统计-发病人数
	 * 
	 * @param statisticsPage
	 * @return
	 */
	List<Map<String, Object>> getStatisticsMorbidityByAge(StatisticsPage statisticsPage);
	/**
	 * 统计分析-按年龄统计
	 * 
	 * @param statisticsPage
	 * @return
	 */
	List<Map<String, Object>> getDataByAge(StatisticsPage statisticsPage);
	/**
	 * 统计分析-按学校统计
	 * 
	 * @param statisticsPage
	 * @return
	 */
	List<Map<String, Object>> getDataBySchool(StatisticsPage statisticsPage);
	/**
	 * 统计分析-按年龄统计总数
	 * 
	 * @param statisticsPage
	 * @return
	 */
	int getStatisticsByAgeCount(StatisticsPage statisticsPage);
	
	/**
	 * 统计分析-按学校统计-死亡人数
	 * 
	 * @param statisticsPage
	 * @return
	 */
	List<Map<String, Object>> getStatisticsDeathBySchool(StatisticsPage statisticsPage);
	/**
	 * 统计分析-按学校统计-发病人数
	 * 
	 * @param statisticsPage
	 * @return
	 */
	List<Map<String, Object>> getStatisticsMorbidityBySchool(StatisticsPage statisticsPage);
	/**
	 * 统计分析-按学校统计总数
	 * 
	 * @param statisticsPage
	 * @return
	 */
	int getStatisticsBySchoolCount(StatisticsPage statisticsPage);
}