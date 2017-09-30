package poly.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Parent;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class NHAN_VIEN {

	@Id
	@GeneratedValue
	private int ID_NV;
	@NotBlank(message="Không được để trống họ và tên")
	private String HO_TEN;
	private String GIOI_TINH;
	@NotNull(message="Không được để trống tuổi")	
	@DecimalMin(value="1",message="Tuổi không hợp lệ")
	@DecimalMax(value="200",message="Tuổi không hợp lệ")
	private int TUOI;
	private String ANH;
	private int STATUS;
	
	@OneToMany(mappedBy = "nhan_vien", fetch = FetchType.EAGER)
	private Collection<TAI_KHOAN> tai_khoan;

	public int getID_NV() {
		return ID_NV;
	}

	public void setID_NV(int iD_NV) {
		ID_NV = iD_NV;
	}

	public String getHO_TEN() {
		return HO_TEN;
	}

	public void setHO_TEN(String hO_TEN) {
		HO_TEN = hO_TEN;
	}

	public String getGIOI_TINH() {
		return GIOI_TINH;
	}

	public void setGIOI_TINH(String gIOI_TINH) {
		GIOI_TINH = gIOI_TINH;
	}

	public int getTUOI() {
		return TUOI;
	}

	public void setTUOI(int tUOI) {
		TUOI = tUOI;
	}

	public String getANH() {
		return ANH;
	}

	public void setANH(String aNH) {
		ANH = aNH;
	}

	public int getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}

	public Collection<TAI_KHOAN> getTai_khoan() {
		return tai_khoan;
	}

	public void setTai_khoan(Collection<TAI_KHOAN> tai_khoan) {
		this.tai_khoan = tai_khoan;
	}
	
	
}
