package cn.infection.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import cn.infection.entity.InfectionReport;
import cn.infection.model.ChartsPage;
import cn.infection.model.LineChartParams;
import cn.infection.model.ReportPage;

public interface ReportService {

	/**
	 * 新增报告
	 * @param is
	 * @return
	 */
	int insert(InfectionReport ir);
	
	/**
	 * 根据ID删除报告
	 * @param is
	 * @return
	 */
	int delete(String id);
	
	/**
	 * 更新报告
	 * @param is
	 * @return
	 */
	int update(InfectionReport ir);
	
	/**
	 * 根据id查询一个报告
	 * @param is
	 * @return
	 */
	InfectionReport selectById(String id);
	
	InfectionReport selectReportById(String id);

	/**
	 * 根据条件分页查询报告
	 * @param iPage
	 * @return
	 */
	List<InfectionReport> getAllReport(ReportPage iPage);

	/**
	 * 根据条件分页查询报告记录数
	 * @param iPage
	 * @return
	 */
	int getAllCount(ReportPage iPage);
	
	/**
	 * 根据条件获取首页数据
	 * @param iPage
	 * @return
	 */
	List<Map<String,Object>> getIndexData(ReportPage iPage);
	
	/**
	 * 根据条件获取首页数据记录数
	 * @param iPage
	 * @return
	 */
	int getIndexCount(ReportPage iPage);
	
	/**
	 * 首页左侧数据
	 * @param lPage
	 * @return
	 */
	Map<String,Object> indexDate(ReportPage lPage);
	
	/**
	 * 首页右侧数据
	 * @param rPage
	 * @return
	 */
	List<Map<String,Object>> getOtherData(ReportPage iPage);
	
	/**
	 * 首页右侧数据记录数
	 * @param rPage
	 * @return
	 */
	int getOtherCount(ReportPage iPage);
	
	/**
	 * 饼状图统计图数据
	 * @param cPage
	 * @return
	 */
	Map<String, Object> getChart(ChartsPage cPage);
	
	/**
	 * 柱状图统计图数据
	 * @param cPage
	 * @return
	 */
	Map<String, Object> getChartHis(ChartsPage cPage);

	/**
	 * 一键通知的全部学校
	 * @param cPage
	 * @return
	 */
	List<String> getSchoolIdByCond(ChartsPage cPage);
	
	/**
	 * 折线对比图
	 * @return
	 * @throws ParseException 
	 */
	Map<String, Object> getLineChart(LineChartParams lcParams) throws ParseException;

	/**
	 * 根据学校获取详细信息Data
	 * @param iPage
	 * @return
	 */
	List<Map<String,Object>> getReportBySchoolId(ReportPage iPage);

	/**
	 * 根据学校获取详细信息Count
	 * @param iPage
	 * @return
	 */
	int getReportCountBySchoolId(ReportPage iPage);

	/**
	 * 根据学校和疾病获取详细信息Data
	 * @param iPage
	 * @return
	 */
	List<Map<String,Object>> getReportDetail(ReportPage iPage);
	
	/**
	 * 根据学校和疾病获取详细信息Count
	 * @param iPage
	 * @return
	 */
	int getReportDetailCount(ReportPage iPage);
	
	/**
	 * 根据学校查询当日上报数量
	 * @param schoolId
	 * @return
	 */
	int getNowReportBySchoolId(int schoolId);
	

	/**
	 * 复课
	 * @param is
	 * @return
	 */
	int restore(InfectionReport ir);
}
