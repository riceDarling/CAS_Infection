package cn.infection.controller.utils;

import java.io.File;
import java.net.InetAddress;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.infection.utils.ResponseModel;

/**
 * 文件上传控制器
 * 
 * @author SunTo
 * 
 */
@Controller
@RequestMapping("upload")
public class UploadController {

	@ResponseBody
	@RequestMapping("file")
	public ResponseModel<String> uploadimg(MultipartFile file, HttpServletRequest request) {
		ResponseModel<String> rm = new ResponseModel<String>();
		try {
			//获得本机IP 
			//String addr = InetAddress.getLocalHost().getHostAddress();
			String addr = "localhost";

			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获取文件 存储位置
			String realPath = request.getSession().getServletContext().getRealPath("/UploadFile");
			String imgType = file.getOriginalFilename();
			String filename = uuid + imgType.substring(imgType.lastIndexOf('.'));
			// 将文件copy上传到服务器
			file.transferTo(new File(realPath + "/" + filename));
			
			addr+=":8080/Infection/UploadFile/" + filename;
			rm.setMsg("成功");
			rm.setSuccess(true);
			rm.setT(addr);

		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
}
