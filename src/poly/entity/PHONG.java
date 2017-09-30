package poly.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PHONG {

	@Id
	private int ID_PHONG;

	@ManyToOne
	@JoinColumn(name = "ID_LP")
	private LOAI_PHONG loai_phong;

	private String TEN_PHONG;
	private String ANH;
	private String GIOI_THIEU;
	private int SLPHONG;
	private int SLNGUOI;
	private Float GIA_PHONG;
	private String MOTA_1;
	private String MOTA_2;
	private String MOTA_3;
	private String MOTA_4;
	private String MOTA_5;
	private String MOTA_6;
	private String MOTA_7;
	private String TIENICH_1;
	private String TIENICH_2;
	private String TIENICH_3;
	private String TIENICH_4;
	private String TIENICH_5;
	private String TIENICH_6;
	private String TIENICH_7;
	private String TIENICH_8;
	private String TIENICH_9;
	private String TIENICH_10;
	private int STATUS;

	public int getID_PHONG() {
		return ID_PHONG;
	}

	public void setID_PHONG(int iD_PHONG) {
		ID_PHONG = iD_PHONG;
	}

	public LOAI_PHONG getLoai_phong() {
		return loai_phong;
	}

	public void setLoai_phong(LOAI_PHONG loai_phong) {
		this.loai_phong = loai_phong;
	}

	public String getTEN_PHONG() {
		return TEN_PHONG;
	}

	public void setTEN_PHONG(String tEN_PHONG) {
		TEN_PHONG = tEN_PHONG;
	}

	public String getANH() {
		return ANH;
	}

	public void setANH(String aNH) {
		ANH = aNH;
	}

	public String getGIOI_THIEU() {
		return GIOI_THIEU;
	}

	public void setGIOI_THIEU(String gIOI_THIEU) {
		GIOI_THIEU = gIOI_THIEU;
	}

	public int getSLPHONG() {
		return SLPHONG;
	}

	public void setSLPHONG(int sLPHONG) {
		SLPHONG = sLPHONG;
	}

	public int getSLNGUOI() {
		return SLNGUOI;
	}

	public void setSLNGUOI(int sLNGUOI) {
		SLNGUOI = sLNGUOI;
	}

	public Float getGIA_PHONG() {
		return GIA_PHONG;
	}

	public void setGIA_PHONG(Float gIA_PHONG) {
		GIA_PHONG = gIA_PHONG;
	}

	public String getMOTA_1() {
		return MOTA_1;
	}

	public void setMOTA_1(String mOTA_1) {
		MOTA_1 = mOTA_1;
	}

	public String getMOTA_2() {
		return MOTA_2;
	}

	public void setMOTA_2(String mOTA_2) {
		MOTA_2 = mOTA_2;
	}

	public String getMOTA_3() {
		return MOTA_3;
	}

	public void setMOTA_3(String mOTA_3) {
		MOTA_3 = mOTA_3;
	}

	public String getMOTA_4() {
		return MOTA_4;
	}

	public void setMOTA_4(String mOTA_4) {
		MOTA_4 = mOTA_4;
	}

	public String getMOTA_5() {
		return MOTA_5;
	}

	public void setMOTA_5(String mOTA_5) {
		MOTA_5 = mOTA_5;
	}

	public String getMOTA_6() {
		return MOTA_6;
	}

	public void setMOTA_6(String mOTA_6) {
		MOTA_6 = mOTA_6;
	}

	public String getMOTA_7() {
		return MOTA_7;
	}

	public void setMOTA_7(String mOTA_7) {
		MOTA_7 = mOTA_7;
	}

	public String getTIENICH_1() {
		return TIENICH_1;
	}

	public void setTIENICH_1(String tIENICH_1) {
		TIENICH_1 = tIENICH_1;
	}

	public String getTIENICH_2() {
		return TIENICH_2;
	}

	public void setTIENICH_2(String tIENICH_2) {
		TIENICH_2 = tIENICH_2;
	}

	public String getTIENICH_3() {
		return TIENICH_3;
	}

	public void setTIENICH_3(String tIENICH_3) {
		TIENICH_3 = tIENICH_3;
	}

	public String getTIENICH_4() {
		return TIENICH_4;
	}

	public void setTIENICH_4(String tIENICH_4) {
		TIENICH_4 = tIENICH_4;
	}

	public String getTIENICH_5() {
		return TIENICH_5;
	}

	public void setTIENICH_5(String tIENICH_5) {
		TIENICH_5 = tIENICH_5;
	}

	public String getTIENICH_6() {
		return TIENICH_6;
	}

	public void setTIENICH_6(String tIENICH_6) {
		TIENICH_6 = tIENICH_6;
	}

	public String getTIENICH_7() {
		return TIENICH_7;
	}

	public void setTIENICH_7(String tIENICH_7) {
		TIENICH_7 = tIENICH_7;
	}

	public String getTIENICH_8() {
		return TIENICH_8;
	}

	public void setTIENICH_8(String tIENICH_8) {
		TIENICH_8 = tIENICH_8;
	}

	public String getTIENICH_9() {
		return TIENICH_9;
	}

	public void setTIENICH_9(String tIENICH_9) {
		TIENICH_9 = tIENICH_9;
	}

	public String getTIENICH_10() {
		return TIENICH_10;
	}

	public void setTIENICH_10(String tIENICH_10) {
		TIENICH_10 = tIENICH_10;
	}

	public int getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}

}
