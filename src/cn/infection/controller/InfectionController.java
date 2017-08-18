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
import cn.infection.service.InfectionService;
import cn.infection.service.SchoolService;
import cn.infection.utils.PageBean;
import cn.infection.utils.ResponseModel;

/**
 * 传染病
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/infection")
public class InfectionController {

	@Autowired
	private InfectionService inService;
	
	/**
	 * 新增传染病
	 * @param infec
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(Infection infec, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
//			it.setTypename("测试111");
			inService.insert(infec);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据id删除传染病
	 * @param id
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete")
	public ResponseModel deleteByPrimaryKey(String id, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			inService.delete(id);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 更新传染病
	 * @param infec
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel updateByPrimaryKeySelective(Infection infec, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			inService.update(infec);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据id查询传染病
	 * @param id
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectById")
	public ResponseModel selectByPrimaryKey(String infectionId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			Infection infec = inService.selectById(infectionId);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(infec);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据条件分页查询传染病
	 * @param iPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllInfection")
	public ResponseModel getAllInfection(InfectionPage iPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			List<Infection> list = inService.getAllInfection(iPage);
			iPage.setCurrentPage(PageBean.getCurrentPage(req));
			iPage.setUrl(PageBean.getUrl(req));
			iPage.setPageTotal(PageBean.getPageCount(req));
			iPage.setTotalCount(inService.getAllCount(iPage));
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
	 * 根据种类查询全部的病种
	 * 
	 * @param typeId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllByTypeId")
	public ResponseModel getAllByTypeId(String typeId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setObj(inService.getAllByTypeId(typeId));
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
}
