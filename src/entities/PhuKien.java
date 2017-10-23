package entities;

public class PhuKien {
	
	private int id;
	private SanPham sanpham;
	private String danhgia;
	private String loailienquan;
	private String dienthoailienquan;
	
	public PhuKien() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PhuKien(int id, SanPham sanpham, String danhgia, String loailienquan, String dienthoailienquan) {
		super();
		this.id = id;
		this.sanpham = sanpham;
		this.danhgia = danhgia;
		this.loailienquan = loailienquan;
		this.dienthoailienquan = dienthoailienquan;
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

	public String getDanhgia() {
		return danhgia;
	}

	public void setDanhgia(String danhgia) {
		this.danhgia = danhgia;
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
	
}
