package cn.infection.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.infection.entity.InfectionAccount;
import cn.infection.model.StatisticsPage;
import cn.infection.service.StatisticalAnalysisService;
import cn.infection.utils.PageBean;
import cn.infection.utils.ResponseModel;

/**
 * 统计分析
 */

@Controller
@RequestMapping("/statistical")
public class StatisticalAnalysisController {
	@Autowired
	private StatisticalAnalysisService statisticalAnalysisService;

	/**
	 * 统计分析-按年龄统计(包括实时统计)
	 * 
	 * @param statisticsPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getStatisticsByAge")
	public ResponseModel getStatisticsByAge(StatisticsPage statisticsPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 0) {
				statisticsPage.setSchoolId(account.getSchoolId());
			}
			
			// 死亡人数
//			List<Map<String, Object>> deathlist = statisticalAnalysisService.getStatisticsDeathByAge(statisticsPage);
//			// 发病人数
//			List<Map<String, Object>> morbiditylist = statisticalAnalysisService.getStatisticsMorbidityByAge(statisticsPage);
			List<Map<String, Object>> totalList = statisticalAnalysisService.getDataByAge(statisticsPage);
			List<Object> list = new ArrayList<Object>();
//			list.add(deathlist);
//			list.add(morbiditylist);
			statisticsPage.setCurrentPage(PageBean.getCurrentPage(req));
			statisticsPage.setUrl(PageBean.getUrl(req));
			statisticsPage.setPageTotal(PageBean.getPageCount(req));
			statisticsPage.setTotalCount(statisticalAnalysisService.getStatisticsByAgeCount(statisticsPage));
			statisticsPage.setList(totalList);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(statisticsPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 统计分析-按学校统计(包括实时统计)
	 * 
	 * @param statisticsPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getStatisticsBySchool")
	public ResponseModel getStatisticsBySchool(StatisticsPage statisticsPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 0) {
				statisticsPage.setSchoolId(account.getSchoolId());
			}
			
			// 死亡人数
//			List<Map<String, Object>> deathlist = statisticalAnalysisService.getStatisticsDeathBySchool(statisticsPage);
//			// 发病人数
//			List<Map<String, Object>> morbiditylist = statisticalAnalysisService.getStatisticsMorbidityBySchool(statisticsPage);
			List<Map<String, Object>> listTotal = statisticalAnalysisService.getDataBySchool(statisticsPage);
//			List<Object> list = new ArrayList<Object>();
//			list.add(deathlist);
//			list.add(morbiditylist);
			statisticsPage.setCurrentPage(PageBean.getCurrentPage(req));
			statisticsPage.setUrl(PageBean.getUrl(req));
			statisticsPage.setPageTotal(PageBean.getPageCount(req));
			statisticsPage.setTotalCount(statisticalAnalysisService.getStatisticsBySchoolCount(statisticsPage));
			statisticsPage.setList(listTotal);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(statisticsPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
}
