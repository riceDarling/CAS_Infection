package cn.infection.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.infection.entity.InfectionAccount;
import cn.infection.entity.Notices;
import cn.infection.model.NoticesPage;
import cn.infection.service.NoticesService;
import cn.infection.utils.PageBean;
import cn.infection.utils.ResponseModel;

@Controller
@RequestMapping("/notices")
public class NoticesController {

	@Autowired
	private NoticesService nServices;
	
	/**
	 * 新增通知
	 * @param notices
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insert(Notices notices, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			nServices.insert(notices);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 一键通知
	 * @param notices
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("oneNotices")
	public ResponseModel oneNotices(@RequestParam(required = false, value = "schoolId[]") String[] schoolId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<String> list = Arrays.asList(schoolId);
			
			nServices.oneNotices(list);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 将通知标记为已读（单条）
	 * @param notices
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel update(Notices notices, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			notices.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(notices.getCreateTime()));
			nServices.update(notices);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 全部标记为已读（当前登录人）
	 * @param notices
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updateAll")
	public ResponseModel updateAll(Notices notices, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			notices.setSchoolId(((InfectionAccount)SecurityUtils.getSubject().getSession().getAttribute("loginAccount")).getSchoolId());
			nServices.updateAll(notices);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据学校查询当日未读通知
	 * @param schoolId
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectByAdmin")
	public ResponseModel selectByAdmin(NoticesPage nPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			InfectionAccount ia = (InfectionAccount)SecurityUtils.getSubject().getSession().getAttribute("loginAccount");
			int id = ia.getSchoolId();
			nPage.setSchoolId(Integer.valueOf(id));
			List<Notices> list = nServices.selectByCond(nPage);
			nPage.setCurrentPage(PageBean.getCurrentPage(req));
			nPage.setUrl(PageBean.getUrl(req));
			nPage.setPageTotal(PageBean.getPageCount(req));
			nPage.setTotalCount(nServices.getCountByCond(nPage));
			nPage.setList(list);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(nPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
}
