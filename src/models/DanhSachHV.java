package models;

public class DanhSachHV {
	String MaHV;
	public String getMaHV() {
		return MaHV;
	}
	public void setMaHV(String maHV) {
		MaHV = maHV;
	}
	public String getHoHV() {
		return HoHV;
	}
	public void setHoHV(String hoHV) {
		HoHV = hoHV;
	}
	public String getTenHV() {
		return TenHV;
	}
	public void setTenHV(String tenHV) {
		TenHV = tenHV;
	}
	public String getPhai() {
		return Phai;
	}
	public void setPhai(String phai) {
		Phai = phai;
	}
	public String getNoiSinh() {
		return NoiSinh;
	}
	public void setNoiSinh(String noiSinh) {
		NoiSinh = noiSinh;
	}
	String HoHV;
	String TenHV;
	String Phai;
	String NoiSinh;
	public DanhSachHV() {
	}
	public DanhSachHV(String MaHV, String HoHV, String TenHV, String Phai, String NoiSinh) 
		{
			this.MaHV=MaHV;
			this.HoHV=HoHV;
			this.TenHV=TenHV;
			this.Phai=Phai;
			this.NoiSinh=NoiSinh;
		}
}
