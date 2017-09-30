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
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.DICH_VU;

@Transactional
@Controller
public class ChiTietDichDu_Controller {

	@Autowired
	SessionFactory factory;

	@RequestMapping("servicedetail")
	public String roomdetail(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		String id_dv = request.getParameter("ID_DV");

		try {
			String hql = "FROM DICH_VU WHERE ID_DV = " + id_dv + "";
			Query query = session.createQuery(hql);
			List<DICH_VU> list = query.list();
			model.addAttribute("dich_vu", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/servicedetail";
	}
}
