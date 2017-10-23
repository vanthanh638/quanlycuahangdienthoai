package defines;

public class Defines {
	private String publicUrl;
	private String adminUrl;
	public final static int row_count = 10;
	public final static String url = "http://192.168.1.3:8082/";

	public Defines() {
		super();
	}

	

	public Defines(String publicUrl, String adminUrl) {
		super();
		this.publicUrl = publicUrl;
		this.adminUrl = adminUrl;
	}



	public String getPublicUrl() {
		return publicUrl;
	}



	public void setPublicUrl(String publicUrl) {
		this.publicUrl = publicUrl;
	}



	public static int getRowCount() {
		return row_count;
	}



	public String getAdminUrl() {
		return adminUrl;
	}

	public void setAdminUrl(String adminUrl) {
		this.adminUrl = adminUrl;
	}
	

}
