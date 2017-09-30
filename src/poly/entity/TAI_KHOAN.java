package poly.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class TAI_KHOAN {

	@Id
	@GeneratedValue
	private int ID_TK;
	
	@ManyToOne
	@JoinColumn(name="ID_NV")
	private NHAN_VIEN nhan_vien;
	
	private String USER_NAME;
	private String PASS_WORD;
	private int STATUS;
	public int getID_TK() {
		return ID_TK;
	}
	public void setID_TK(int iD_TK) {
		ID_TK = iD_TK;
	}
	public NHAN_VIEN getNhan_vien() {
		return nhan_vien;
	}
	public void setNhan_vien(NHAN_VIEN nhan_vien) {
		this.nhan_vien = nhan_vien;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getPASS_WORD() {
		return PASS_WORD;
	}
	public void setPASS_WORD(String pASS_WORD) {
		PASS_WORD = pASS_WORD;
	}
	public int getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}
	
	
}
