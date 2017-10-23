package entities;

public class VaiTro {

	private int id_vaitro;
	private String role;
	private String tenvaitro;
	
	public VaiTro() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VaiTro(int id_vaitro, String role, String tenvaitro) {
		super();
		this.id_vaitro = id_vaitro;
		this.role = role;
		this.tenvaitro = tenvaitro;
	}

	public int getId_vaitro() {
		return id_vaitro;
	}

	public void setId_vaitro(int id_vaitro) {
		this.id_vaitro = id_vaitro;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getTenvaitro() {
		return tenvaitro;
	}

	public void setTenvaitro(String tenvaitro) {
		this.tenvaitro = tenvaitro;
	}
	
	
}
