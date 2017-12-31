package models;

public class KhoaHoc {
	String MaKhoa;
	String TenKhoa;
	String NgayMoKhoa;
	String NoiDung;
	public KhoaHoc(String MaKhoa,String TenKhoa,String NgayMoKhoa,String NoiDung)
	{
		this.MaKhoa = MaKhoa;
		this.TenKhoa = TenKhoa;
		this.NgayMoKhoa = NgayMoKhoa;
		this.NoiDung = NoiDung;
	}
	public String getMaKhoa() {
		return MaKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		MaKhoa = maKhoa;
	}
	public String getTenKhoa() {
		return TenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		TenKhoa = tenKhoa;
	}
	public String getNgayMoKhoa() {
		return NgayMoKhoa;
	}
	public void setNgayMoKhoa(String ngayMoKhoa) {
		NgayMoKhoa = ngayMoKhoa;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
}
