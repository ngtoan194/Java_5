package poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.DICH_VU;

@Controller
@Transactional
public class Admin_DichVu_Controller {
	@Autowired
	SessionFactory factory;
	ServletContext context;

	@RequestMapping("quan-ly-dich-vu")
	public String dulieuloaiphong(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();
		int page_count = 1;
		int page_current = 0;

		try {
			page_current = (Integer.parseInt(request.getParameter("pages").trim())*2)-2;
			Query query = session.createQuery("FROM DICH_VU");
			List<DICH_VU> page_list = query.list();
			if(page_list.size()%2 != 0) {
				page_count = page_list.size()/2+1;
			}else page_count = page_list.size()/2;
			
			model.addAttribute("pages",page_count);
			query.setFirstResult(page_current);
			query.setMaxResults(2);
			List<DICH_VU> service_list = query.list();
			model.addAttribute("dich_vu",service_list);
		} catch (Exception e) {
			Query query = session.createQuery("FROM DICH_VU");
			List<DICH_VU> page_list = query.list();
			if(page_list.size()%2 != 0) {
				page_count = page_list.size()/2+1;
			}else page_count = page_list.size()/2;
			
			model.addAttribute("pages",page_count);
			query.setFirstResult(0);
			query.setMaxResults(2);
			List<DICH_VU> service_list = query.list();
			model.addAttribute("dich_vu",service_list);
		}

		return "admin/quan-ly-dich-vu";
	}

	@RequestMapping(value = "themdichvu", method = RequestMethod.GET)
	public String themdichvu(ModelMap model) {
		model.addAttribute("dich_vu", new DICH_VU());
		return "admin/themdichvu";
	}

	@RequestMapping(value = "themdichvu", method = RequestMethod.POST)
	public String themdichvu(ModelMap model, @ModelAttribute("dich_vu") DICH_VU dich_vu,
			@RequestParam("anh") MultipartFile anh) {

		String filename = anh.getOriginalFilename();
		if (!filename.equals(""))
			try {
				dich_vu.setANH("images/" + filename);
				String photoPath = context.getRealPath("/images/" + anh.getOriginalFilename());

				anh.transferTo(new File(photoPath));
			} catch (Exception e) {

			}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(dich_vu);
			t.commit();
			model.addAttribute("message", "Thêm mới thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("mess3", "Thêm mới thất bại !");
			return "admin/themdichvu";
		} finally {
			session.close();
		}
		return "admin/themdichvu";
	}

}
