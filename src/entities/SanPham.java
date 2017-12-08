package entities;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class SanPham {

	private int id;
	
	@NotEmpty(message="Tên sản phẩm không được để trống")
	private String tensanpham;
	private String hinhanh;
	private LoaiSanPham loaiSanPham;
	private int luotxem;
	
	private int soluongdaban;
	
//	@NotNull(message="Giá không được trống") 
//	@NumberFormat(style = Style.NUMBER)
	private int gia;
	
//	@NotNull(message="Số lượng không được trống") 
//	@NumberFormat(style = Style.NUMBER)
//	@Pattern(regexp = "[\\s]*[0-9]*[1-9]+",message="Số lượng là một số")
	private int soluongconlai;
	
	public SanPham() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SanPham(int id, String tensanpham, String hinhanh, LoaiSanPham loaiSanPham,
			int luotxem, int soluongdaban, int gia, int soluongconlai) {
		super();
		this.id = id;
		this.tensanpham = tensanpham;
		this.hinhanh = hinhanh;
		this.loaiSanPham = loaiSanPham;
		this.luotxem = luotxem;
		this.soluongdaban = soluongdaban;
		this.gia = gia;
		this.soluongconlai = soluongconlai;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}


	public LoaiSanPham getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(LoaiSanPham loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	public int getLuotxem() {
		return luotxem;
	}

	public void setLuotxem(int luotxem) {
		this.luotxem = luotxem;
	}

	public int getSoluongdaban() {
		return soluongdaban;
	}

	public void setSoluongdaban(int soluongdaban) {
		this.soluongdaban = soluongdaban;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getSoluongconlai() {
		return soluongconlai;
	}

	public void setSoluongconlai(int soluongconlai) {
		this.soluongconlai = soluongconlai;
	}
	
	
}
