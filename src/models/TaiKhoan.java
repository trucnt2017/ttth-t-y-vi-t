package models;

public class TaiKhoan {

	String TenDN;
	String TenHienThi;
	String MatKhau;
	String PhanQuyen;
	public TaiKhoan() {
	}
	public TaiKhoan(String TenDN, String TenHienThi, String MatKhau, String PhanQuyen) 
		{
			this.TenDN=TenDN;
			this.TenHienThi=TenHienThi;
			this.MatKhau=MatKhau;
			this.PhanQuyen=PhanQuyen;
		}
	public String getTenDN() {
		return TenDN;
	}
	public void setTenDN(String tenDN) {
		TenDN = tenDN;
	}
	public String getTenHienThi() {
		return TenHienThi;
	}
	public void setTenHienThi(String tenHienThi) {
		TenHienThi = tenHienThi;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public String getPhanQuyen() {
		return PhanQuyen;
	}
	public void setPhanQuyen(String phanQuyen) {
		PhanQuyen = phanQuyen;
	}
}
