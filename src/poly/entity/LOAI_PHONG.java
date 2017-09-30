package poly.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class LOAI_PHONG {

	@Id
	private int ID_LP;

	@OneToMany(mappedBy = "loai_phong", fetch = FetchType.EAGER)
	private Collection<PHONG> phong;

	private String TEN_LOAI;
	private String MO_TA;
	private String ANH;

	public int getID_LP() {
		return ID_LP;
	}

	public void setID_LP(int iD_LP) {
		ID_LP = iD_LP;
	}

	public Collection<PHONG> getPhong() {
		return phong;
	}

	public void setPhong(Collection<PHONG> phong) {
		this.phong = phong;
	}

	public String getTEN_LOAI() {
		return TEN_LOAI;
	}

	public void setTEN_LOAI(String tEN_LOAI) {
		TEN_LOAI = tEN_LOAI;
	}

	public String getMO_TA() {
		return MO_TA;
	}

	public void setMO_TA(String mO_TA) {
		MO_TA = mO_TA;
	}

	public String getANH() {
		return ANH;
	}

	public void setANH(String aNH) {
		ANH = aNH;
	}

}
