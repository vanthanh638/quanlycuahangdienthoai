package entities;

public class NguoiDung {

	private int id;
	private String tendangnhap;
	private String matkhau;
	private String tendaydu;
	private String diachi;
	private String sodienthoai;
	private String email;
	private int active;
	VaiTro vaitro;
	
	public NguoiDung() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NguoiDung(int id, String tendangnhap, String matkhau, String tendaydu, String diachi, String sodienthoai,
			String email, int active, VaiTro vaitro) {
		super();
		this.id = id;
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
		this.tendaydu = tendaydu;
		this.diachi = diachi;
		this.sodienthoai = sodienthoai;
		this.email = email;
		this.active = active;
		this.vaitro = vaitro;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getTendaydu() {
		return tendaydu;
	}

	public void setTendaydu(String tendaydu) {
		this.tendaydu = tendaydu;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public VaiTro getVaitro() {
		return vaitro;
	}

	public void setVaitro(VaiTro vaitro) {
		this.vaitro = vaitro;
	}
}
