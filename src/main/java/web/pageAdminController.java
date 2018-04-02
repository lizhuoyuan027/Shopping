package web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.CategoryService;
import service.OrderService;
import service.ProductService;
import service.UserService;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cons.CommonConstant;
import domain.Category;
import domain.Order;
import domain.Product;
import domain.User;

@Controller
public class pageAdminController {
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	OrderService orderService;
	@Autowired
	UserService userService;
	
	/**
	 * 首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin.html")
	public ModelAndView indexPage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("admin/index");
		return view;
	}
	
	/**
	 * 类别
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_listCategory.html")
	public ModelAndView listCategoryPage(HttpServletRequest request, 
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		ModelAndView view = new ModelAndView();
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
		List<Category> categories = categoryService.list();
		PageInfo<Category> pagedCategories = new PageInfo<Category>(categories);
		view.addObject("pageInfo", pagedCategories);
		view.setViewName("admin/listCategory");
		return view;
	}
	
	/**
	 * 商品
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_listProduct.html")
	public ModelAndView listProductPage(HttpServletRequest request, int cid,
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		ModelAndView view = new ModelAndView();
		Category category = categoryService.getById(cid);
		
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
		List<Product> products = productService.getByCId(cid);
		PageInfo<Product> pagedProducts = new PageInfo<Product>(products);
		
		view.addObject("category", category);
		view.addObject("pageInfo", pagedProducts);
		view.setViewName("admin/listProduct");
		return view;
	}
	
	/**
	 * 订单
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_listOrder.html")
	public ModelAndView listOrderPage(HttpServletRequest request,
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		ModelAndView view = new ModelAndView();
		
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
		List<Order> orders = orderService.list();
		productService.fill(orders);
		userService.fill(orders);
		PageInfo<Order> pagedOrders = new PageInfo<Order>(orders);
		
		view.addObject("pageInfo", pagedOrders);
		view.setViewName("admin/listOrder");
		return view;
	}
	
	/**
	 * 用户
	 * @param request
	 * @return
	 */
	@RequestMapping(value="admin_listUser.html")
	public ModelAndView listUserPage(HttpServletRequest request,
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		ModelAndView view = new ModelAndView();
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
		List<User> users = userService.list();
		PageInfo<User> pagedUsers = new PageInfo<User>(users);
		view.addObject("pageInfo", pagedUsers);
		view.setViewName("admin/listUser");
		return view;
	}
}
