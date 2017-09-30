package DAO;

import java.util.List;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import poly.entity.LOAI_PHONG;


@Transactional
public class PhongDAO {

	@Autowired
	SessionFactory factory;
	DataSource dataSource;

	public List<LOAI_PHONG> loadAllPhong() {
		Session ss = factory.getCurrentSession();
		ss.getTransaction().begin();
		Query qr = ss.createQuery("FROM LOAI_PHONG");
		List<LOAI_PHONG> list = qr.list();
		return list;
	}
	
	public static void main(String[] args) {
		List<LOAI_PHONG> listPhong = new PhongDAO().loadAllPhong();
		for (LOAI_PHONG lp : listPhong) {
			System.out.println("Mã Phòng: "+lp.getID_LP() +"| Tên phòng: " +lp.getTEN_LOAI());
		}
	}
}
