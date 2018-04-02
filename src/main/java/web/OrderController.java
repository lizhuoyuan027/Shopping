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

import service.OrderService;
import service.UserService;
import domain.Order;
import domain.User;

@Controller
public class OrderController {
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	
	/**
	 * 下订单
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/ajaxBuy.html", method=RequestMethod.POST)
	@ResponseBody
	public Object buyAjax(HttpServletRequest request, HttpSession session, Order order, String password) {
		Map<String, Object> result = new HashMap<String, Object>();
		User user = (User)session.getAttribute("userSession");
		User dbUser = userService.getById(user.getId());
		if(dbUser.getPassword().equals(password)) {
			//添加订单
			orderService.add(order);
			result.put("msg", "success");
		} else {
			result.put("msg", "noPassword");
		}
		return result;
	}
	
	/**
	 * 收货
	 * @param request
	 * @param order
	 * @return
	 */
	@RequestMapping("operate.html")
	public String operate(HttpServletRequest request, Order order) {
		order.setStatus(4);
		orderService.update(order);
		return "redirect:order.html";
	}
	
	/**
	 * 发货
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_deliverOrder.html")
	public String deliverOrder(HttpServletRequest request, int id, String salermessage) {
		Order order = orderService.getById(id);
		order.setSalermessage(salermessage);
		order.setStatus(2);
		orderService.update(order);
		return "redirect:admin_listOrder.html";
	}
	
	/**
	 * 拒绝发货
	 * @param request
	 * @param id
	 * @param salermessage
	 * @return
	 */
	@RequestMapping("admin_refuseOrder.html")
	public String refuseOrder(HttpServletRequest request, int id, String salermessage) {
		Order order = orderService.getById(id);
		order.setSalermessage(salermessage);
		order.setStatus(3);
		orderService.update(order);
		return "redirect:admin_listOrder.html";
	}
}