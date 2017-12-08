package dao;

import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import defines.Defines;
import entities.ChiTietDonHang;
import entities.DonHang;

public class ChiTietDonHangDao {

	private static String url = Defines.url + "chitietdonhang";
	
	public ChiTietDonHang getItem(int i) {
		String uri = url + "/" + i;
		
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		ChiTietDonHang result = null;
		
		Gson gson = new Gson();
		result = gson.fromJson(jsonString, ChiTietDonHang.class);
		return result;
	}

	public ChiTietDonHang udateItem(ChiTietDonHang chiTietDonHang) {
		String uri = url + "/update";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, chiTietDonHang);
		return chiTietDonHang;
	}

}
