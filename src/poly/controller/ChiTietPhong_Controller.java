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

import poly.entity.LOAI_PHONG;
import poly.entity.PHONG;

@Transactional
@Controller
public class ChiTietPhong_Controller {

	@Autowired
	SessionFactory factory;

	@RequestMapping("roomdetail")
	public String roomdetail(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		String id_phong = request.getParameter("ID_PHONG");
		try {
			String hql = "FROM PHONG WHERE ID_PHONG = " + id_phong + "";
			Query query = session.createQuery(hql);
			List<LOAI_PHONG> list = query.list();
			model.addAttribute("phong", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/roomdetail";
	}

}
