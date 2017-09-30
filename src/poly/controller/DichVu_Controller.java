package poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.DICH_VU;


@Transactional
@Controller
public class DichVu_Controller {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("services")
	public String roomdetail(ModelMap model, HttpServletRequest request ) {
		Session session = factory.getCurrentSession();
		
		int getPage =1;
		if(request.getParameter("pages")!=null) {
			getPage = Integer.parseInt(request.getParameter("pages"));
		}
		try {
			String hql = "FROM DICH_VU";
			Query query = session.createQuery(hql);
			List<DICH_VU> list_count = query.list();
			
			int count = list_count.size();
			int pages = count/2;
			model.addAttribute("pages", pages);
			
			query.setFirstResult((getPage-1) *2);
			query.setMaxResults(2);
			
			List<DICH_VU> list = query.list();
			model.addAttribute("dich_vu", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/services";
	}
	
}
