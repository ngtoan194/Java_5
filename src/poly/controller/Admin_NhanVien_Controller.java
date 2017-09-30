package poly.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.NHAN_VIEN;

@Transactional
@Controller
@RequestMapping(value = "quan-ly-nhan-vien")
public class Admin_NhanVien_Controller {

	private Map<String, String> sex = new HashMap<>();
	private Map<Integer, String> status = new HashMap<>();

	@Autowired
	SessionFactory factory;
	ServletContext context;

	private List<NHAN_VIEN> loadData(int page_current) {
		Session session = factory.getCurrentSession();

		List<NHAN_VIEN> staff_list = null;

		try {
			Query query = session.createQuery("FROM NHAN_VIEN");
			query.setFirstResult(page_current);
			query.setMaxResults(2);
			staff_list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return staff_list;

	}

	@RequestMapping("")
	public String index(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();

		int page_count = 1;
		int page_current = 0;

		try {
			page_current = (Integer.parseInt(request.getParameter("pages").trim()) * 2) - 2;
			Query query = session.createQuery("FROM NHAN_VIEN");
			List<NHAN_VIEN> page_list = query.list();
			if (page_list.size() % 2 != 0) {
				page_count = page_list.size() / 2 + 1;
			} else
				page_count = page_list.size() / 2;

			model.addAttribute("pages", page_count);
			List<NHAN_VIEN> staff_list = loadData(page_current);
			model.addAttribute("nhan_vien", staff_list);
		} catch (Exception e) {
			Query query = session.createQuery("FROM NHAN_VIEN");
			List<NHAN_VIEN> page_list = query.list();
			if (page_list.size() % 2 != 0) {
				page_count = page_list.size() / 2 + 1;
			} else
				page_count = page_list.size() / 2;

			model.addAttribute("pages", page_count);
			List<NHAN_VIEN> staff_list = loadData(0);
			model.addAttribute("nhan_vien", staff_list);
		}

		return "admin/quan-ly-nhan-vien";
	}

	@RequestMapping(params = "edit", method = RequestMethod.GET)
	public String openEdit(HttpServletRequest request, NHAN_VIEN nhan_vien, ModelMap model) {
		int id = 0;
		String result = "admin/quan-ly-nhan-vien";

		Session session = factory.getCurrentSession();

		if (request.getParameter("id").trim() != null) {
			try {
				id = Integer.parseInt(request.getParameter("id").trim());
				Query query = session.createQuery("FROM NHAN_VIEN WHERE ID_NV = " + id);
				List<NHAN_VIEN> staff = query.list();
				sex.clear();
				status.clear();
				sex.put("Nam", "Nam");
				sex.put("Nữ", "Nữ");
				model.addAttribute("sex", sex);
				status.put(1, "Active");
				status.put(0, "Deactive");
				model.addAttribute("status", status);
				NHAN_VIEN nv = staff.get(0);
				model.addAttribute("nhan_vien", nv);
				model.addAttribute("currentAvatar", nv.getANH());
				result = "admin/update-nhan-vien";
			} catch (Exception e) {
				int page_count = 1;
				Query query = session.createQuery("FROM NHAN_VIEN");
				List<NHAN_VIEN> page_list = query.list();
				if (page_list.size() % 2 != 0) {
					page_count = page_list.size() / 2 + 1;
				} else
					page_count = page_list.size() / 2;

				model.addAttribute("pages", page_count);
				query.setFirstResult(0);
				query.setMaxResults(2);
				List<NHAN_VIEN> staff_list = query.list();
				model.addAttribute("nhan_vien", staff_list);
				model.addAttribute("mess", "Vui lòng nhấn vào nút sửa bên cạnh nhân viên cần sửa!");
				result = "admin/quan-ly-nhan-vien";
			}
		}
		return result;
	}

	@RequestMapping(params = "edit", method = RequestMethod.POST)
	public String edit(ModelMap model, @RequestParam("anh") MultipartFile anh,
			@ModelAttribute("nhan_vien") NHAN_VIEN nhan_vien, BindingResult errors,
			@RequestParam("currentAvatar") String currentAvatar, @RequestParam("tempAge") String tempAge) {
		if (nhan_vien.getHO_TEN().trim().isEmpty()) {
			errors.rejectValue("HO_TEN", "nhan_vien", "Không được bỏ trống tên");
		}
		if (tempAge.trim().isEmpty()) {
			errors.rejectValue("TUOI", "nhan_vien", "Không được bỏ trống tuổi");
		} else {
			try {
				int age = Integer.parseInt(tempAge.trim());
				if(age < 1 && age > 200) {
					errors.rejectValue("TUOI", "nhan_vien", "Tuổi không hợp lệ");
				}else nhan_vien.setTUOI(age);
			} catch (Exception e) {
				errors.rejectValue("TUOI", "nhan_vien", "Tuổi không hợp lệ");
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("mess", "Vui lòng sửa các lỗi sau đây");
			model.addAttribute("nhan_vien", nhan_vien);
			model.addAttribute("currentAvatar", currentAvatar);
		} else {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();

			String filename = anh.getOriginalFilename();

			if (filename.equals("")) {
				// errors.rejectValue("anh", "nhan_vien", "Vui lòng chọn ảnh!");
				try {
					nhan_vien.setANH(currentAvatar);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (!filename.equals("")) {
				try {
					nhan_vien.setANH("images/" + filename);
					String photoPath = context.getRealPath("/images/" + anh.getOriginalFilename());
					anh.transferTo(new File(photoPath));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			try {
				session.update(nhan_vien);
				t.commit();
				Query query = session.createQuery("FROM NHAN_VIEN WHERE ID_NV =" + nhan_vien.getID_NV());
				List<NHAN_VIEN> updated = query.list();
				nhan_vien = updated.get(0);
				model.addAttribute("nhan_vien", nhan_vien);
				model.addAttribute("mess", "Cập nhật thành công");
				model.addAttribute("currentAvatar", nhan_vien.getANH());
				// System.out.println("thanh cong");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("mess", "Cập nhật thất bại");
				// System.out.println("that bai");
				e.printStackTrace();
			} finally {
				session.close();
			}
		}
		sex.clear();
		status.clear();
		sex.put("Nam", "Nam");
		sex.put("Nữ", "Nữ");
		model.addAttribute("sex", sex);
		status.put(1, "Active");
		status.put(0, "Deactive");
		model.addAttribute("status", status);
		return "admin/update-nhan-vien";
	}

	@RequestMapping(params = "add", method = RequestMethod.GET)
	public String openAdd(HttpServletRequest request, NHAN_VIEN nhan_vien, ModelMap model) {
		String result = "admin/add-nhan-vien";

		Session session = factory.getCurrentSession();

		try {
			sex.put("Nam", "Nam");
			sex.put("Nữ", "Nữ");
			model.addAttribute("sex", sex);
			status.put(1, "Active");
			status.put(0, "Deactive");
			model.addAttribute("status", status);
			model.addAttribute("nhan_vien", nhan_vien);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(params = "add", method = RequestMethod.POST)
	public String add(ModelMap model, @RequestParam("anh") MultipartFile anh,
			@ModelAttribute("nhan_vien") NHAN_VIEN nhan_vien, BindingResult errors) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		String filename = anh.getOriginalFilename();

		if (filename.equals("")) {
			// errors.rejectValue("anh", "nhan_vien", "Vui lòng chọn ảnh!");
			try {
				nhan_vien.setANH("images/default_avatar.jpg");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (!filename.equals("")) {
			try {
				nhan_vien.setANH("images/" + filename);
				String photoPath = context.getRealPath("/images/" + anh.getOriginalFilename());
				anh.transferTo(new File(photoPath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			session.save(nhan_vien);
			t.commit();
			// Session sessionn = factory.getCurrentSession();
			// Query query = sessionn.createQuery("FROM NHAN_VIEN");
			// List<NHAN_VIEN> added = query.list();
			// query = sessionn.createQuery("FROM NHAN_VIEN WHERE ID_NV = "+added.size());
			// added = query.list();
			// nhan_vien = added.get(0);
			model.addAttribute("nhan_vien", nhan_vien);
			model.addAttribute("mess", "Thêm mới thành công");
			// System.out.println("thanh cong");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("mess", "Thêm mới thất bại");
			// System.out.println("that bai");
			e.printStackTrace();
		} finally {
			session.close();
		}
		sex.clear();
		status.clear();
		sex.put("Nam", "Nam");
		sex.put("Nữ", "Nữ");
		model.addAttribute("sex", sex);
		status.put(1, "Active");
		status.put(0, "Deactive");
		model.addAttribute("status", status);
		return "admin/add-nhan-vien";
	}

	@RequestMapping(params = "delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, NHAN_VIEN nhan_vien, ModelMap model) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			nhan_vien.setID_NV(id);
			session.delete(nhan_vien);
			t.commit();
			model.addAttribute("mess", "Xóa thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			model.addAttribute("mess", "Xóa thất bại!");
		} finally {
			session.close();
		}

		return "admin/deleted";
	}
}
