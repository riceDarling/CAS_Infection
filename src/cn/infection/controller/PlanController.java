package cn.infection.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.infection.entity.InfectionAccount;
import cn.infection.entity.InfectionPlan;
import cn.infection.service.InfectionPlanService;
import cn.infection.utils.ResponseModel;

@Controller
@RequestMapping("/plan")
public class PlanController {

	@Autowired
	private InfectionPlanService infectionPlanService;

	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			int[] schoolId = { 3, 4, 5, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34 };
			for (int y = 0; y < schoolId.length; y++) {
				for (int i = 1; i < 13; i++) {
					InfectionPlan ifp = new InfectionPlan();
					ifp.setPlanid(i);
					ifp.setSchoolid(schoolId[y]);
					infectionPlanService.insert(ifp);
				}
			}

			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	@ResponseBody
	@RequestMapping("getPlan")
	public ResponseModel getPlan(HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			Subject subject = SecurityUtils.getSubject();
			InfectionAccount account = (InfectionAccount) subject.getSession().getAttribute("loginAccount");
			if (account.getLevel() == 1) {
				// 1管理员，查看所有的信息

			} else {
				// 0查看当前登录账户学校的信息
				rm.setObj(infectionPlanService.getBySchoolId(account.getSchoolId()));
			}
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	@ResponseBody
	@RequestMapping("getPlanBySchoolId")
	public ResponseModel getPlanBySchoolId(Integer schoolId, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {

			rm.setObj(infectionPlanService.getBySchoolId(schoolId));

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
			rm.setT(infectionPlanService.selectById(id));
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	@ResponseBody
	@RequestMapping("update")
	public ResponseModel update(InfectionPlan ifp, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			infectionPlanService.updateByPrimaryKey(ifp);
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}

	@ResponseBody
	@RequestMapping("filedown")
	public void filedown(Integer id, HttpServletRequest request, HttpServletResponse response) throws Exception {

		InfectionPlan ifp = infectionPlanService.selectById(id);
		String url = ifp.getPlanimg();
		String[] sts = url.split("UploadFile/");
		String storeName = sts[1];
		String strExtionName=storeName.substring(storeName.lastIndexOf("."));
		String fileName = ifp.getSchoolName() + ifp.getPlanName()+strExtionName;

		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		// 获取项目根目录
		String ctxPath = request.getSession().getServletContext().getRealPath("");

		// 获取下载文件路径
		String downLoadPath = ctxPath + "/UploadFile/" + storeName;

		// 获取文件的长度
		long fileLength = new File(downLoadPath).length();

		// 设置文件输出类型
		response.setContentType("application/octet-stream");
		
		response.setHeader("Content-disposition", "attachment; filename=" +new String(fileName.getBytes("utf-8"), "iso-8859-1"));
		// 设置输出长度
		response.setHeader("Content-Length", String.valueOf(fileLength));
		// 获取输入流
		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		// 输出流
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		// 关闭流
		bis.close();
		bos.close();

	}
}
