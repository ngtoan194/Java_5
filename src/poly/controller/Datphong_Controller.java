package poly.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.PHONG;

@Transactional
@Controller
public class Datphong_Controller {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("booking")
	public String booking(ModelMap model) {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM PHONG";
			Query query = session.createQuery(hql);
			List<PHONG> list = query.list();
			model.addAttribute("phong", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/booking";
	}
}
