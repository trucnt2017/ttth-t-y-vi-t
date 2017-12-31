package models;

public class LopHoc {
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
	public String getMaNV() {
		return MaNV;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	public String getTenLop() {
		return TenLop;
	}
	public void setTenLop(String tenLop) {
		TenLop = tenLop;
	}
	public Float getThoiGianHoc() {
		return ThoiGianHoc;
	}
	public void setThoiGianHoc(Float thoiGianHoc) {
		ThoiGianHoc = thoiGianHoc;
	}
	public String getCaDK() {
		return CaDK;
	}
	public void setCaDK(String caDK) {
		CaDK = caDK;
	}
	public String getNgayKhaiGiang() {
		return NgayKhaiGiang;
	}
	public void setNgayKhaiGiang(String ngayKhaiGiang) {
		NgayKhaiGiang = ngayKhaiGiang;
	}
	String MaKhoa;
	String MaNV;
	String TenLop;
	Float ThoiGianHoc;
	String CaDK;
	String NgayKhaiGiang;
	public LopHoc(String MaLop,	String MaKhoa,String MaNV,	String TenLop,Float ThoiGianHoc,String CaDK,String NgayKhaiGiang) {
		this.MaLop = MaLop;
		this.MaKhoa = MaKhoa;
		this.MaNV = MaNV;
		this.TenLop = TenLop;
		this.ThoiGianHoc = ThoiGianHoc;
		this.CaDK = CaDK;
		this.NgayKhaiGiang = NgayKhaiGiang;
	}
}
