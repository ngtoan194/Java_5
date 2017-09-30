package poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.TAI_KHOAN;

@Transactional
@Controller
public class Login_Controller {

	@Autowired
	SessionFactory factory;

	@RequestMapping("admin-login")
	public String login() {
		return "pages/admin-login";
	}

	public boolean checkLogin(String tk, String mk) {
		Session session = factory.getCurrentSession();
//		String tk = request.getParameter("username");
//		String mk = request.getParameter("password");
		String hql = "FROM TAI_KHOAN WHERE USER_NAME = '" + tk + "' AND PASS_WORD = '" + mk + "' ";
		List<TAI_KHOAN> list = session.createQuery(hql).list();
		if(list.size() > 0) {	
			return true;
		}
		return false;
	}
	
	@RequestMapping("check-login")
	public String adindex(ModelMap model, HttpServletRequest request) {
		String result = "pages/admin-login";
		Session session = factory.getCurrentSession();
		String tk = request.getParameter("username");
		String mk = request.getParameter("password");
		
		boolean check = true;
		if(tk.trim().length() == 0) {
			check = false;
			model.addAttribute("mess2", "Bạn chưa nhập tài khoản!");
		}if(mk.trim().length() == 0) {
			check = false;
			model.addAttribute("mess3", "Bạn chưa nhập mật khẩu!");		
		}
		if(check) {
			if(checkLogin(tk, mk)) {
				HttpSession ss = request.getSession();
				ss.setAttribute("tk", tk);
				result = "admin/admin-index";
			} else {
				model.addAttribute("mess4", "Tên đăng nhập hoặc mật khẩu không đúng vui lòng thử lại!");
			}
		}
		return result;
	}
}
