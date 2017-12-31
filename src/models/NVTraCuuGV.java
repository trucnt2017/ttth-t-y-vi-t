package models;

public class NVTraCuuGV {
	String MaNV;
	public String getMaNV() {
		return MaNV;
	}

	public void setMaNV(String maNV) {
		MaNV = maNV;
	}

	public String getHoNV() {
		return HoNV;
	}

	public void setHoNV(String hoNV) {
		HoNV = hoNV;
	}

	public String getTenNV() {
		return TenNV;
	}

	public void setTenNV(String tenNV) {
		TenNV = tenNV;
	}

	public String getPhai() {
		return Phai;
	}

	public void setPhai(String phai) {
		Phai = phai;
	}

	public String getNgaySinh() {
		return NgaySinh;
	}

	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
	}

	public String getNoiSinh() {
		return NoiSinh;
	}

	public void setNoiSinh(String noiSinh) {
		NoiSinh = noiSinh;
	}

	public String getSoDT() {
		return SoDT;
	}

	public void setSoDT(String soDT) {
		SoDT = soDT;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getFacebook() {
		return Facebook;
	}

	public void setFacebook(String facebook) {
		Facebook = facebook;
	}

	public String getChucVu() {
		return ChucVu;
	}

	public void setChucVu(String chucVu) {
		ChucVu = chucVu;
	}

	public float getLuongCB() {
		return LuongCB;
	}

	public void setLuongCB(float luongCB) {
		LuongCB = luongCB;
	}

	String HoNV;
	String TenNV;
	String Phai;
	String NgaySinh;
	String NoiSinh;
	String SoDT;
	String Email;
	String Facebook;
	String ChucVu;
	float LuongCB;
	
	public NVTraCuuGV(String MaNV, String HoNV, String TenNV, String Phai, String NgaySinh,
	                String NoiSinh, String SoDT, String Email, String Facebook, String ChucVu, float LuongCB) 
		{
			this.MaNV=MaNV;
			this.HoNV=HoNV;
			this.TenNV=TenNV;
			this.Phai=Phai;
			this.NgaySinh=NgaySinh;
			this.NoiSinh=NoiSinh;
			this.SoDT=SoDT;
			this.Email=Email;
			this.Facebook=Facebook;
			this.ChucVu=ChucVu;
			this.LuongCB=LuongCB;
		}
	
}
