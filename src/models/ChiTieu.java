package models;

public class ChiTieu {
	String MaChi;
	String NoiDungChi;
	String NgayChi;
	Float GiaTien;
	String MaNV;
	public ChiTieu(String MaChi,
	String NoiDungChi,
	String NgayChi,
	Float GiaTien,
	String MaNV)
	{
		this.MaChi = MaChi;
		this.NoiDungChi = NoiDungChi;
		this.NgayChi = NgayChi;
		this.GiaTien = GiaTien;
		this.MaNV = MaNV;
	}
	public String getMaChi() {
		return MaChi;
	}
	public void setMaChi(String maChi) {
		MaChi = maChi;
	}
	public String getNoiDungChi() {
		return NoiDungChi;
	}
	public void setNoiDungChi(String noiDungChi) {
		NoiDungChi = noiDungChi;
	}
	public String getNgayChi() {
		return NgayChi;
	}
	public void setNgayChi(String ngayChi) {
		NgayChi = ngayChi;
	}
	public Float getGiaTien() {
		return GiaTien;
	}
	public void setGiaTien(Float giaTien) {
		GiaTien = giaTien;
	}
	public String getMaNV() {
		return MaNV;
	}
	public void setMaNV(String maNV) {
		MaNV = maNV;
	}
	
	}
