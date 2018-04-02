package web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cons.CommonConstant;
import service.CategoryService;
import service.ProductService;
import domain.Category;
import domain.Product;

@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	
	/**
	 * 搜索
	 * @param key
	 * @param cid
	 * @param page
	 * @return
	 */
	@RequestMapping("search.html")
	public ModelAndView searchProductPage(
			@RequestParam(value="key", required=false, defaultValue="") String key, 
			@RequestParam(value="cid", required=false, defaultValue="0") int cid, 
			@RequestParam(value="page", required=false, defaultValue="1") int page) {
		ModelAndView view = new ModelAndView();
		List<Category> categories = categoryService.list();
		
		PageHelper.startPage(page, CommonConstant.PAGE_SIZE);
		List<Product> products = productService.search(key,cid);
		PageInfo<Product> pagedProducts = new PageInfo<Product>(products);
		
		view.addObject("categories",categories);
		view.addObject("pageInfo", pagedProducts);
		view.addObject("key", key);
		view.addObject("cid", cid);
		view.setViewName("user/search");
		return view;
	} 
	
	/**
	 * 添加商品
	 * @param session
	 * @param product
	 * @param image
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("admin_addProduct.html")
	public String addProduct(HttpSession session, Product product,
			MultipartFile image) throws Exception {
		productService.add(product);
		
		if(!image.isEmpty()) {
			String path = session.getServletContext().getRealPath("eshop/images/product");
			String name = product.getId()+".jpg";
			File file = new File(path, name);
			image.transferTo(file);
		}
		
		return "redirect:admin_listProduct.html?cid="+product.getCid();
	}
	
	/**
	 * 编辑商品页面
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_editProduct.html")
	public ModelAndView editProductPage(HttpSession session, int id) {
		ModelAndView view = new ModelAndView();
		Product product = productService.getById(id);
		Category category = categoryService.getById(product.getCid());
		view.addObject("product", product);
		view.addObject("category", category);
		view.setViewName("admin/editProduct");
		return view;
	}
	
	/**
	 * 更改商品
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_updateProduct.html")
	public String updateProduct(HttpSession session, Product product,
			MultipartFile image) throws Exception {
		productService.update(product);
		
		if(!image.isEmpty()) {
			String path = session.getServletContext().getRealPath("eshop/images/product");
			String name = product.getId()+".jpg";
			File file = new File(path, name);
			image.transferTo(file);
		}
		
		return "redirect:admin_listProduct.html?cid="+product.getCid();
	}
	
	/**
	 * 删除商品
	 * @param request
	 * @return
	 */
	@RequestMapping("admin_deleteProduct.html")
	public String deleteProduct(HttpSession session, int id, int cid) {
		productService.deleteById(id);
		
		String path = session.getServletContext().getRealPath("eshop/images/product");
		String name = id+".jpg";
		File file = new File(path, name);
		if(file.exists()) {
			file.delete();
		}
		
		return "redirect:admin_listProduct.html?cid="+cid;
	}
}
