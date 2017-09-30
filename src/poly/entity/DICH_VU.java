package poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class DICH_VU {

	@Id
	@GeneratedValue
	private int ID_DV;
	private String TEN_DV;
	private String ANH;
	private String GIOI_THIEU;
	private Float GIA;
	private String MOTA_1;
	private String MOTA_2;
	private String MOTA_3;
	private String MOTA_4;
	private String MOTA_5;

	public int getID_DV() {
		return ID_DV;
	}

	public void setID_DV(int iD_DV) {
		ID_DV = iD_DV;
	}

	public String getTEN_DV() {
		return TEN_DV;
	}

	public void setTEN_DV(String tEN_DV) {
		TEN_DV = tEN_DV;
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

	public Float getGIA() {
		return GIA;
	}

	public void setGIA(Float gIA) {
		GIA = gIA;
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

}
