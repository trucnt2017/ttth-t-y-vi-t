package models;

public class TKBHV {
	String MaLop;
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

	public String getMaNV() {
		return MaNV;
	}

	public void setMaNV(String maNV) {
		MaNV = maNV;
	}

	public String getNgayHoc() {
		return NgayHoc;
	}

	public void setNgayHoc(String ngayHoc) {
		NgayHoc = ngayHoc;
	}

	String MaKhoa;
	String MaPhong;
	String MaNV;
	String NgayHoc;
	public TKBHV() {}
	
	public TKBHV(String MaLop, String MaKhoa, String MaPhong, String MaNV, String NgayHoc)
	{
		this.MaLop=MaLop;
		this.MaKhoa=MaKhoa;
		this.MaPhong=MaPhong;
		this.MaNV=MaNV;
		this.NgayHoc=NgayHoc;
	}
}
