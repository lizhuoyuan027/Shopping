package web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.CategoryService;
import service.OrderService;
import service.ProductService;
import service.UserService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cons.CommonConstant;
import domain.Category;
import domain.Order;
import domain.Product;
import domain.User;

@Controller
public class pageController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private OrderService orderService;
	
	/**
	 * 首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="index.html")
	public ModelAndView indexPage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		List<Category> categories = categoryService.list();
        productService.fillIndex(categories);
        view.addObject("categories",categories);
		view.setViewName("user/index");
		return view;
	}
	
	/**
	 * 登录
	 * @param request
	 * @return
	 */
	@RequestMapping(value="login.html")
	public ModelAndView loginPage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("user/login");
		return view;
	}
	
	/**
	 * 个人信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="account.html")
	public ModelAndView accountPage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("user/account");
		return view;
	}
	
	/**
	 * 类别
	 * @param request
	 * @return
	 */
	@RequestMapping(value="category.html")
	public ModelAndView categoryPage(HttpServletRequest request, int cid,
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		ModelAndView view = new ModelAndView();
		List<Category> categories = categoryService.list();
		Category category = categoryService.getById(cid);
		
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
        List<Product> products = productService.getByCId(cid);
        PageInfo<Product> pagedProducts = new PageInfo<Product>(products);
        
        view.addObject("categories",categories);
        view.addObject("category",category);
        view.addObject("pageInfo",pagedProducts);
		view.setViewName("user/category");
		return view;
	}
	
	/**
	 * 商品
	 * @param request
	 * @param cid
	 * @return
	 */
	@RequestMapping(value="product.html")
	public ModelAndView productPage(HttpServletRequest request, int id) {
		ModelAndView view = new ModelAndView();
		List<Category> categories = categoryService.list();
		Product product = productService.getById(id);
		view.addObject("categories",categories);
		view.addObject("product",product);
		view.setViewName("user/product");
		return view;
	}
	
	/**
	 * 购买
	 * @param request
	 * @param cid
	 * @return
	 */
	@RequestMapping(value="buy.html")
	public ModelAndView buyPage(HttpServletRequest request,int pid, int num) {
		ModelAndView view = new ModelAndView();
		Product product = productService.getById(pid);
		view.addObject("product",product);
		view.addObject("num", num);
		view.setViewName("user/buy");
		return view;
	}
	
	/**
	 * 订单
	 * @param request
	 * @param cid
	 * @return
	 */
	@RequestMapping(value="order.html")
	public ModelAndView orderPage(HttpServletRequest request, HttpSession session,
			@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			@RequestParam(value="status", required=false, defaultValue="0") Integer status) {
		ModelAndView view = new ModelAndView();
		User user = (User)session.getAttribute("userSession");
		
		List<Order> orders = null;
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
		if(status==0) orders = orderService.listByUid(user.getId());
		else orders = orderService.listByUidAndStatus(user.getId(), status);
		productService.fill(orders);
		PageInfo<Order> pagedOrders = new PageInfo<Order>(orders);
		
		view.addObject("pageInfo", pagedOrders);
		view.addObject("status", status);
		view.setViewName("user/order");
		return view;
	}
}
