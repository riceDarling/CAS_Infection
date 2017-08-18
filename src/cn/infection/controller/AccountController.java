package cn.infection.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.infection.entity.InfectionAccount;
import cn.infection.service.AccountService;
import cn.infection.utils.MD5Util;
import cn.infection.utils.ResponseModel;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;

	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ResponseModel login(InfectionAccount account,HttpServletRequest request,HttpServletResponse response){
		ResponseModel rm=new ResponseModel();
		try{
			UsernamePasswordToken token = new UsernamePasswordToken(account.getName(), MD5Util.encode2hex(account.getPassword()));
			Subject subject = SecurityUtils.getSubject();
			InfectionAccount accountResult = new InfectionAccount();
			subject.login(token);
			if (subject.isAuthenticated()) {
				// 获取验证通过的账户信息
				accountResult = accountService.getAccountByName(account.getName());
				// 管理员登陆成功后，信息保存在session中
				subject.getSession().setAttribute("loginAccount", accountResult);
				rm.setMsg("成功");
				rm.setSuccess(true);
				rm.setT(accountResult);
			} else {
				rm.setMsg("账号和密码不匹配");
			}
		} catch (IncorrectCredentialsException e) {
			rm.setMsg("账号和密码不匹配");
		} catch (ExcessiveAttemptsException e) {
			rm.setMsg("登录失败次数过多,请10分钟后重试");
		} catch (LockedAccountException e) {
			rm.setMsg("账号已被锁定");
		} catch (DisabledAccountException e) {
			rm.setMsg("账号已被冻结");
		} catch (ExpiredCredentialsException e) {
			rm.setMsg("账号已被冻结");
		} catch (UnknownAccountException e) {
			rm.setMsg("账号和密码不匹配");
		} catch (UnauthorizedException e) {
			rm.setMsg("账号和密码不匹配");
		} catch (AuthenticationException e) {
			rm.setMsg("账号和密码不匹配");
		}
		return rm;
	}
	
	
	/**
	 * 新增账号
	 * @param ia
	 */
	@ResponseBody
	@RequestMapping("insert")
	public ResponseModel insertSelective(InfectionAccount ia, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			ia.setPassword(MD5Util.encode2hex(ia.getPassword().trim()));
			accountService.insertSelective(ia);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	/**
	 * 退出登录
	 * 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/exit")
	public ResponseModel exit(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ResponseModel<InfectionAccount> rm = new ResponseModel<InfectionAccount>();
		try {
			// 销毁session
			request.getSession().invalidate();
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
	/**
	 * 修改用户信息
	 * @param ia
	 * @param req
	 * @param resp
	 * @return
	 */
	@ResponseBody
	@RequestMapping("update")
	public ResponseModel update(InfectionAccount ia, HttpServletRequest req, HttpServletResponse resp) {
		ResponseModel rm = new ResponseModel();
		try {
			ia.setPassword(MD5Util.encode2hex(ia.getPassword().trim()));
			accountService.update(ia);
			
			rm.setMsg("成功");
			rm.setSuccess(true);
		} catch (Exception e) {
			rm.init();
		}
		return rm;
	}
	
}
