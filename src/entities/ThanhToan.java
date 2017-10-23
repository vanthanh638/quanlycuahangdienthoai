package entities;

public class ThanhToan {

	private int id;
	private String ten;
	private String code;
	
	public ThanhToan() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThanhToan(int id, String ten, String code) {
		super();
		this.id = id;
		this.ten = ten;
		this.code = code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
}
