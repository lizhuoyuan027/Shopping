package web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.OrderService;
import service.UserService;
import domain.Order;
import domain.User;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	
	/**
	 * 修改个人信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ajaxUserUpdate.html", method=RequestMethod.POST)
	@ResponseBody
	public Object userUpdateAjax(HttpServletRequest request, User user, HttpSession session) {
		//返回的数据
		Map<String, Object> result = new HashMap<String, Object>();
		User userSession = (User)session.getAttribute("userSession");
		user.setId(userSession.getId());
		if (userService.update(user)) {
			result.put("msg", "success");
			user = userService.getById(user.getId());
			session.setAttribute("userSession", user);
		} else {
			result.put("msg", "error");
		}
		return result;
	}
	
	/**
	 * 修改新密码
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ajaxPasswordUpdate.html", method=RequestMethod.POST)
	@ResponseBody
	public Object passwordUpdateAjax(HttpServletRequest request, HttpSession session, 
			@RequestParam(value="newPassword",required=false) String password) {
		//返回的数据
		Map<String, Object> result = new HashMap<String, Object>();
		User userSession = (User)session.getAttribute("userSession");
		userSession.setPassword(password);
		if (userService.update(userSession)) {
			result.put("msg", "success");
			userSession = userService.getById(userSession.getId());
			session.setAttribute("userSession", userSession);
		} else {
			result.put("msg", "error");
		}
		return result;
	}
	
	/**
	 * 添加用户
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/admin_ajaxAddUser.html", method=RequestMethod.POST)
	@ResponseBody
	public Object addUser(HttpServletRequest request, User user) {
		//返回的数据
		Map<String, Object> result = new HashMap<String, Object>();
		User dbUser = userService.getByName(user.getName());
		if (dbUser == null) {
			result.put("msg", "success");
			userService.add(user);
		} else {
			result.put("msg", "hasUser");
		}
		return result;
	}
	
	/**
	 * 编辑用户
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("admin_editUser.html")
	public String editUser(HttpServletRequest request, User user) {
		userService.update(user);
		return "redirect:admin_listUser.html";
	}
	
	/**
	 * 删除用户
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/admin_ajaxDeleteUser.html", method=RequestMethod.POST)
	@ResponseBody
	public Object deleteUserAjax(HttpServletRequest request, int uid) {
		//返回的数据
		Map<String, Object> result = new HashMap<String, Object>();
		List<Order> orders = orderService.listByUid(uid);
		if (orders.size()==0) {
			userService.deleteById(uid);
			result.put("msg", "success");
		} else {
			result.put("msg", "error");
		}
		return result;
	}
}
