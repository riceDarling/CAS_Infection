package cn.infection.controller.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 文件下载控制器
 * 
 * @author SunTo
 * 
 */
@Controller
@RequestMapping("download")
public class DownloadController {

	// 文件下载 主要方法
	@ResponseBody
	@RequestMapping("file")
	public static void file(HttpServletRequest request, HttpServletResponse response, String storeName) throws Exception {

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
		response.setHeader("Content-disposition", "attachment; filename=" + new String(storeName.getBytes("utf-8"), "iso-8859-1"));
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
	
	// 文件下载 主要方法
	@ResponseBody
	@RequestMapping("filePdf")
	public static void filePdf(HttpServletRequest request, HttpServletResponse response, String fileName) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		// 获取项目根目录
		String ctxPath = request.getSession().getServletContext().getRealPath("");
		
		// 获取下载文件路径
		String downLoadPath = ctxPath + "/infection/pdf/" + fileName + ".pdf";
		
		// 获取文件的长度
		long fileLength = new File(downLoadPath).length();
		
		// 设置文件输出类型
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "iso-8859-1") + ".pdf");
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
