package entities;


public class PhuKien {
	int id;
	SanPham sanpham;
	String loailienquan;
	String dienthoailienquan;
	String danhgia;
	
	public PhuKien() {
		// TODO Auto-generated constructor stub
	}

	public PhuKien(int id, SanPham sanpham, String loailienquan, String dienthoailienquan, String danhgia) {
		super();
		this.id = id;
		this.sanpham = sanpham;
		this.loailienquan = loailienquan;
		this.dienthoailienquan = dienthoailienquan;
		this.danhgia = danhgia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SanPham getSanpham() {
		return sanpham;
	}

	public void setSanpham(SanPham sanpham) {
		this.sanpham = sanpham;
	}

	public String getLoailienquan() {
		return loailienquan;
	}

	public void setLoailienquan(String loailienquan) {
		this.loailienquan = loailienquan;
	}

	public String getDienthoailienquan() {
		return dienthoailienquan;
	}

	public void setDienthoailienquan(String dienthoailienquan) {
		this.dienthoailienquan = dienthoailienquan;
	}

	public String getDanhgia() {
		return danhgia;
	}

	public void setDanhgia(String danhgia) {
		this.danhgia = danhgia;
	}
	
}
