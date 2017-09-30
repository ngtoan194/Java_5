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


@Transactional
@Controller

// @RequestMapping("/pages/")
public class Phong_Controller {

	@Autowired
	SessionFactory factory;

	@RequestMapping("room")
	public String roomdetail(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		String id_lp = request.getParameter("ID_LP");
		try {
			String hql = "FROM PHONG WHERE ID_LP = "+id_lp+"";
			Query query = session.createQuery(hql);
			List<LOAI_PHONG> list = query.list();
			model.addAttribute("phong", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pages/room";
	}

	
}
