package util;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import domain.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object object) throws Exception {
		// HttpSession session = request.getSession();
		// String contextPath = session.getServletContext().getContextPath();
		String contextPath = request.getContextPath();
		String[] noNeedAuthPage = new String[] { 
				"ajaxLogin.html", 
				"ajaxAdminLogin.html",
				"index.html",
				"admin.html", 
				"login.html", 
				"category.html", 
				"product.html", 
				"search.html"
		};
		String[] adminPage = new String[] {
				"admin_listUser.html",
				"admin_ajaxAddUser.html",
				"admin_ajaxDeleteUser.html",
				"admin_editUser.html"
		};
		String uri = request.getRequestURI();
		uri = uri.replaceFirst(contextPath+"/", "");
		if (!Arrays.asList(noNeedAuthPage).contains(uri)) {
			User user = (User) request.getSession().getAttribute("userSession");
			if (user == null) {
				//游客
				if (uri.startsWith("admin")) response.sendRedirect("admin.html");
				else response.sendRedirect("login.html");
				return false;
			} else if (uri.startsWith("admin")) {
				//普通用户
				if(user.getName().equals("admin") && !Arrays.asList(adminPage).contains(uri)) {
					//管理员
					response.sendRedirect("admin.html");
					return false;
				} else if(user.getName().equals("saler") && Arrays.asList(adminPage).contains(uri)) {
					//销售商
					response.sendRedirect("admin.html");
					return false;
				}
			}
		}
		return true;
	}

}
