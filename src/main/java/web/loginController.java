package web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import domain.User;
import service.UserService;

@Controller
public class loginController { 
	@Autowired
	private UserService userService;
	
	/**
	 * 登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ajaxLogin.html", method=RequestMethod.POST)
	@ResponseBody
	public Object loginAjax(HttpServletRequest request, User user, HttpSession session) {
		//返回的数据
		Map<String, Object> result = new HashMap<String, Object>();
		//检查用户名、密码、是否锁定
		User dbUser = userService.getByName(user.getName());
		if (dbUser == null) {
			result.put("msg", "noUser");
		} else if (!dbUser.getPassword().equals(user.getPassword())) {
			result.put("msg", "noPassword");
		} else {
			result.put("msg", "success");
			//传入session,
			session.setAttribute("userSession", dbUser);
		}
		return result;
	}
	
	/**
	 * 注销
	 * @param request
	 * @return
	 */
	@RequestMapping(value="logout.html")
	public String indexPage(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("userSession");
		return "redirect:index.html";
	}
	
	/**
	 * 后台登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ajaxAdminLogin.html", method=RequestMethod.POST)
	@ResponseBody
	public Object loginAdminAjax(HttpServletRequest request, User user, HttpSession session) {
		//返回的数据
		Map<String, Object> result = new HashMap<String, Object>();
		//检查用户名、密码、是否锁定
		User dbUser = userService.getByName(user.getName());
		if (dbUser == null) {
			result.put("msg", "noUser");
		} else if (dbUser.getUsertype()==1) {
			result.put("msg", "noAdmin");
		} else if (!dbUser.getPassword().equals(user.getPassword())) {
			result.put("msg", "noPassword");
		} else {
			if(dbUser.getUsertype()==2) result.put("msg", "successSaler");
			else if(dbUser.getUsertype()==3) result.put("msg", "successAdmin");
			//传入session
			session.setAttribute("userSession", dbUser);
		}
		return result;
	}
}
