package cn.infection.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.infection.entity.InfectionReport;
import cn.infection.model.ChartsPage;
import cn.infection.model.LineChartParams;
import cn.infection.model.ReportPage;


public interface InfectionReportDao {
    int deleteByPrimaryKey(Integer cardId);

    int insert(InfectionReport record);

    int insertSelective(InfectionReport record);

    InfectionReport selectByPrimaryKey(Integer cardId);

    int updateByPrimaryKeySelective(InfectionReport record);

    int updateByPrimaryKeyWithBLOBs(InfectionReport record);

    int updateByPrimaryKey(InfectionReport record);

	List<InfectionReport> getAllReport(ReportPage iPage);

	int getAllCount(ReportPage iPage);
	
	List<Map<String,Object>> getIndexData(ReportPage iPage);
	
	int getIndexCount(ReportPage iPage);
	
	List<Map<String,Object>> getOtherData(ReportPage iPage);
	
	int getOtherCount(ReportPage iPage);
	
	int getInfectionCount(ReportPage iPage);
	
	int getNotSchoolCount(ReportPage iPage);
	
	List<Map<String, Object>> getChartData(ChartsPage cPage);

	List<Map<String, Object>> getChartCount(ChartsPage cPage);
	
	List<Map<String, Object>> getSchoolIdByCond(ChartsPage cPage);
	
	List<Map<String, Object>> getLineChart(LineChartParams lcParams);
	
	InfectionReport selectReportById(Integer cardId);
	
	List<Map<String,Object>> getReportBySchoolId(ReportPage iPage);
	
	int getReportCountBySchoolId(ReportPage iPage);

	List<Map<String,Object>> getReportDetail(ReportPage iPage);
	
	int getReportDetailCount(ReportPage iPage);
	
	int getNowReportBySchoolId(@Param("schoolId") int schoolId);
	/**
	 * 根据报告卡id，查询疾病所需停课时间
	 * @param cardId
	 * @return
	 */
	Integer selectInsulateTimeByReportId(Integer cardId);
	/**
	 * 获取发病日期
	 * @param cardId
	 * @return
	 */
	String selectonsetTimeByReportId(Integer cardId);
}