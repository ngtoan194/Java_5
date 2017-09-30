package poly.controller;

import java.io.File;
import java.util.List;

import javax.mail.Multipart;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.LOAI_PHONG;
import poly.entity.PHONG;

@Transactional
@Controller
public class Admin_Phong_Controller {

	@Autowired
	SessionFactory factory;
	ServletContext context;

	@RequestMapping("quan-ly-loai-phong")
	public String dulieuloaiphong(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		int getPage = 1;
		if (request.getParameter("pages") != null) {
			getPage = Integer.parseInt(request.getParameter("pages"));
		}

		try {
			String hql = "FROM LOAI_PHONG";
			Query query = session.createQuery(hql);
			List<PHONG> list_count = query.list();

			int count = list_count.size();
			int pages = count / 5;
			model.addAttribute("pages", pages);

			query.setFirstResult((getPage - 1) * 5);
			query.setMaxResults(5);

			List<PHONG> list = query.list();
			model.addAttribute("loai_phong", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/quan-ly-loai-phong";
	}

	@RequestMapping(value = "themloaiphong", method = RequestMethod.GET)
	public String themloaiphong(ModelMap model) {
		model.addAttribute("loai_phong", new LOAI_PHONG());
		return "admin/themloaiphong";
	}

	@RequestMapping(value = "themloaiphong", method = RequestMethod.POST)
	public String themloaiphong(ModelMap model, @ModelAttribute("loai_phong") LOAI_PHONG loai_phong,
			@RequestParam("anh") MultipartFile anh, BindingResult errors) {

	

		String filename = anh.getOriginalFilename();

		if (filename.equals("")) {
			errors.rejectValue("ANH", "loai_phong", "Vui lòng chọn ảnh!");
		} else if (!filename.equals("")) {
			
			
			try {
				loai_phong.setANH("images/" + filename);
				String photoPath = context.getRealPath("/images/" + anh.getOriginalFilename());

				anh.transferTo(new File(photoPath));
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(loai_phong);
			t.commit();
			model.addAttribute("mess3", "Thêm mới thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("mess3", "Thêm mới thất bại !");
			return "admin/themloaiphong";
		} finally {
			session.close();
		}
		return "admin/themloaiphong";
	}

	@RequestMapping(value = "delete")
	@Transactional
	public String remove(LOAI_PHONG loai_phong, ModelMap model, HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			loai_phong.setID_LP(id);
			session.delete(loai_phong);
			t.commit();
			model.addAttribute("mess5", "Xóa thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("mess5", "Xóa thất bại!");
			t.rollback();
		} finally {
			session.close();
		}
		return "admin/quan-ly-loai-phong";

	}

	// @RequestMapping(value = "sualoaiphong")
	// public String sualoaiphong(ModelMap model) {
	// model.addAttribute("loai_phong", new LOAI_PHONG());
	// return "admin/sualoaiphong";
	// }

	@RequestMapping(value = "sualoaiphong", method = RequestMethod.GET)
	public String sualoaiphong(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		int id = 0;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}

		String hql = "FROM LOAI_PHONG WHERE ID_LP = " + id + "";

		Query query = session.createQuery(hql);
		List<LOAI_PHONG> list = query.list();
		Object list2 = list.get(0);

		model.addAttribute("loai_phong", list2);
		return "admin/sualoaiphong";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(ModelMap model, @RequestParam("anh") MultipartFile anh,
			@ModelAttribute("loai_phong") LOAI_PHONG loai_phong, BindingResult errors) {

		if (loai_phong.getID_LP() == 0) {
			errors.rejectValue("ID_LP", "loai_phong", "Vui lòng nhập mã loại phòng!");
		}
		if (loai_phong.getTEN_LOAI().trim().length() == 0) {
			errors.rejectValue("TEN_LOAI", "loai_phong", "Vui lòng nhập tên loại phòng!");
		}
		if (loai_phong.getMO_TA().trim().length() == 0) {
			errors.rejectValue("MO_TA", "loai_phong", "Vui lòng nhập mô tả!");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
		}

		String filename = anh.getOriginalFilename();

		if (filename.equals("")) {
			errors.rejectValue("ANH", "loai_phong", "Vui lòng chọn ảnh!");
		} else if (!filename.equals("")) {
			try {
				loai_phong.setANH("images/" + filename);
				String photoPath = context.getRealPath("/images/" + anh.getOriginalFilename());
				anh.transferTo(new File(photoPath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(loai_phong);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công");
			System.out.println("thanh cong");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại");
			System.out.println("that bai");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return "admin/sualoaiphong";
	}

	@RequestMapping("quan-ly-phong")
	public String rooms(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		int getPage = 1;
		if (request.getParameter("pages") != null) {
			getPage = Integer.parseInt(request.getParameter("pages"));
		}

		try {
			String hql = "FROM PHONG";
			Query query = session.createQuery(hql);
			List<PHONG> list_count = query.list();

			int count = list_count.size();
			int pages = count / 5;
			model.addAttribute("pages", pages);

			query.setFirstResult((getPage - 1) * 5);
			query.setMaxResults(5);

			List<PHONG> list = query.list();
			model.addAttribute("phong", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/quan-ly-phong";
	}

	// @RequestMapping(value = "insert", method = RequestMethod.GET)
	// public String insert(ModelMap model) {
	// model.addAttribute("phong", new PHONG());
	// return "admin/themphong";
	// }
	//
	// @RequestMapping(value = "insert", method = RequestMethod.POST)
	// public String insert(ModelMap model, @ModelAttribute("phong") PHONG phong) {
	// Session session = factory.openSession();
	// Transaction t = session.beginTransaction();
	// try {
	// session.save(phong);
	// t.commit();
	// model.addAttribute("message", "Thêm mới thành công !");
	// } catch (Exception e) {
	// t.rollback();
	// model.addAttribute("message", "Thêm mới thất bại !");
	// } finally {
	// session.close();
	// }
	// return "admin/themphong";
	// }
}
