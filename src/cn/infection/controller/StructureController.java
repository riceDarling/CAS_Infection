package cn.infection.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.infection.entity.InfectionAccount;
import cn.infection.entity.InfectionStructure;
import cn.infection.service.InfectionStructureService;
import cn.infection.utils.ResponseModel;

@Controller
@RequestMapping("/structure")
public class StructureController {

	@Autowired
	private InfectionStructureService isService;

	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(InfectionStructure is, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			isService.insert(is);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel update(InfectionStructure is, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			isService.update(is);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	@ResponseBody
	@RequestMapping("selectBySchoolId")
	public ResponseModel selectBySchoolId(Integer schoolId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			if(schoolId==null){
				Subject subject = SecurityUtils.getSubject();
				InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
				schoolId=account.getSchoolId();
			}
			rm.setObj(isService.selectBySchoolId(schoolId));
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	@ResponseBody
	@RequestMapping("selectById")
	public ResponseModel selectById(Integer id, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			isService.selectById(id);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	/**
	 * 根据当前用户，获取当前用户是否填写了管理架构
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectBySchoolIdNum")
	public ResponseModel selectBySchoolIdNum(HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			Integer num=0;
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if(account.getLevel()==0){
				num=isService.selectBySchoolIdNum(account.getSchoolId());
			}
			if(num>0){
				rm.setT(true);
			}else{
				rm.setT(false);
			}
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	@ResponseBody
	@RequestMapping("insertS")
	public ResponseModel insertSelectiveS(String data, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<InfectionStructure> list=JSON.parseArray(data, InfectionStructure.class);
			//System.out.println(list.size());
			isService.insertS(list);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	@ResponseBody
	@RequestMapping("updateS")
	public ResponseModel updateS(String data, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			List<InfectionStructure> list=JSON.parseArray(data, InfectionStructure.class);
			isService.updateS(list);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
}
