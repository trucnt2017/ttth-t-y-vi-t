package models;

public class Phong {
    String MaPhong;
    String MaNV;
    String TenPhong;
    int SucChua;
    
	public Phong() {
		// TODO Auto-generated constructor stub
	}
    public Phong(String MaPhong, String MaNV, String TenPhong, int SucChua) {
    	this.MaPhong=MaPhong;
    	this.MaNV=MaNV;
    	this.TenPhong=TenPhong;
    	this.SucChua=SucChua;
    	
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
	public String getTenPhong() {
		return TenPhong;
	}
	public void setTenPhong(String tenPhong) {
		TenPhong = tenPhong;
	}
	public int getSucChua() {
		return SucChua;
	}
	public void setSucChua(int sucChua) {
		SucChua = sucChua;
	}
	
}
