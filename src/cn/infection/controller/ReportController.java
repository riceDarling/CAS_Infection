package cn.infection.controller;

import java.util.HashMap;
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
import cn.infection.entity.InfectionReport;
import cn.infection.entity.InfectionReportTracking;
import cn.infection.model.ChartsPage;
import cn.infection.model.LineChartParams;
import cn.infection.model.ReportPage;
import cn.infection.service.InfectionReportTrackingService;
import cn.infection.service.ReportService;
import cn.infection.utils.FormatDateUtils;
import cn.infection.utils.PageBean;
import cn.infection.utils.ResponseModel;

/**
 * 报告
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService rService;
	
	@Autowired
	private InfectionReportTrackingService irtService;

	/**
	 * 新增报告
	 * 
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(InfectionReport ir, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			if (ir.getSchoolId() == null) {
				Subject subject = SecurityUtils.getSubject();
				InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
				ir.setSchoolId(account.getSchoolId());
			}

			// it.setTypename("测试111");
			rService.insert(ir);

			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	@ResponseBody
	@RequestMapping("insertTracking")
	public ResponseModel insertTracking(InfectionReportTracking irt, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			irt.setTrackingpeoplename(account.getNickname());
			irt.setTrackingtime(FormatDateUtils.getDate(5));
			irtService.insert(irt);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	
	/**
	 * 根据id删除报告
	 * 
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("delete")
	public ResponseModel deleteByPrimaryKey(String id, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			InfectionReport ir = new InfectionReport();
			ir.setCardId(Integer.parseInt(id));
			ir.setIsDel(1);

			rService.update(ir);
			// rService.delete(id);

			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 更新报告
	 * 
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel updateByPrimaryKeySelective(InfectionReport ir, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			rService.update(ir);

			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 结案
	 * 
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("end")
	public ResponseModel end(InfectionReport ir, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			rService.update(ir);

			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 复课
	 * 
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("restore")
	public ResponseModel restore(InfectionReport ir, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			int state=rService.restore(ir);
			switch (state) {
			case 2:
				rm.setMsg("成功");
				rm.setSuccess(true);
				break;
			case 1:
				rm.setMsg("未超过规定停课时间，复课失败");
				rm.setSuccess(true);
				break;
			default:
				break;
			}
			
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据id查询报告
	 * 
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("selectById")
	public ResponseModel selectByPrimaryKey(String cardId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			InfectionReport ir = rService.selectById(cardId);

			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(ir);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 查询报告卡的详细信息（包含历史追踪）
	 * @param cardId
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectReportById")
	public ResponseModel selectReportById(String cardId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			InfectionReport ir = rService.selectReportById(cardId);
			List<InfectionReportTracking> tracking=irtService.getInfectionReportTrackings(Integer.parseInt(cardId));
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("ir", ir);
			map.put("irt", tracking);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(map);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 根据条件分页查询报告
	 * 
	 * @param iPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllReport")
	public ResponseModel getAllReport(ReportPage iPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 0) {
				iPage.setSchoolId(account.getSchoolId());
			}

			List<InfectionReport> list = rService.getAllReport(iPage);
			iPage.setCurrentPage(PageBean.getCurrentPage(req));
			iPage.setUrl(PageBean.getUrl(req));
			iPage.setPageTotal(PageBean.getPageCount(req));
			iPage.setTotalCount(rService.getAllCount(iPage));
			iPage.setList(list);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(iPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 首页左侧数据
	 * 
	 * @param iPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getIndexDate")
	public ResponseModel getIndexDate(ReportPage iPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Map<String, Object> map = rService.indexDate(iPage);
			iPage.setCurrentPage(PageBean.getCurrentPage(req));
			iPage.setUrl(PageBean.getUrl(req));
			iPage.setPageTotal(PageBean.getPageCount(req));
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(map);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 首页右侧数据
	 * 
	 * @param iPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getOtherDate")
	public ResponseModel getOtherDate(ReportPage iPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<Map<String, Object>> list = rService.getOtherData(iPage);
			iPage.setCurrentPage(PageBean.getCurrentPage(req));
			iPage.setUrl(PageBean.getUrl(req));
			iPage.setPageTotal(PageBean.getPageCount(req));
			iPage.setTotalCount(rService.getOtherCount(iPage));
			iPage.setList(list);

			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(iPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 饼状图统计图
	 * 
	 * @param cPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getChart")
	public ResponseModel getChart(ChartsPage cPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 0) {
				cPage.setSchoolId(account.getSchoolId());
			}
			
			Map<String, Object> map = rService.getChart(cPage);

			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(map);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 柱状图统计图
	 * 
	 * @param cPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getChartHis")
	public ResponseModel getChartHis(ChartsPage cPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 0) {
				cPage.setSchoolId(account.getSchoolId());
			}
			
			Map<String, Object> map = rService.getChartHis(cPage);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(map);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 一键通知的全部学校
	 * 
	 * @param cPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getSchoolIdByCond")
	public ResponseModel getSchoolIdByCond(ChartsPage cPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<String> list = rService.getSchoolIdByCond(cPage);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(list);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 年月同期对比折线图
	 * 
	 * @param lcParams
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getLineChart")
	public ResponseModel getLineChart(LineChartParams lcParams, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 0) {
				lcParams.setSchoolId(String.valueOf(account.getSchoolId()));
			}
			
			Map<String, Object> map = rService.getLineChart(lcParams);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(map);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据学校获取详细信息
	 * 
	 * @param lcParams
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getReportBySchoolId")
	public ResponseModel getReportBySchoolId(ReportPage iPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<Map<String,Object>> list = rService.getReportBySchoolId(iPage);
			iPage.setCurrentPage(PageBean.getCurrentPage(req));
			iPage.setUrl(PageBean.getUrl(req));
			iPage.setPageTotal(PageBean.getPageCount(req));
			iPage.setTotalCount(rService.getReportCountBySchoolId(iPage));
			iPage.setList(list);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(iPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据学校和疾病获取详细信息
	 * 
	 * @param lcParams
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getReportDetail")
	public ResponseModel getReportDetail(ReportPage iPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<Map<String,Object>> list = rService.getReportDetail(iPage);
			iPage.setCurrentPage(PageBean.getCurrentPage(req));
			iPage.setUrl(PageBean.getUrl(req));
			iPage.setPageTotal(PageBean.getPageCount(req));
			iPage.setTotalCount(rService.getReportDetailCount(iPage));
			iPage.setList(list);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(iPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据学校和疾病获取详细信息
	 * 
	 * @param lcParams
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getNowReportBySchoolId")
	public ResponseModel getNowReportBySchoolId(HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		Subject subject = SecurityUtils.getSubject();
		InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
		try {
			int count = rService.getNowReportBySchoolId(account.getSchoolId());
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(count);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
}
