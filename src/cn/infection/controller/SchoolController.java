package cn.infection.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.infection.entity.Infection;
import cn.infection.entity.InfectionSchool;
import cn.infection.entity.InfectionType;
import cn.infection.model.InfectionPage;
import cn.infection.model.SchoolPage;
import cn.infection.service.SchoolService;
import cn.infection.utils.PageBean;
import cn.infection.utils.ResponseModel;

@Controller
@RequestMapping("/school")
public class SchoolController {

	@Autowired
	private SchoolService sService;
	
	/**
	 * 新增学校
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(InfectionSchool is, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			int schoolId=sService.insert(is);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(schoolId);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据id删除学校
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("delete")
	public ResponseModel deleteByPrimaryKey(String id, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			sService.delete(id);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 更新学校
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel updateByPrimaryKeySelective(InfectionSchool is, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			sService.update(is);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据id查询学校
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("selectById")
	public ResponseModel selectByPrimaryKey(String schoolId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			InfectionSchool is = sService.selectById(schoolId);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(is);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据条件分页查询学校
	 * @param iPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllSchool")
	public ResponseModel getAllSchool(SchoolPage sPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			List<InfectionSchool> list = sService.getAllSchool(sPage);
			sPage.setCurrentPage(PageBean.getCurrentPage(req));
			sPage.setUrl(PageBean.getUrl(req));
			sPage.setPageTotal(PageBean.getPageCount(req));
			sPage.setTotalCount(sService.getAllCount(sPage));
			sPage.setList(list);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(sPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 获取全部级别
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllLevel")
	public ResponseModel getAllLevel(){
		ResponseModel rm = new ResponseModel();
		try {
			List<InfectionSchool> list = sService.getAllLevel();
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(list);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 根据办学级别查询所有的学校
	 * 
	 * @param levelId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllSchoolByLevel")
	public ResponseModel getAllSchoolByLevel(String levelId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			rm.setObj(sService.getAllSchoolByLevel(levelId));
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
}