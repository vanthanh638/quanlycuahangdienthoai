package entities;

public class ChiTietDonHang {

	private int id;
	private SanPham sanpham;
	private int gia;
	private int soluong;
	
	public ChiTietDonHang(int id, SanPham sanpham, int gia, int soluong) {
		super();
		this.id = id;
		this.sanpham = sanpham;
		this.gia = gia;
		this.soluong = soluong;
	}

	public ChiTietDonHang() {
		super();
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

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	
}
