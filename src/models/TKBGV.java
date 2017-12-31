package models;

public class TKBGV {
	
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public String getMaKhoa() {
		return MaKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		MaKhoa = maKhoa;
	}
	public String getMaPhong() {
		return MaPhong;
	}
	public void setMaPhong(String maPhong) {
		MaPhong = maPhong;
	}
	public String getNgayHoc() {
		return NgayHoc;
	}
	public void setNgayHoc(String ngayHoc) {
		NgayHoc = ngayHoc;
	}
	String MaLop;
	String MaKhoa;
	String MaPhong;
	String NgayHoc;
	
	public TKBGV() {}
	public TKBGV(String MaLop, String MaKhoa,String MaPhong, String NgayHoc)
	{
		this.MaLop=MaLop;
		this.MaKhoa=MaKhoa;
		this.MaPhong=MaPhong;
		this.NgayHoc=NgayHoc;
		
	}

}
