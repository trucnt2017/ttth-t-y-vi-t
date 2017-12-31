package models;

public class DiemHV {
	String MaHV;
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
	public Float getDiem() {
		return Diem;
	}
	public void setDiem(Float diem) {
		Diem = diem;
	}
	String MaLop;
	Float Diem;
	public DiemHV() {
	}
	public DiemHV(String MaHV, String MaLop, Float Diem) 
		{
			this.MaHV=MaHV;
			this.MaLop=MaLop;
			this.Diem=Diem;
		}

}
