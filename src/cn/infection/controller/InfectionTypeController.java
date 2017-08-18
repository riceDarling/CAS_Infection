package cn.infection.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.infection.entity.InfectionType;
import cn.infection.model.TypePage;
import cn.infection.service.InfectionTypeService;
import cn.infection.utils.PageBean;
import cn.infection.utils.ResponseModel;

/**
 * 类型
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/type")
public class InfectionTypeController {

	@Autowired
	private InfectionTypeService itService;
	
	/**
	 * 新增类型
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(InfectionType it, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
//			it.setTypename("测试111");
			itService.insertSelective(it);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据typeid删除类型
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("delete")
	public ResponseModel deleteByPrimaryKey(String id, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			itService.deleteByPrimaryKey(Integer.parseInt(id));
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 更新类型
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel updateByPrimaryKeySelective(InfectionType it, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			itService.updateByPrimaryKeySelective(it);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据typeid查询类型
	 * @param it
	 */
	@ResponseBody
	@RequestMapping("selectById")
	public ResponseModel selectByPrimaryKey(String typeId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			InfectionType it = itService.selectByPrimaryKey(Integer.parseInt(typeId));
			
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(it);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 根据条件分页查询传染病类型
	 * @param tPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getAllType")
	public ResponseModel getAllType(TypePage tPage, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			List<InfectionType> list = itService.getAllType(tPage);
			tPage.setCurrentPage(PageBean.getCurrentPage(req));
			tPage.setUrl(PageBean.getUrl(req));
			tPage.setPageTotal(PageBean.getPageCount(req));
			tPage.setTotalCount(itService.getAllCount(tPage));
			tPage.setList(list);
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(tPage);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 获取全部类型
	 * @param tPage
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectAllType")
	public ResponseModel selectAllType(HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			
			List<InfectionType> list = itService.selectAllType();
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(list);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
}
