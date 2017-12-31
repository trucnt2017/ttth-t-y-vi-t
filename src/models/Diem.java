package models;

public class Diem {
	String MaDiem;
	public String getMaDiem() {
		return MaDiem;
	}
	public void setMaDiem(String maDiem) {
		MaDiem = maDiem;
	}
	public String getMaHV() {
		return MaHV;
	}
	public void setMaHV(String maHV) {
		MaHV = maHV;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getMaNV() {
		return MaNV;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	public Float getDiem() {
		return Diem;
	}
	public void setDiem(Float diem) {
		Diem = diem;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
	String MaHV;
	String MaLop;
	String MaNV;
	Float Diem;
	String GhiChu;
	public Diem() {}
	public Diem(String MaDiem,String MaHV, String MaLop, String MaNV, Float Diem, String GhiChu)
	{
		this.MaDiem=MaDiem;
		this.MaHV=MaHV;
		this.MaLop=MaLop;
		this.MaNV=MaNV;
		this.Diem=Diem;
		this.GhiChu=GhiChu;
	}
}
