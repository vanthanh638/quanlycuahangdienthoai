package entities;

public class LoaiSanPham {

	private int id_loaisanpham;
	
	private String tenloai;
	private int id_cha;
	
	public LoaiSanPham() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoaiSanPham(int id_loaisanpham, String tenloai, int id_cha) {
		super();
		this.id_loaisanpham = id_loaisanpham;
		this.tenloai = tenloai;
		this.id_cha = id_cha;
	}

	public int getId_loaisanpham() {
		return id_loaisanpham;
	}

	public void setId_loaisanpham(int id_loaisanpham) {
		this.id_loaisanpham = id_loaisanpham;
	}

	public String getTenloai() {
		return tenloai;
	}

	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}

	public int getId_cha() {
		return id_cha;
	}

	public void setId_cha(int id_cha) {
		this.id_cha = id_cha;
	}
}
