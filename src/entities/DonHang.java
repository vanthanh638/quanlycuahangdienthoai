package entities;

import java.util.Date;
import java.util.Set;

public class DonHang {

	private int id;
	private String hoten;
	private String diachi;
	private String sodienthoai;
	private String ngaykhoitao;
	private int trangthai;
	private Set<ChiTietDonHang> chiTietDonHangs;
	private NguoiDung nguoidung;
	private ThanhToan thanhToan;
	
	public DonHang() {
		super();
	}

	public DonHang(int id, String hoten, String diachi, String sodienthoai, String ngaykhoitao, int trangthai,
			Set<ChiTietDonHang> chiTietDonHangs, NguoiDung nguoidung, ThanhToan thanhToan) {
		super();
		this.id = id;
		this.hoten = hoten;
		this.diachi = diachi;
		this.sodienthoai = sodienthoai;
		this.ngaykhoitao = ngaykhoitao;
		this.trangthai = trangthai;
		this.chiTietDonHangs = chiTietDonHangs;
		this.nguoidung = nguoidung;
		this.thanhToan = thanhToan;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getSodienthoai() {
		return sodienthoai;
	}

	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}

	public String getNgaykhoitao() {
		return ngaykhoitao;
	}

	public void setNgaykhoitao(String ngaykhoitao) {
		this.ngaykhoitao = ngaykhoitao;
	}

	public int getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}

	public Set<ChiTietDonHang> getChiTietDonHangs() {
		return chiTietDonHangs;
	}

	public void setChiTietDonHangs(Set<ChiTietDonHang> chiTietDonHangs) {
		this.chiTietDonHangs = chiTietDonHangs;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public ThanhToan getThanhToan() {
		return thanhToan;
	}

	public void setThanhToan(ThanhToan thanhToan) {
		this.thanhToan = thanhToan;
	}
	
	
}
