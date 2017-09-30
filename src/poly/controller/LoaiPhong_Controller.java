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

import poly.entity.LOAI_PHONG;


@Transactional
@Controller
public class LoaiPhong_Controller {
	@Autowired
	SessionFactory factory;

	@RequestMapping("rooms")
	public String rooms(ModelMap model) {
		Session session = factory.getCurrentSession();
		try {
			String hql = "FROM LOAI_PHONG";
			Query query = session.createQuery(hql);
			List<LOAI_PHONG> list = query.list();
			model.addAttribute("loai_phong", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/rooms";
	}
}
